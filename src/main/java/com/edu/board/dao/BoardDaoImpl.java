package com.edu.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.board.model.BoardCommDto;
import com.edu.board.model.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.amazing.board.";

	@Override
	public List<BoardDto> boardSelectList(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList(namespace + "boardSelectList", map);
	}

	@Override
	public int boardSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne(namespace + "boardSelectTotalCount", map);
	}
	
	@Override
	public BoardDto boardSelectOne(int strNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "boardSelectOne", strNo);
	}

	@Override
	public int boardInsertOne(BoardDto boardDto) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + "boardInsertOne", boardDto);
	}

	@Override
	public int boardUpdateOne(BoardDto boardDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "boardUpdateOne", boardDto);
	}

	@Override
	public List<Map<String, Object>> boardCommSelectList(int strNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "boardCommSelectList", strNo);
	}

	@Override
	public int boardCommInsertOne(BoardCommDto boardCommDto) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + "boardCommInsertOne", boardCommDto);
	}

	@Override
	public int boardCommDeleteAll(int strNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + "boardCommDeleteAll", strNo);
	}

	@Override
	public int boardDeleteOne(int strNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + "boardDeleteOne", strNo);
	}

	@Override
	public int boardCommDeleteOne(int comNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + "boardCommDeleteOne", comNo);
	}

	@Override
	public int boardCommUpdateOne(BoardCommDto boardCommDto) {
		// TODO Auto-generated method stub
		System.out.println(boardCommDto);
		return sqlSession.update(namespace + "boardCommUpdateOne", boardCommDto);
	}


	
}
