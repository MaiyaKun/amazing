package com.edu.product.dao;

import java.util.List;
import java.util.Map;

import com.edu.member.model.MemberDto;
import com.edu.product.model.ProductDto;

public interface ProductDao {
	
	public List<ProductDto> productSelectList(String searchOption, String keyword, int start, int end);
	public int productSelectTotalCount(String searchOption, String keyword);
	
	public List<Map<String, Object>> productGenreSelectList();
	public int productInsertOne(ProductDto productdto);
	
	public String genreSelectOne(int genreNo);
	public ProductDto productDetailSelectOne(int productNo);
	public double userScoreSelectOne(int productNo);
	
	public int productComSelectTotalCount(int productNo);
	public List<Map<String, Object>> productComSelectList(Map<String, Object> map);
	public void productReplyInsertOne(Map<String, Object> map);
	public void productReplyDeleteOne(int no);
	
	public void productUpdateOne(ProductDto productDto);
	public Map<String, Object> productStoredFileSelectOne(int productNo);
	
	public void productReplyDeleteList(int productNo);
	public void productDeleteOne(int productNo);
	
	public ProductDto productPaymentReady(int productNo);
	public void productBasketInsertOne(Map<String, Object> map);
	public List<Map<String, Object>>productBasketSelectList(int userNo);
	public int productBasketCount(int userNo);
	public void BasketQuantityUpdateOne(Map<String, Object> map);
	public void BasketDeleteOne(int basketNo);
	
	public Map<String, Object> productPurchaseOne(int productNo);
	public MemberDto productMemberSelectOne(int userNo);
	public Map<String, Object> productBasketSelectOne(int basketNo);
	
	public void productOrderInsertOne(Map<String, Object> map);
	public void memberOrderCashUpdate(Map<String, Object> map);
	public void productStockUpdateOne(Map<String, Object> map);
	public Map<String, Object> basketOrderSelectOne(int basketNo);
	public void basketDeleteOne(int basketNo);
	
	public List<Map<String, Object>> orderListSelectList(Map<String, Object> map);
	public int orderTotalCount(Map<String, Object> userMap);
	public void orderDeleteOne(String orderIdx);
	public List<Map<String, Object>> orderDetailSelectList(String orderIdx);
	public Map<String, Object> orderDetailUserSelectOne(String orderIdx);
	public int orderDetailSumSelectOne(String orderIdx);

}
