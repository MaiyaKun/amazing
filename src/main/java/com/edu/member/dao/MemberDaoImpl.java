package com.edu.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.member.model.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.amazing.member.";
	
	@Override
	public List<MemberDto> memberSelectList(String searchOption, String keyword
			, int start, int end) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList(namespace + "memberSelectList", map);
	}
	
	// 사용자 존재 유무 없으면 null 리턴
	@Override
	public MemberDto memberExist(String id, String passWord) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> paramMap = new HashMap<>();
		paramMap.put("id", id);
		paramMap.put("passWord", passWord);
		
		return sqlSession.selectOne(namespace + "memberExist", paramMap);
	}

	@Override
	public int memberInsertOne(MemberDto memberDto) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert(namespace + "memberInsertOne", memberDto);
	}

	@Override
	public MemberDto memberSelectOne(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "memberSelectOne", no);
	}

	@Override
	public int memberUpdateOne(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "memberUpdateOne", memberDto);
	}

	@Override
	public int memberCashCharge(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "memberCashCharge", memberDto);
	}

	@Override
	public int memberCashSelectOne(int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "memberCashSelectOne", userNo);
	}

	@Override
	public int memberCashUpdateOne(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "memberCashUpdateOne", map);
	}
	
	@Override
	public void memberDeleteOne(int no) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + "memberDeleteOne", no);
	}

	@Override
	public int memberSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne(namespace + "memberSelectTotalCount"
				, map);
	}

	@Override
	public MemberDto memberIdFind(String userName, String phone) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("userName", userName);
		map.put("phone", phone);
		
		return sqlSession.selectOne(namespace + "memberIdFind", map);
	}

	@Override
	public void memberPwFind(MemberDto memberDto) {
		// TODO Auto-generated method stub
		
		sqlSession.update(namespace + "memberPwFind", memberDto);
	}

	@Override
	public MemberDto memberPwExist(String id, String userName, String phone) {
		// TODO Auto-generated method stub

		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("userName", userName);
		map.put("phone", phone);
				
		return sqlSession.selectOne(namespace + "memberPwExist", map);
	}

	@Override
	public void memberPwFind(String id, String userName, String phone, String passWord) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberDto memberIdCheck(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "memberIdCheck", memberDto);
	}

}
