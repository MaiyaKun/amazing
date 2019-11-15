package com.edu.board.dao;

import java.util.List;
import java.util.Map;

import com.edu.board.model.BoardCommDto;
import com.edu.board.model.BoardDto;

public interface BoardDao {
	
	public List<BoardDto> boardSelectList(String searchOption, String keyword, int start, int end);
	public int boardSelectTotalCount(String searchOption, String keyword);

	public BoardDto boardSelectOne(int strNo);
	public int boardInsertOne(BoardDto boardDto);
	public int boardUpdateOne(BoardDto boardDto);
	
	public List<Map<String, Object>> boardCommSelectList(int strNo);
	public int boardCommInsertOne(BoardCommDto boardCommDto);
	public int boardCommDeleteAll(int strNo);
	public int boardDeleteOne(int strNo);
	public int boardCommDeleteOne(int comNo);
	public int boardCommUpdateOne(BoardCommDto boardCommDto);
}
