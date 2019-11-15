package com.edu.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.board.dao.BoardDao;
import com.edu.board.model.BoardCommDto;
import com.edu.board.model.BoardDto;
import com.edu.util.FileUtils;

@Service
public class BoardServiceImpl implements BoardService{
	
	private static final Logger log = 
			LoggerFactory.getLogger(BoardService.class);
	
	@Autowired
	public BoardDao boardDao;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	@Override
	public List<BoardDto> boardSelectList(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		return boardDao.boardSelectList(searchOption, keyword, start, end);
	}
	
	@Override
	public int boardSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return boardDao.boardSelectTotalCount(searchOption, keyword);
	}

	@Override
	public Map<String, Object> boardSelectOne(int strNo) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		BoardDto boardDto = boardDao.boardSelectOne(strNo);
		resultMap.put("boardDto", boardDto);
		
		return resultMap;
	}

	@Override
	public void boardInsertOne(BoardDto boardDto) throws Exception{
		boardDao.boardInsertOne(boardDto);
	}

	@Override
	public void boardUpdateOne(BoardDto boardDto) throws Exception {
		// TODO Auto-generated method stub
		boardDao.boardUpdateOne(boardDto);
	}

	@Override
	public List<Map<String, Object>> boardCommSelectList(int strNo) {
		// TODO Auto-generated method stub
		return boardDao.boardCommSelectList(strNo);
	}

	@Override
	public void boardCommInsertOne(BoardCommDto boardCommDto) throws Exception {
		// TODO Auto-generated method stub
		boardDao.boardCommInsertOne(boardCommDto);
	}

	@Override
	public void boardCommDeleteAll(int strNo) {
		// TODO Auto-generated method stub
		boardDao.boardCommDeleteAll(strNo);
	}

	@Override
	public void boardDeleteOne(int strNo) {
		// TODO Auto-generated method stub
		boardDao.boardDeleteOne(strNo);
	}

	@Override
	public void boardCommDeleteOne(int comNo) {
		// TODO Auto-generated method stub
		boardDao.boardCommDeleteOne(comNo);
	}

	@Override
	public void boardCommUpdateOne(BoardCommDto boardCommDto) {
		// TODO Auto-generated method stub
		System.out.println(boardCommDto);
		boardDao.boardCommUpdateOne(boardCommDto);
	}




}
