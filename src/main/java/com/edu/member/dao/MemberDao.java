package com.edu.member.dao;

import java.util.List;
import java.util.Map;

import com.edu.member.model.MemberDto;

public interface MemberDao {

	public List<MemberDto> memberSelectList(String searchOption, String keyword, int start, int end);
	public MemberDto memberExist(String id, String passWord);
	public void memberPwFind(String id, String userName, String phone, String passWord);
	public MemberDto memberIdFind(String userName, String phone);
	public MemberDto memberPwExist(String id, String userName, String phone);
	public int memberInsertOne(MemberDto memberDto);
	public MemberDto memberSelectOne(int no);
	public int memberUpdateOne(MemberDto memberDto);
	public int memberCashCharge(MemberDto memberDto);
	public void memberDeleteOne(int no);
	public int memberSelectTotalCount(String searchOption, String keyword);
	public void memberPwFind(MemberDto memberDto);
	public int memberCashSelectOne(int userNo);
	public int memberCashUpdateOne(Map<String, Object> map);
	public MemberDto memberIdCheck(MemberDto memberDto);
	
	
}
