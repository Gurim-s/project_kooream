package com.kooream.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kooream.domain.Criteria;
import com.kooream.domain.HashtagVO;
import com.kooream.domain.ProductVO;
import com.kooream.domain.StyleProductTagVO;
import com.kooream.domain.StyleImageVO;
import com.kooream.domain.StyleQuery;
import com.kooream.domain.StyleTagVO;
import com.kooream.domain.StyleVO;
import com.kooream.mapper.StyleImageMapper;
import com.kooream.mapper.StyleMapper;
import com.kooream.mapper.StyleProductTagMapper;
import com.kooream.mapper.StyleReplyMapper;
import com.kooream.mapper.StyleTagMapper;
import com.kooream.mapper.BidShopMapper;
import com.kooream.mapper.HashtagMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class StyleServiceImpl implements StyleService{
	private StyleMapper mapper;
	private StyleImageMapper imageMapper;
	private StyleReplyMapper replyMapper;
	private StyleTagMapper styleTagMapper;
	private HashtagMapper hashtagMapper;
	private StyleProductTagMapper productTagMapper;
	private BidShopMapper productMapper;
	
	@Override
	public List<StyleVO> getList(StyleQuery query) {
		List<StyleVO> list = mapper.getList(query); 
		switch(query.getCategory()) {
		case "hot":
			list = mapper.getHotList(query);
			break;
		case "recent":
			list = mapper.getRecentList(query);
			break;
		case "follow":
			list = mapper.getFollowList(query);
			break;
		case "tag":
			list = mapper.getTagList(query);
			break;
		case "product":
			list = mapper.getProductList(query);
			break;
		case "member":
			list = mapper.getMemberList(query);
		}
		
		for (StyleVO styleVO : list) {
			long style_no = styleVO.getStyle_no();
			List<StyleImageVO> images = imageMapper.getImagesByStyle_no(style_no);
			styleVO.setStyle_image(images);
		}
		return list;
	}
	
	@Override
	public List<StyleVO> getListByHashTag(Criteria cri, String hashtag) {
//		long tag_no = styleTagMapper.getTagNoByHashtag(hashtag);
//		List<StyleVO> list = mapper.getListByHashTag(cri);
		
		return null;
	}
	
	@Override
	public StyleVO get(long style_no) {
		StyleVO style = mapper.get(style_no);
		List<StyleImageVO> images = imageMapper.getImagesByStyle_no(style_no);
		List<List<StyleProductTagVO>> productTagList = new ArrayList<List<StyleProductTagVO>>();
		for (int i=0; i<images.size(); i++) {
			StyleProductTagVO vo = new StyleProductTagVO();
			vo.setStyle_no(style_no);
			vo.setIdx(i);
			
			List<StyleProductTagVO> tagList = productTagMapper.getTagList(vo);
			productTagList.add(tagList);
		}
		
//		List<Integer> pnoList = productTagMapper.getPNoListByStyleNo(style_no);
//		List<ProductVO> productList = new ArrayList<>(); 
//		if (pnoList != null && pnoList.size() != 0) {
//			for (Integer pno : pnoList) {
//				productList.add(productMapper.read(pno));
//			}
//		}
		
		style.setStyle_image(images);
//		style.setProductList(productList);
		style.setProductTagList(productTagList);
		return style;
	}
	
	@Override
	public List<StyleImageVO> getImageList(long style_no) {
		return imageMapper.getImagesByStyle_no(style_no);
	}
	
	@Override
	@Transactional
	public void register(StyleVO vo) {
		mapper.insert(vo);		
		long style_no = mapper.getStyle_no();
		List<StyleImageVO> imageList = vo.getStyle_image(); 
		if (imageList != null && imageList.size() != 0) {
			for (int i=0; i<imageList.size(); i++) {
				StyleImageVO image = imageList.get(i);
				image.setStyle_no(style_no);
				imageMapper.insert(image);
				
				if (vo.getProductTagList() != null && vo.getProductTagList().size() > i) {
					List<StyleProductTagVO> productTagList = vo.getProductTagList().get(i);
					for (StyleProductTagVO productTag : productTagList) {
						productTag.setStyle_no(style_no);
						productTag.setIdx(i);
						productTagMapper.insert(productTag);
					}
				}
			}
		}
		
//		피드백
		if (vo.getHashtags() != null) {
			for (String hashtag : vo.getHashtags()) {
				long tag_no = hashtagMapper.getTagNo(hashtag);
				if (tag_no == 0) {
					hashtagMapper.insert(hashtag);
					tag_no = hashtagMapper.getTagNo(hashtag);
				}
				
				StyleTagVO styleTag = new StyleTagVO();
				styleTag.setTag_no(tag_no);
				styleTag.setStyle_no(style_no);
				styleTagMapper.insert(styleTag);
			}
		}
	}
	
	@Override
	@Transactional
	public boolean remove(long style_no) {
		if (mapper.getCountReply(style_no) > 0) {
			replyMapper.deleteByStyleNo(style_no);
		}
		imageMapper.deleteAll(style_no);
		if (styleTagMapper.getCountTags(style_no) > 0) {
			styleTagMapper.deleteByStyleNo(style_no);
		}
		return mapper.delete(style_no) == 1;
	}
	
	@Override
	@Transactional
	public void update(StyleVO vo) {
		long style_no = vo.getStyle_no();
		List<String> newHashtags = vo.getHashtags();
		List<HashtagVO> oldHashtagsVO = hashtagMapper.getHashtagListByStyleNo(style_no);
		
		List<String> oldHashtags = oldHashtagsVO.stream().map(HashtagVO::getHashtag).collect(Collectors.toList());
		StyleTagVO styleTag = new StyleTagVO();
		newHashtags.stream().filter(x -> !oldHashtags.contains(x))
			.forEach(x -> {
				hashtagMapper.insert(x);
				long tag_no = hashtagMapper.getTagNo(x);
				styleTag.setStyle_no(style_no);
				styleTag.setTag_no(tag_no);
				styleTagMapper.insert(styleTag);
			});
		oldHashtagsVO.stream().filter(x -> !newHashtags.contains(x.getHashtag()))
			.forEach(x -> {
				hashtagMapper.deleteByTagNo(x.getTag_no());
				styleTag.setStyle_no(style_no);
				styleTag.setTag_no(x.getTag_no());
				styleTagMapper.delete(styleTag);
			});
		mapper.update(vo);
	}
}