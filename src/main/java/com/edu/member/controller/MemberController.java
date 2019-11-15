package com.edu.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.member.model.MemberDto;
import com.edu.member.service.MemberService;

@Controller
public class MemberController {

private static final Logger logger = LoggerFactory.getLogger(MemberController.class);


@Autowired
private MemberService memberService;

// 로그인 이동
@RequestMapping(value="/member/loginCtr.do", method=RequestMethod.POST)
public String loginCtr(String id, String passWord, 
		HttpSession session, Model model) {
	logger.info("Welcome MemberController loginCtr! {}, {}", id, passWord);
	
	MemberDto memberDto = memberService.memberExist(id, passWord);
	
	String viewUrl = "";
	
	if(memberDto != null) {
		// 회원이 존재한다면 세션에 담고 회원 전체 조회 페이지로 이동
				
		session.setAttribute("memberLogin", memberDto);
		
		viewUrl = "redirect:/product/list.do";
	}
	else if(memberDto == null) {
		model.addAttribute("id", id);
		model.addAttribute("passWord", passWord);
		
		viewUrl = "member/loginFail";
	}
	return viewUrl;
}

//아이디 찾기
@RequestMapping(value="/member/idFindCtr.do", method=RequestMethod.POST)
public String memberIdFind(String userName, String phone, String id,
		HttpSession session, Model model) {
	logger.info("Welcome MemberController idFindCtr! {}, {}", userName, phone);
	
	MemberDto memberDto = memberService.memberIdFind(userName, phone);
	
	
	String viewUrl = "";
	
	if(memberDto != null) {
		// 회원이 존재한다면 세션에 담고 회원 전체 조회 페이지로 이동
		model.addAttribute("id", memberDto.getId());		
//		session.setAttribute("memberLogin", memberDto);
		
		viewUrl = "/member/idResult";
	}
	else if(memberDto == null) {
		
		model.addAttribute("userName", userName);
		model.addAttribute("phone", phone);		
		
		viewUrl = "member/idFindFail";
		
	}
	return viewUrl;
}

//회원정보 이동
@RequestMapping(value="/myInfo.do", method=RequestMethod.POST)
public String myInfo( HttpSession session, Model model) {
	logger.info("Welcome MemberController myInfo!");
	
	MemberDto memberDto =
			(MemberDto)session.getAttribute("memberLogin");

	model.addAttribute("id", memberDto.getId());
	model.addAttribute("cash", memberDto.getCash());
	model.addAttribute("userName", memberDto.getUserName());
	model.addAttribute("phone", memberDto.getPhone());
	model.addAttribute("address", memberDto.getAddress());
	return "member/myInfo";
}

//logout.do
@RequestMapping(value="/logout.do", method=RequestMethod.GET)
public String logout(HttpSession session, Model model) {
	logger.info("Welcome MemberController logout! ");
	
//	session 파기
	session.invalidate();
	
	return "redirect:/index.jsp";
}

// 회원수정 화면으로 이동
@RequestMapping(value="/myInfoRevise.do", method=RequestMethod.POST)
public String myInfoRevise(HttpSession session, Model model) {
	logger.info("Welcome MemberController myInfoRevise!");
	
	MemberDto memberDto =
			(MemberDto)session.getAttribute("memberLogin");

	model.addAttribute("userNo", memberDto.getUserNo());
	model.addAttribute("id", memberDto.getId());
	model.addAttribute("userName", memberDto.getUserName());
	model.addAttribute("phone", memberDto.getPhone());
	model.addAttribute("address", memberDto.getAddress());
	return "member/myInfoRevise";
}

//회원가입
@RequestMapping(value="/addCtr.do", method=RequestMethod.POST)
public String memberAddCtr(MemberDto memberDto,	Model model) {
	logger.info("Welcome MemberController memberAddCtr! {}", memberDto);
	
	try {
		memberService.memberInsertOne(memberDto);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println("진행확인");
		e.printStackTrace();
	}
	return "redirect:/index.jsp";
}

// 회원수정
@RequestMapping(value = "/updateCtr.do", method = RequestMethod.POST)
public String memberUpdateCtr(HttpSession session, MemberDto memberDto, Model model) {
	logger.info("Welcome MemberController memberUpdateCtr! {} : ", memberDto);
	
		MemberDto sessionMemberDto = (MemberDto)session.getAttribute("memberLogin");
		
		if(sessionMemberDto != null) {
			// 세션의 값과 새로운 값이 일치하는지 여부
			if(sessionMemberDto.getUserNo() == memberDto.getUserNo()) {
				MemberDto newMemberDto = new MemberDto();
			
				memberService.memberUpdateOne(memberDto);

				int userNo = sessionMemberDto.getUserNo();
				newMemberDto = memberService.memberSelectOne(userNo);
				
				session.removeAttribute("memberLogin");
				session.setAttribute("memberLogin", newMemberDto);
				
//				session.setAttribute("member", newMemberDto);
			}
		}
//	}
	return "redirect:/product/list.do";
}

//패스워드 재설정 화면으로 이동
@RequestMapping(value = "/pwFindRevise.do", method = RequestMethod.POST)
public String memberPwFindCtr(String id, String userName, String phone,
		Model model) {
	logger.info("Welcome MemberController memberPwFindCtr! {} : ");
		
	MemberDto memberDto = memberService.memberPwExist(id, userName, phone);
	
	String viewUrl = "";
	
	if(memberDto != null) {
				
		viewUrl = "member/pwRevise";
		model.addAttribute("userNo", memberDto.getUserNo());
	}
	else if(memberDto == null) {
				
		model.addAttribute("id", id);
		model.addAttribute("userName", userName);
		model.addAttribute("phone", phone);
		viewUrl = "member/pwFindFail";
	}
	
	return viewUrl;

}

//패스워드 재설정
@RequestMapping(value = "/pwFinalCtr.do", method = RequestMethod.POST)
public String memberpwFinalCtr(HttpSession session, 
		MemberDto memberDto, Model model) {
	logger.info("Welcome MemberController memberpwFinalCtr! {} : ", 
			memberDto);
	
		memberService.memberPwFind(memberDto);
						
	return "redirect:/index.jsp";
}

//아이디 중복체크
@RequestMapping(value = "/idCheckCtr.do", method = RequestMethod.POST)
public String memberidCheckCtr(@RequestParam(defaultValue="") String passwordChk,
		MemberDto memberDto, Model model) {
	logger.info("Welcome MemberController memberpwFinalCtr! {} : ",	memberDto);
		MemberDto memberCheckDto = memberService.memberIdCheck(memberDto);
	
		String viewUrl = "";
		
		if(memberCheckDto != null) {
			viewUrl = "member/idCheckFail";
			
		}else if(memberCheckDto == null) {
			viewUrl = "member/idCheckPass";
					
		}
		model.addAttribute("memberDto", memberDto);
		model.addAttribute("passwordChk", passwordChk);
		return viewUrl;
}

//캐시 충전화면 이동
@RequestMapping(value="/cashCharge.do", method= {RequestMethod.GET, RequestMethod.POST})
public String memberCashCharge( HttpSession session, Model model) {
	logger.info("Welcome MemberController myInfo!");

	MemberDto memberDto =
			(MemberDto)session.getAttribute("memberLogin");
	
	int cash = memberService.memberCashSelectOne(memberDto.getUserNo());
	
	model.addAttribute("cash", cash);
	return "member/cashCharge";
}


//캐시충전
@RequestMapping(value = "/member/cashChargeCtr.do", method = RequestMethod.POST)
public String memberCashChargeCtr(HttpSession session, int lastCash, int cash, Model model) {
	logger.info("Welcome MemberController memberCashChargeCtr!");

	String hrefStr = "";
	MemberDto sessionMemberDto = (MemberDto)session.getAttribute("memberLogin");
		
	if(sessionMemberDto != null) {
			
		int newCash = 0;
		newCash = lastCash + cash;
		
		Map<String, Object> cashMap = new HashMap<String, Object>();
		
		cashMap.put("userNo", sessionMemberDto.getUserNo());
		cashMap.put("cash", newCash);
		
		memberService.memberCashUpdateOne(cashMap);
		
		model.addAttribute("lastCash", lastCash);
		model.addAttribute("inputCash", cash);
		model.addAttribute("cash", newCash);
			
		session.removeAttribute("memberLogin");
		sessionMemberDto.setCash(newCash);
		session.setAttribute("memberLogin", sessionMemberDto);
		hrefStr = "redirect:/member/cashChargePass.do";
	} 
	else {
		hrefStr = "/index";
	}
	
	return hrefStr;
}

//중복충전을 막기 위한 중간과정
@RequestMapping(value = "/member/cashChargePass.do", method = RequestMethod.GET)
public String memberCashChargePass(int lastCash
								, int inputCash
								, int cash
								, Model model) {
	
	logger.info("Welcome MemberController memberCashChargePass!");
	logger.info("LastCash : {} / Input Cash : {}", lastCash, inputCash);
	logger.info("newCash : {}", cash);
	
	model.addAttribute("lastCash", lastCash);
	model.addAttribute("inputCash", inputCash);
	model.addAttribute("cash", cash);
	
	return "member/cashChargeAfter";
}

//로그인상태일때 바로 메인으로 이동
@RequestMapping(value="/stillLogin.do", method=RequestMethod.GET)
public String stillLogin(Model model) {
   
   return "redirect:/product/list.do";
}

//로그아웃 상태일때 자동으로 로그인페이지로 이동
@RequestMapping(value="/stillLogout.do", method=RequestMethod.GET)
public String stillLogout(Model model) {
   
   return "/index";
}

//-------------------------- 단순 이동 --------------------------

//회사정보 이동
@RequestMapping(value="/comInfo.do", method=RequestMethod.GET)
public String comInfo(Model model) {
	logger.info("Welcome MemberController comInfo!");
	return "member/comInfo";
}

//이용약관 이동
@RequestMapping(value="/terms.do", method=RequestMethod.GET)
public String terms(Model model) {
	logger.info("Welcome MemberController terms!");
	return "member/terms";
}

//개인정보 이용방침 이동
@RequestMapping(value="/privateTerms.do", method=RequestMethod.GET)
public String privateTerms(Model model) {
	logger.info("Welcome MemberController privateTerms!");
	return "member/privateTerms";
}

//취소환불약관 이동
@RequestMapping(value="/cancelRefund.do", method=RequestMethod.GET)
public String cancelRefund(Model model) {
	logger.info("Welcome MemberController cancelRefund!");
	return "member/cancelRefund";
}

//아이디 찾기 이동
@RequestMapping(value="/idFind.do", method=RequestMethod.GET)
public String idFind(Model model) {
	logger.info("Welcome MemberController idFind!");
	return "member/idFind";
}

//패스워드 찾기 이동
@RequestMapping(value="/pwFind.do", method=RequestMethod.GET)
public String pwFind(Model model) {
	logger.info("Welcome MemberController pwFind!");
	return "member/pwFind";
}

//회원가입 이동
@RequestMapping(value="/addForm.do", method=RequestMethod.GET)
public String addForm(Model model, String id) {
	logger.info("Welcome MemberController addForm!");
	model.addAttribute("id", id);
	return "member/addForm";
}

//회원가입 이동
@RequestMapping(value="/addForm2.do", method=RequestMethod.POST)
public String addForm2(@RequestParam(defaultValue="") String passwordChk
					, Model model, MemberDto memberDto) {
	logger.info("Welcome MemberController addForm!");
	
	model.addAttribute("memberDto", memberDto);
	model.addAttribute("passwordChk", passwordChk);
	
	return "member/addForm2";
}

//뒤로 가기(Index)
@RequestMapping(value="/index.jsp", method=RequestMethod.GET)
public String index(Model model) {
	logger.info("Welcome MemberController Index!");
	return "/index.jsp";
}
} 
