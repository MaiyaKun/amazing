package com.edu.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.edu.member.model.MemberDto;

public interface MemberService {

public List<MemberDto> memberSelectList(String searchOption, String keyword
		, int start, int end);
public MemberDto memberExist(String id, String passWord);
public MemberDto memberIdFind(String userName, String phone);
public MemberDto memberPwExist(String id, String userName, String phone);
public void memberInsertOne(MemberDto memberDto) throws Exception;
public MemberDto memberSelectOne(int no);
public int memberUpdateOne(MemberDto memberDto);
public void memberDeleteOne(int no);
public int memberSelectTotalCount(String searchOption, String keyword);
public void memberPwFind(MemberDto memberDto);
public int memberCashSelectOne(int userNo);
public int memberCashUpdateOne(Map<String, Object> map);
public MemberDto memberIdCheck(MemberDto memberDto);
	
}
