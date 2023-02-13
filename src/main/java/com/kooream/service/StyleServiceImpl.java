package com.kooream.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kooream.domain.Criteria;
import com.kooream.domain.HashtagVO;
import com.kooream.domain.ImageFileVO;
import com.kooream.domain.MemberVO;
import com.kooream.domain.ProductVO;
import com.kooream.domain.ProductTagVO;
import com.kooream.domain.StyleImageVO;
import com.kooream.domain.StyleQuery;
import com.kooream.domain.StyleTagVO;
import com.kooream.domain.StyleVO;
import com.kooream.mapper.StyleImageMapper;
import com.kooream.mapper.StyleLikeMapper;
import com.kooream.mapper.StyleMapper;
import com.kooream.mapper.StyleProductTagMapper;
import com.kooream.mapper.StyleReplyMapper;
import com.kooream.mapper.StyleTagMapper;
import com.kooream.security.UserSession;
import com.kooream.mapper.BidShopMapper;
import com.kooream.mapper.HashtagMapper;
import com.kooream.mapper.MemberImageMapper;
import com.kooream.mapper.MemberMapper;

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
	private StyleLikeMapper styleLikeMapper;
	private MemberMapper memberMapper;
	private MemberImageMapper memberImageMapper;
	private HashtagMapper hashtagMapper;
	private StyleProductTagMapper productTagMapper;
	
	@Override
	public List<StyleVO> getList(StyleQuery query) {
		List<StyleVO> list = new ArrayList<StyleVO>(); 
		
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
		case "following":
			MemberVO userSession = new UserSession().getSession();
			int m_no = userSession.getM_no();
			query.setM_no(m_no);
			list = mapper.getMemberList(query);
			break;
		}

		for (StyleVO style : list) {
			ImageFileVO profile_image = new ImageFileVO();
			profile_image.setUploadPath(style.getM_uploadpath());
			profile_image.setFileName(style.getM_filename());
			profile_image.setUuid(style.getM_uuid());
			style.setProfile_image(profile_image);
			
			ImageFileVO main_image = new ImageFileVO();
			main_image.setFileName(style.getFilename());
			main_image.setUuid(style.getUuid());
			main_image.setUploadPath(style.getUploadpath());
			style.setMain_image(main_image);
		}
		return list;
	}
	
	public List<StyleVO> getListSlow(StyleQuery query) {
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
		
		for (StyleVO style : list) {
			long style_no = style.getStyle_no();
			int m_no = style.getM_no();
			List<ImageFileVO> images = imageMapper.getImagesByStyle_no(style_no);
			MemberVO writer = memberMapper.getMemberInfoByMno(m_no);
			ImageFileVO profileImage = memberImageMapper.getProfile(m_no);
			
			style.setStyle_image(images);
			style.setWriter(writer);
			style.setProfile_image(profileImage);
		}
		return list;
	}
	
	@Override
	public StyleVO get(long style_no) {
		StyleVO style = mapper.get(style_no);
		List<ImageFileVO> images = imageMapper.getImagesByStyle_no(style_no);
		List<List<ProductTagVO>> productTagList = new ArrayList<List<ProductTagVO>>();
		for (int i=0; i<images.size(); i++) {
			ProductTagVO vo = new ProductTagVO();
			vo.setStyle_no(style_no);
			vo.setIdx(i);
			
			List<ProductTagVO> tagList = productTagMapper.getTagList(vo);
			productTagList.add(tagList);
		}
		
//		MemberVO writer = memberMapper.getMemberInfoByMno(style.getM_no());
//		ImageFileVO profile = memberImageMapper.getProfile(style.getM_no());
//		writer.setProfileImage(profile);
//		style.setWriter(writer);
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
	public Map<Long, List<ImageFileVO>> getImageListByStyleNoList(List<Long> styleNoList) {
		return imageMapper.getImageListByStyleNoList(styleNoList)
			.stream()
			.collect(Collectors.groupingBy(ImageFileVO::getStyle_no));
	}
	
	@Override
	public Map<Long, List<ProductTagVO>> getProductTagListByStyleNoList(List<Long> styleNoList) { 
		return productTagMapper.getProductTagListByStyleNoList(styleNoList)
				.stream()
				.collect(Collectors.groupingBy(ProductTagVO::getStyle_no));
	}
	
	@Override
	public List<ImageFileVO> getImageList(long style_no) {
		return imageMapper.getImagesByStyle_no(style_no);
	}
	
	@Override
	@Transactional
	public void register(StyleVO vo) {
		List<ImageFileVO> imageList = vo.getStyle_image();

		ImageFileVO mainImage = imageList.get(0);
		vo.setFilename(mainImage.getFileName());
		vo.setUuid(mainImage.getUuid());
		vo.setUploadpath(mainImage.getUploadPath());
		vo.setCount_image(imageList.size());
		mapper.insert(vo);
		
		long style_no = mapper.getStyle_no();
		if (imageList != null && imageList.size() != 0) {
			for (int i=0; i<imageList.size(); i++) {
				
				ImageFileVO image = imageList.get(i);
				image.setStyle_no(style_no);
				imageMapper.insert(image);
				
				if (vo.getProductTagList() != null && vo.getProductTagList().size() > i) {
					List<ProductTagVO> productTagList = vo.getProductTagList().get(i);
					for (ProductTagVO productTag : productTagList) {
						productTag.setStyle_no(style_no);
						productTag.setIdx(i);
						productTagMapper.insert(productTag);
					}
				}
			}
		}
		
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
		
		memberMapper.updateStyleCount(vo.getM_no(), 1);
	}
	
	@Override
	@Transactional
	public boolean remove(long style_no, int m_no) {
		if (mapper.getCountReply(style_no) > 0) {
			replyMapper.deleteByStyleNo(style_no);
		}
		imageMapper.deleteAll(style_no);
		if (styleTagMapper.getCountTags(style_no) > 0) {
			styleTagMapper.deleteByStyleNo(style_no);
		}
		memberMapper.updateStyleCount(m_no, -1);
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
		
		productTagMapper.delete(style_no);
		List<List<ProductTagVO>> newProductTags = vo.getProductTagList();
		if (newProductTags != null && newProductTags.size() != 0) {
			for (int i=0; i<newProductTags.size(); i++) {
				List<ProductTagVO> list = newProductTags.get(i);
				if (list == null || list.size() == 0) continue;
				for (ProductTagVO productTag : list) {
					productTag.setStyle_no(style_no);
					productTag.setIdx(i);
					productTagMapper.insert(productTag);
				}
			}
		}
		
		mapper.update(vo);
	}
	
	@Override
	@Transactional
	public int likeStyle(long style_no) {
		MemberVO userSession = new UserSession().getSession();
		int m_no = userSession.getM_no();
		
		boolean isLiked = styleLikeMapper.checkLiked(m_no, style_no);
		if (isLiked) {
			styleLikeMapper.delete(m_no, style_no);
			mapper.updateCountLike(style_no, -1);
		} else {
			styleLikeMapper.insert(m_no, style_no);
			mapper.updateCountLike(style_no, 1);
		}
		
		return mapper.getCountLike(style_no);
	}
}