package com.edu.product.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.edu.member.model.MemberDto;
import com.edu.product.dao.ProductDao;
import com.edu.product.model.ProductDto;
import com.edu.util.FileUtils;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	public ProductDao productDao;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	@Override
	public List<ProductDto> productSelectList(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		
		return productDao.productSelectList(searchOption, keyword, start, end);
	}

	@Override
	public int productSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		
		return productDao.productSelectTotalCount(searchOption, keyword);
	}

	@Override
	public List<Map<String, Object>> productGenreSelectList() {
		// TODO Auto-generated method stub
		return productDao.productGenreSelectList();
	}

	@Override
	public void productInsertOne(ProductDto productDto
			, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
		// TODO Auto-generated method stub
		
		List<Map<String, Object>> list = 
				fileUtils.parseInsertFileInfo(multipartHttpServletRequest);
		
		if(list.isEmpty() == false) {
			productDto.setTitleFile((String)list.get(0).get("stored_name"));
			productDto.setPdFile((String)list.get(1).get("stored_name"));		
		}	
		
		productDao.productInsertOne(productDto);
		
	}

	@Override
	public String genreSelectOne(int genreNo) {
		// TODO Auto-generated method stub
		return productDao.genreSelectOne(genreNo);
	}

	@Override
	public ProductDto productDetailSelectOne(int productNo) {
		// TODO Auto-generated method stub
		return productDao.productDetailSelectOne(productNo);
	}

	@Override
	public double userScoreSelectOne(int productNo) {
		// TODO Auto-generated method stub
		return productDao.userScoreSelectOne(productNo);
	}

	@Override
	public int productComSelectTotalCount(int productNo) {
		// TODO Auto-generated method stub
		return productDao.productComSelectTotalCount(productNo);
	}

	@Override
	public List<Map<String, Object>> productComSelectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return productDao.productComSelectList(map);
	}

	@Override
	public void productReplyInsertOne(Map<String, Object> map) {
		// TODO Auto-generated method stub
		productDao.productReplyInsertOne(map);
	}

	@Override
	public void productReplyDeleteOne(int no) {
		// TODO Auto-generated method stub
		productDao.productReplyDeleteOne(no);
	}

	@Override
	public void productUpdateOne(ProductDto productDto,
			MultipartHttpServletRequest multipartHttpServletRequest, String change) 
					throws Exception {
		// TODO Auto-generated method stub

		System.out.println( productDto.getProductNo() );
		Map<String, Object> storedFile = productDao.productStoredFileSelectOne((int)productDto.getProductNo());
		
		List<Map<String, Object>> list 
			= fileUtils.parseInsertFileInfo(multipartHttpServletRequest);

		switch (list.size()) {
		case 0:
			// 변경없음
			productDto.setTitleFile("noChange");
			productDto.setPdFile("noChange");
			
			break;
		case 1:
			// 하나 변경
			// change -> t : title파일 / p : pd파일 / 1 : 변경되지 않음 / 0 : 변경됨 	ex_t1p0		
			if(change == "t1p0") {
				productDto.setTitleFile("noChange");
				productDto.setPdFile((String)list.get(0).get("stored_name") );
				
				fileUtils.parseUpdateFileInfo((String)storedFile.get("PD_FILE"));
				
			} else if(change == "t0p1") {
				productDto.setTitleFile((String)list.get(0).get("stored_name"));
				productDto.setPdFile("noChange");
				
				fileUtils.parseUpdateFileInfo((String)storedFile.get("TITLE_FILE"));
			}
			
			break;
		case 2:
			// 둘 모두 변경
			productDto.setTitleFile((String)list.get(0).get("stored_name"));
			productDto.setPdFile((String)list.get(1).get("stored_name"));
			
			fileUtils.parseUpdateFileInfo((String)storedFile.get("TITLE_FILE"));
			fileUtils.parseUpdateFileInfo((String)storedFile.get("PD_FILE"));
			break;
		}
		
		System.out.println("productServiceTest");
		System.out.println(productDto.toString());
		
		productDao.productUpdateOne(productDto);
		
		
	}

	@Override
	public void productReplyDeleteList(int productNo) {
		// TODO Auto-generated method stub
		productDao.productReplyDeleteList(productNo);
	}

	@Override
	public void productDeleteOne(int productNo) {
		// TODO Auto-generated method stub
		
		Map<String, Object> fileMap = productDao.productStoredFileSelectOne(productNo);
		
		fileUtils.parseUpdateFileInfo( (String)fileMap.get("TITLE_FILE") );
		fileUtils.parseUpdateFileInfo( (String)fileMap.get("PD_FILE") );
		
		productDao.productDeleteOne(productNo);
	}

	@Override
	public ProductDto productPaymentReady(int productNo) {
		// TODO Auto-generated method stub
		return productDao.productPaymentReady(productNo);
	}

	@Override
	public void productBasketInsertOne(Map<String, Object> map) {
		// TODO Auto-generated method stub
		productDao.productBasketInsertOne(map);
	}

	@Override
	public List<Map<String, Object>> productBasketSelectList(int userNo) {
		// TODO Auto-generated method stub
		return productDao.productBasketSelectList(userNo);
	}

	@Override
	public int productBasketCount(int userNo) {
		// TODO Auto-generated method stub
		return productDao.productBasketCount(userNo);
	}

	@Override
	public void BasketQuantityUpdateOne(int basketNo, int quantity) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("basketNo", basketNo);
		map.put("quantity", quantity);
		
		productDao.BasketQuantityUpdateOne(map);
	}

	@Override
	public void BasketDeleteOne(int basketNo) {
		// TODO Auto-generated method stub
		productDao.BasketDeleteOne(basketNo);
	}

	@Override
	public Map<String, Object> productPurchaseOne(int productNo) {
		// TODO Auto-generated method stub
		return productDao.productPurchaseOne(productNo);
	}

	@Override
	public MemberDto productMemberSelectOne(int userNo) {
		// TODO Auto-generated method stub
		return productDao.productMemberSelectOne(userNo);
	}

	@Override
	public Map<String, Object> productBasketSelectOne(int basketNo) {
		// TODO Auto-generated method stub
		return productDao.productBasketSelectOne(basketNo);
	}

	@Override
	public void productOrderInsertOne(Map<String, Object> map) {
		// TODO Auto-generated method stub
		productDao.productOrderInsertOne(map);
	}

	@Override
	public void memberOrderCashUpdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		productDao.memberOrderCashUpdate(map);
	}

	@Override
	public void productStockUpdateOne(Map<String, Object> map) {
		// TODO Auto-generated method stub
		productDao.productStockUpdateOne(map);
	}

	@Override
	public Map<String, Object> basketOrderSelectOne(int basketNo) {
		// TODO Auto-generated method stub
		return productDao.basketOrderSelectOne(basketNo);
	}

	@Override
	public void basketDeleteOne(int basketNo) {
		// TODO Auto-generated method stub
		productDao.basketDeleteOne(basketNo);
	}

	@Override
	public List<Map<String, Object>> orderListSelectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return productDao.orderListSelectList(map);
	}

	@Override
	public int orderTotalCount(Map<String, Object> userMap) {
		// TODO Auto-generated method stub
		return productDao.orderTotalCount(userMap);
	}

	@Override
	public void orderDeleteOne(String orderIdx) {
		// TODO Auto-generated method stub
		productDao.orderDeleteOne(orderIdx);
	}

	@Override
	public List<Map<String, Object>> orderDetailSelectList(String orderIdx) {
		// TODO Auto-generated method stub
		return productDao.orderDetailSelectList(orderIdx);
	}

	@Override
	public Map<String, Object> orderDetailUserSelectOne(String orderIdx) {
		// TODO Auto-generated method stub
		return productDao.orderDetailUserSelectOne(orderIdx);
	}

	@Override
	public int orderDetailSumSelectOne(String orderIdx) {
		// TODO Auto-generated method stub
		return productDao.orderDetailSumSelectOne(orderIdx);
	}

	
}
