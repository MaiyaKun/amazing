package com.edu.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.board.model.BoardCommDto;
import com.edu.board.model.BoardDto;
import com.edu.board.service.BoardService;
import com.edu.util.Paging;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
	// 자유게시판 목록으로 이동
	@RequestMapping(value="/board/boardList.do", 
			method={RequestMethod.GET, RequestMethod.POST})
	public String boardListView(@RequestParam(defaultValue = "1") int curPage
			, @RequestParam(defaultValue="all") String searchOption
			, @RequestParam(defaultValue="") String keyword
			, Model model) {
		logger.info("Welcome to FreeBoard!");
		
		int totalCount = boardService.boardSelectTotalCount(searchOption, keyword);
		
		Paging memberPaging = new Paging(totalCount, curPage, 20);
		int start = memberPaging.getPageBegin();
		int end = memberPaging.getPageEnd();
		
		List<BoardDto> boardList = boardService.boardSelectList(searchOption, keyword, start, end);
		
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);
		
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("memberPaging", memberPaging);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("searchMap", searchMap);
		model.addAttribute("pagingMap", pagingMap);
		
		return "board/boardListView";
	}
	
	// 자유게시판 글 + 댓글 조회
	@RequestMapping(value="/board/boardContent.do", method={RequestMethod.GET, RequestMethod.POST})
	public String boardContentView(int strNo
									, @RequestParam(defaultValue = "1")  	int curPage
									, Model model) {
		
		logger.info("Welcome to boardContent!");
		
		
		Map<String, Object> map = boardService.boardSelectOne(strNo);
		List<Map<String, Object>> boardCommList = boardService.boardCommSelectList(strNo);
		
		BoardDto boardDto = (BoardDto) map.get("boardDto");
		
		model.addAttribute("boardCommList", boardCommList);
		model.addAttribute("boardDto", boardDto);
		model.addAttribute("curPage", curPage);
		
		return "board/boardContentView";
	}
	
	// 자유게시판 댓글 등록
	@RequestMapping(value="/board/boardCommAddCtr.do", method=RequestMethod.POST)
	public String boardCommAddCtr(BoardCommDto boardCommDto
								, @RequestParam(defaultValue = "1")  	int curPage
								, Model model)throws Exception{
		logger.info("Welcome to boardCommAddCtr!");
		
		boardService.boardCommInsertOne(boardCommDto);
		
		model.addAttribute("strNo", boardCommDto.getStrNo());
		model.addAttribute("curPage", curPage);
		return "redirect:/board/boardContent.do";
	}

	// 자유게시판 글쓰기 화면으로 이동
	@RequestMapping(value="/board/boardAdd.do", method=RequestMethod.GET)
	public String boardAddView(Model model) {
		logger.info("Welcome to boardAdd!");
		
		return "board/boardAddView";
	}
	
	// 자유게시판 글쓰기 업로드
	@RequestMapping(value="/board/boardAddCtr.do", method=RequestMethod.POST)
	public String boardAddCtr(BoardDto boardDto, Model model) throws Exception{
		logger.info("Welcome to boardAddCtr!");

		boardService.boardInsertOne(boardDto);
		
		return "redirect:/board/boardList.do";
	}

	// 자유게시판 본인 글수정으로 이동
	@RequestMapping(value="/board/boardUpdate.do", method=RequestMethod.GET)
	public String boardUpdateView(int strNo
								, @RequestParam(defaultValue = "1")  	int curPage
								, Model model) {
		logger.info("Welcome to boardUpdate!");
		
		Map<String, Object> map = boardService.boardSelectOne(strNo);
		
		BoardDto boardDto = (BoardDto) map.get("boardDto");
		
		model.addAttribute("boardDto", boardDto);
		model.addAttribute("curPage", curPage);
		
		return "board/boardUpdateView";
	}
	
	// 자유게시판 본인 글 수정 완료
	@RequestMapping(value="/board/boardUpdateCtr.do", method=RequestMethod.POST)
	public String boardUpdateCtr(BoardDto boardDto
							   , int strNo
							   , @RequestParam(defaultValue = "1")  	int curPage
							   , Model model) throws Exception{
		logger.info("Welcome to boardUpdateCtr!");
		
		boardService.boardUpdateOne(boardDto);

		model.addAttribute("strNo", boardDto.getStrNo());
		model.addAttribute("curPage", curPage);
		return "forward:/board/boardContent.do";
	}
	
	// 본인 댓글 수정 완료
	@RequestMapping(value="/board/boardCommUpdateCtr.do", method={RequestMethod.GET, RequestMethod.POST})
	public String boardCommUpdateCtr(BoardCommDto boardCommDto
								   , int strNo
								   , @RequestParam(defaultValue = "1")  	int curPage
								   , BoardDto boardDto
								   , Model model){
		logger.info("Welcome to boardCommUpdateCtr!");
		
		boardService.boardCommUpdateOne(boardCommDto);

		model.addAttribute("boardCommDto", boardCommDto); 
		model.addAttribute("strNo", boardDto.getStrNo());
		model.addAttribute("curPage", curPage);
		return "forward:/board/boardContent.do";
	}
	
	// 자유게시판 삭제
	@RequestMapping(value="/board/boardDeleteCtr.do", method=RequestMethod.GET)
	public String boardDeleteCtr(int strNo, Model model) {
		logger.info("Welcome to boardDeleteCtr!");
		
		boardService.boardCommDeleteAll(strNo);
		boardService.boardDeleteOne(strNo);

		return "redirect:/board/boardList.do";
	}
	
	// 본인 댓글 삭제
	@RequestMapping(value="/board/boardCommDeleteOneCtr.do", method=RequestMethod.GET)
	public String boardCommDeleteOneCtr(int comNo
									  , int strNo
									  , @RequestParam(defaultValue = "1")  	int curPage
									  , Model model) {
		logger.info("Welcome to boardCommDeleteOneCtr!");
		
		boardService.boardCommDeleteOne(comNo);

		model.addAttribute("strNo", strNo);
		model.addAttribute("curPage", curPage);
		return "redirect:/board/boardContent.do";
	}
}

