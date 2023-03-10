package com.kooream.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kooream.domain.CodiImageVO;
import com.kooream.domain.CodiVO;
import com.kooream.domain.Codi_TagVO;
import com.kooream.domain.Codi_itemVO;
import com.kooream.domain.Criteria;
import com.kooream.domain.ProductTagVO;
import com.kooream.domain.SearchCriteria;
import com.kooream.mapper.CodiImageMapper;
import com.kooream.mapper.CodiMapper;
import com.kooream.mapper.CodiProductTagMapper;
import com.kooream.mapper.Codi_TagMapper;
import com.kooream.mapper.Codi_itemMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.SetDelegate;

@Service
@Log4j
public class CodiServiceImpl implements CodiService{
	
	@Setter(onMethod_ = @Autowired)
	private CodiMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private CodiImageMapper attachmapper;
	
	@Setter(onMethod_ = @Autowired)
	private Codi_TagMapper tagmapper;
	
	@Setter(onMethod_ = @Autowired)
	private Codi_itemMapper itemmapper;

	@Setter(onMethod_ = @Autowired)
	private CodiProductTagMapper productTagMapper;
	
	
	
	@Override
	public List<CodiVO> getListWithPaging(Criteria cri) {
		log.info("getListWithPaging.....");
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public List<CodiVO> getList(SearchCriteria cri) {
		List<CodiVO> list = mapper.getList(cri);				// 게시글 목록
		log.info("getList.....");
		for(CodiVO codivo : list) {								// 게시글 목록 순환
			int codi_no = codivo.getCodi_no();					// 게시글 번호
			List<CodiImageVO> images = attachmapper.findbycodi_no(codi_no);	//게시글 번호로 첨부파일 가져옴
			List<Codi_TagVO> tags = tagmapper.TagBycodi_no(codi_no); // 태그 가져오기 
			
			codivo.setCodiTagList(tags);
			codivo.setAttachList(images);	//첨부파일경로를 codivo에 넣어줌 
		}
		
		return list;
	}
	
	@Override
	public int getTotal(SearchCriteria cri) {
		
		log.info("getTotal	.............................");
		
		
		return mapper.getTotal(cri);
	}
	
	
	@Transactional
	@Override
	public void register(CodiVO vo) {
		// 1. 게시글 등록
		mapper.insert(vo);
		int codi_no = mapper.getcodi_no();
		if(vo.getAttachList() != null && vo.getAttachList().size() >0) {
			List<CodiImageVO> imageList = vo.getAttachList();
			for(int i=0; i < imageList.size() ; i++) {
				imageList.get(i).setCodi_no(codi_no);
				attachmapper.insert(imageList.get(i));
				
				if (vo.getProductTagList() != null && vo.getProductTagList().size() > i) {
					List<ProductTagVO> productTagList = vo.getProductTagList().get(i);
					for (ProductTagVO productTag : productTagList) {
						productTag.setCodi_no(codi_no);
						productTag.setIdx(i);
						productTagMapper.insert(productTag);
					}
				}
			}
		}
		if(vo.getCodiTagList() != null && vo.getCodiTagList().size() >0) {
			for(Codi_TagVO vo3 : vo.getCodiTagList()) {
				vo3.setCodi_no(codi_no);
				tagmapper.insert(vo3);
			}
		}
	}
	
	@Override
	public CodiVO get(int codi_no) {
		log.info("get....."+codi_no);
		return mapper.read(codi_no);
	}
	
	
	
	
	@Override
	public boolean modify(CodiVO vo) {
		log.info("modufy........."+ vo);
		return mapper.update(vo) == 1;
	}
	
	@Override
	public boolean remove(int codi_no) {
		log.info("remove........."+ codi_no);
		return mapper.delete(codi_no) == 1;
	}
	//이미지 
	@Override
	public List<CodiImageVO> getCodiAttachList(int codi_no) {
		log.info("getCodiAttachList ...................");
		List<CodiImageVO> list = attachmapper.findbycodi_no(codi_no);
		
		System.out.println("list null ??" + list);
		System.out.println("list size ??" + list.size());
		System.out.println("list String ??" + list.toString());
		
		return list;
	}

	//해시태그
	@Override
	public List<Codi_TagVO> getTagList(int codi_no) {
		log.info("getCodi_TagList ::::::::::::");
		List<Codi_TagVO> list = tagmapper.TagBycodi_no(codi_no);
		
		System.out.println("Tag list null ??" + list);
		System.out.println("Tag list size ??" + list.size());
		System.out.println("Tag list String ??" + list.toString());
		
		return list;
	}
	
	//상품 태그
	@Override
	public List<ProductTagVO> getPNoListByCodiNo(int codi_no) {
		List<ProductTagVO> pList = productTagMapper.getPNoListByCodiNo(codi_no);
		return pList;
	}
	
}
