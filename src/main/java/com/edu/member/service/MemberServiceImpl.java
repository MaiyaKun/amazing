package com.edu.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.edu.member.dao.MemberDao;
import com.edu.member.model.MemberDto;
import com.edu.util.FileUtils;

@Service
public class MemberServiceImpl implements MemberService{

private static final Logger log = 
	LoggerFactory.getLogger(MemberServiceImpl.class);

@Autowired
public MemberDao memberDao;

@Resource(name="fileUtils")
private FileUtils fileUtils;

@Override
public List<MemberDto> memberSelectList(String searchOption, String keyword
		, int start, int end) {
	// TODO Auto-generated method stub
	return memberDao.memberSelectList(searchOption, keyword, start, end);
}

@Override
public MemberDto memberExist(String id, String passWord) {
	// TODO Auto-generated method stub
	return memberDao.memberExist(id, passWord);
}

@Override
public void memberInsertOne(MemberDto memberDto) 
				throws Exception {
	memberDao.memberInsertOne(memberDto);
}

@Override
public MemberDto memberSelectOne(int no) {
	// TODO Auto-generated method stub
	Map<String, Object> resultMap = new HashMap<String, Object>();
	
	MemberDto memberDto = memberDao.memberSelectOne(no);
	
	return memberDto;
}

@Transactional(rollbackFor=Exception.class)
@Override
public int memberUpdateOne(MemberDto memberDto){
	// TODO Auto-generated method stub
	int resultNum = 0;
	
	resultNum = memberDao.memberUpdateOne(memberDto);
	
	return resultNum;
}
//
//@Override
//public int memberCashCharge(MemberDto memberDto) {
//	// TODO Auto-generated method stub
//	int resultNum = 0;
//	resultNum = memberDao.memberCashCharge(memberDto);
//	return resultNum;
//}

@Override
public void memberDeleteOne(int no) {
	// TODO Auto-generated method stub
	memberDao.memberDeleteOne(no);
}

@Override
public int memberSelectTotalCount(String searchOption, String keyword) {
	// TODO Auto-generated method stub
	return memberDao.memberSelectTotalCount(searchOption, keyword);
}

@Override
public MemberDto memberIdFind(String userName, String phone) {
	// TODO Auto-generated method stub
	return memberDao.memberIdFind(userName, phone);
}

@Override
public int memberCashSelectOne(int userNo) {
	// TODO Auto-generated method stub
	return memberDao.memberCashSelectOne(userNo);
}

@Override
public int memberCashUpdateOne(Map<String, Object> map) {
	// TODO Auto-generated method stub
	return memberDao.memberCashUpdateOne(map);
}

@Override
public void memberPwFind(MemberDto memberDto) {
	// TODO Auto-generated method stub
	memberDao.memberPwFind(memberDto);
}

@Override
public MemberDto memberPwExist(String id, String userName, String phone) {
	// TODO Auto-generated method stub
	return memberDao.memberPwExist(id, userName, phone);
}

@Override
public MemberDto memberIdCheck(MemberDto memberDto) {
	// TODO Auto-generated method stub
	return memberDao.memberIdCheck(memberDto);
}
	
}
