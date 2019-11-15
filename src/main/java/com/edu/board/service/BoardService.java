package com.edu.board.service;

import java.util.List;
import java.util.Map;

import com.edu.board.model.BoardCommDto;
import com.edu.board.model.BoardDto;

public interface BoardService {

	public List<BoardDto> boardSelectList(String searchOption, String keyword, int start, int end);
	public int boardSelectTotalCount(String searchOption, String keyword);

	public Map<String, Object> boardSelectOne(int strNo);
	public void boardInsertOne(BoardDto boardDto) throws Exception;
	public void boardUpdateOne(BoardDto boardDto) throws Exception;
	
	public List<Map<String, Object>> boardCommSelectList(int strNo);
	public void boardCommInsertOne(BoardCommDto boardCommDto) throws Exception;
	public void boardCommDeleteAll(int strNo);
	public void boardDeleteOne(int strNo);
	public void boardCommDeleteOne(int comNo);
	public void boardCommUpdateOne(BoardCommDto boardCommDto);
	
}
