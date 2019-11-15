package com.edu.product.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.member.model.MemberDto;
import com.edu.product.model.ProductDto;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.amazing.product.";

	@Override
	public List<ProductDto> productSelectList(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList(namespace + "productSelectList", map);
	}

	@Override
	public int productSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne(namespace + "productSelectTotalCount", map);
	}

	@Override
	public List<Map<String, Object>> productGenreSelectList() {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList(namespace + "productGenreSelectList");
	}

	@Override
	public int productInsertOne(ProductDto productDto) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + "productInsertOne", productDto);
	}

	@Override
	public String genreSelectOne(int genreNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "genreSelectOne", genreNo);
	}

	@Override
	public ProductDto productDetailSelectOne(int productNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "productDetailSelectOne", productNo);
	}

	@Override
	public double userScoreSelectOne(int productNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "userScoreSelectOne", productNo);
	}

	@Override
	public int productComSelectTotalCount(int productNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "productComSelectTotalCount", productNo);
	}

	@Override
	public List<Map<String, Object>> productComSelectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "productComSelectList", map);
	}

	@Override
	public void productReplyInsertOne(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + "productReplyInsertOne", map);
	}

	@Override
	public void productReplyDeleteOne(int no) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + "productReplyDeleteOne", no);
	}

	@Override
	public void productUpdateOne(ProductDto productDto) {
		// TODO Auto-generated method stub
		System.out.println("productDao Test");
		System.out.println(productDto.toString());
		
		sqlSession.update(namespace + "productUpdateOne", productDto);
	}

	@Override
	public Map<String, Object> productStoredFileSelectOne(int productNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "productStoredFileSelectOne", productNo);
	}

	@Override
	public void productReplyDeleteList(int productNo) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + "productReplyDeleteList", productNo);
	}

	@Override
	public void productDeleteOne(int productNo) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + "productDeleteOne", productNo);
	}

	@Override
	public ProductDto productPaymentReady(int productNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "productPaymentReady", productNo);
	}

	@Override
	public void productBasketInsertOne(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + "productBasketInsertOne", map);
	}

	@Override
	public List<Map<String, Object>> productBasketSelectList(int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "productBasketSelectList", userNo);
	}

	@Override
	public int productBasketCount(int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "productBasketCount", userNo);
	}

	@Override
	public void BasketQuantityUpdateOne(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + "BasketQuantityUpdateOne", map);
	}

	@Override
	public void BasketDeleteOne(int basketNo) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + "BasketDeleteOne", basketNo);
	}

	@Override
	public Map<String, Object> productPurchaseOne(int productNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "productPurchaseOne", productNo);
	}

	@Override
	public MemberDto productMemberSelectOne(int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "productMemberSelectOne", userNo);
	}

	@Override
	public Map<String, Object> productBasketSelectOne(int basketNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "productBasketSelectOne", basketNo);
	}

	@Override
	public void productOrderInsertOne(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + "productOrderInsertOne", map);
	}

	@Override
	public void memberOrderCashUpdate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + "memberOrderCashUpdate", map);
	}

	@Override
	public void productStockUpdateOne(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + "productStockUpdateOne", map); 
	}

	@Override
	public Map<String, Object> basketOrderSelectOne(int basketNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "basketOrderSelectOne", basketNo);
	}

	@Override
	public void basketDeleteOne(int basketNo) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + "basketDeleteOne", basketNo);
	}

	@Override
	public List<Map<String, Object>> orderListSelectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "orderListSelectList", map);
	}

	@Override
	public int orderTotalCount(Map<String, Object> userMap) {
		// TODO Auto-generated method stub
		
		
		return sqlSession.selectOne(namespace + "orderTotalCount", userMap);
	}

	@Override
	public void orderDeleteOne(String orderIdx) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + "orderDeleteOne", orderIdx);
	}

	@Override
	public List<Map<String, Object>> orderDetailSelectList(String orderIdx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "orderDetailSelectList", orderIdx);
	}

	@Override
	public Map<String, Object> orderDetailUserSelectOne(String orderIdx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "orderDetailUserSelectOne", orderIdx);
	}

	@Override
	public int orderDetailSumSelectOne(String orderIdx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "orderDetailSumSelectOne", orderIdx);
	}

}
