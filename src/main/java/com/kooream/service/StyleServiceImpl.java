package com.kooream.service;

import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kooream.domain.Criteria;
import com.kooream.domain.HashtagVO;
import com.kooream.domain.StyleImageVO;
import com.kooream.domain.StyleTagVO;
import com.kooream.domain.StyleVO;
import com.kooream.mapper.StyleImageMapper;
import com.kooream.mapper.StyleMapper;
import com.kooream.mapper.StyleReplyMapper;
import com.kooream.mapper.StyleTagMapper;
import com.kooream.mapper.HashtagMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class StyleServiceImpl implements StyleService{
	private StyleMapper mapper;
	private StyleImageMapper imageMapper;
	private StyleReplyMapper replyMapper;
	private StyleTagMapper styleTagMapper;
	private HashtagMapper hashtagMapper;
	
	@Override
	public List<StyleVO> getList(Criteria cri) {
		List<StyleVO> list = mapper.getList(cri); 
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
		
		style.setStyle_image(images);
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
		if (vo.getStyle_image() != null) {
			for (StyleImageVO image : vo.getStyle_image()) {
				image.setStyle_no(style_no);
				imageMapper.insert(image);
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