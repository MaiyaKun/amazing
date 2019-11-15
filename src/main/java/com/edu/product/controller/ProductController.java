package com.edu.product.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.edu.member.model.MemberDto;
import com.edu.product.model.ProductDto;
import com.edu.product.service.ProductService;
import com.edu.util.CommonUtils;
import com.edu.util.Paging;

@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/product/error.do",
			method= {RequestMethod.GET})
	public String productError(Model model) {
		
		return "product/productErrorView";
	}
	
	@RequestMapping(value="/product/list.do", 
			method= {RequestMethod.GET, RequestMethod.POST})
	public String productListView(@RequestParam(defaultValue="1") int curPage
			, @RequestParam(defaultValue="all") String searchOption
			, @RequestParam(defaultValue="") String keyword
			, Model model) {
		try {
			logger.info("Welcome ProductController productList!");
		
			int totalCount = productService.productSelectTotalCount(searchOption, keyword);
			
			Paging memberPaging = new Paging(totalCount, curPage, 5);
			int start = memberPaging.getPageBegin();
			int end = memberPaging.getPageEnd();
			
			List<ProductDto> productList = productService.productSelectList(searchOption, keyword, start, end);
			
			Map<String, Object> searchMap = new HashMap<>();
			searchMap.put("searchOption", searchOption);
			searchMap.put("keyword", keyword);
			
			Map<String, Object> pagingMap = new HashMap<>();
			pagingMap.put("totalCount", totalCount);
			pagingMap.put("memberPaging", memberPaging);
			
			model.addAttribute("productList", productList);
			model.addAttribute("searchMap", searchMap);
			model.addAttribute("pagingMap", pagingMap);
			
			return "product/productListView";
		} catch (Exception e) {
			// TODO: handle exception
			
			return "redirect:/product/error.do";
		}
	}
	
	@RequestMapping(value="/product/add.do", method= RequestMethod.GET)
	public String productAdd(Model model){
		try {
			logger.info("Welcome MemberController memberAdd! ");
		
			List<Map<String, Object>> genreList = productService.productGenreSelectList();
			
			model.addAttribute("genreList", genreList);
			
			return "product/productAddView";
		} catch (Exception e) {
			// TODO: handle exception
			
			return "redirect:/product/error.do";
		}
	}
	
	@RequestMapping(value="/product/addCtr.do", method= RequestMethod.POST)
	public String productAddCtr(ProductDto productDto, 
			MultipartHttpServletRequest mulRequest,	Model model) {
		try {
			logger.info("Welcome ProductController productAddCtr! :: {}", productDto);
		
			productService.productInsertOne(productDto, mulRequest);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/product/list.do";
	}
	
	@RequestMapping(value="/product/detail.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String productDetail(int productNo
						, @RequestParam(defaultValue="1") int curPage
						, @RequestParam(defaultValue="all")String searchOption
						, @RequestParam(defaultValue="") String keyword
						, @RequestParam(defaultValue="1") int comCurPage
						, HttpSession session
						, Model model) {
		
		try {
			logger.info("Welcome MemberController productDetail! ");
		
			//제품 상세보기를 위한 데이터 select
			ProductDto productDto = productService.productDetailSelectOne(productNo);
			String genreStr = productService.genreSelectOne(productDto.getGenreNo());
			double userScore = productService.userScoreSelectOne(productNo);
			
			model.addAttribute("productDto", productDto);
			model.addAttribute("genreStr", genreStr);
			model.addAttribute("userScore", userScore);		
			
			//List로 되돌아가기 위한 검색 및 현재 페이징 데이터
			Map<String, Object> pageData = new HashMap<String, Object>();
			
			pageData.put("curPage", curPage);
			pageData.put("searchOption", searchOption);
			pageData.put("keyword", keyword);
			
			model.addAttribute("pageData", pageData);
			
			//댓글란 페이징을 위한 연산부
			int totalCount = productService.productComSelectTotalCount(productNo);
	
			Paging memberPaging = new Paging(totalCount, comCurPage, 10);
			int start = memberPaging.getPageBegin();
			int end = memberPaging.getPageEnd();
			
			Map<String, Object> comMap = new HashMap<String, Object>();
			comMap.put("productNo", productNo);
			comMap.put("start", start);
			comMap.put("end", end);
			
			List<Map<String, Object>> productComList = productService.productComSelectList(comMap);
			model.addAttribute("productComList", productComList);
	
			Map<String, Object> pagingMap = new HashMap<>();
			pagingMap.put("totalCount", totalCount);
			pagingMap.put("memberPaging", memberPaging);
			
			model.addAttribute("pagingMap", pagingMap);
			
			return "product/productDetailView";
		} catch (Exception e) {
			// TODO: handle exception
			
			return "redirect:/product/error.do";
		}
	}
	
	@RequestMapping(value="/product/update.do", method=RequestMethod.GET)
	public String productUpdateOne(int productNo
								, int curPage
								, String searchOption
								, String keyword
								, Model model) {
		try {
			logger.info("Welcome to ProductController / update.do");
		
			ProductDto productDto = productService.productDetailSelectOne(productNo);
			List<Map<String, Object>> genreList = productService.productGenreSelectList();
			
			model.addAttribute("productDto", productDto);
			model.addAttribute("genreList", genreList);
			model.addAttribute("curPage", curPage);
			model.addAttribute("searchOption", searchOption);
			model.addAttribute("keyword", keyword);
			
			return "product/productUpdateView";
			
		} catch (Exception e) {
			// TODO: handle exception
			
			return "redirect:/product/error.do";
		}
	}
	
	@RequestMapping(value="/product/updateCtr.do", method=RequestMethod.POST)
	public String productUpdateOneCtr(
									ProductDto productDto
									, int curPage
									, String searchOption
									, String keyword
									, @RequestParam(defaultValue="-1") int titleChange
									, @RequestParam(defaultValue="-1") int pdChange
									, MultipartHttpServletRequest mulRequest
									, Model model) throws Exception {

		try {
			logger.info("Welcome to ProductController / updateCtr.do");
			logger.info(productDto.toString());
			logger.info("titleChange : {} :: pdChange : {}", titleChange, pdChange);
//		t : title파일 / p : pd파일 / 1 : 변경되지 않음 / 0 : 변경됨
		
			String change = "";
			if(titleChange == 1 && pdChange == 1) {
				change = "t1p1";
			} else if(titleChange == 1 && pdChange == -1) {
				change = "t1p0";
			} else if(titleChange == -1 && pdChange == 1) {
				change = "t0p1";
			} else if(titleChange == -1 && pdChange == -1) {
				change = "t0p0";
			}
			
			productService.productUpdateOne(productDto, mulRequest, change);
			
			model.addAttribute("productNo", productDto.getProductNo());
			model.addAttribute("curPage", curPage);
			model.addAttribute("searchOption", searchOption);
			model.addAttribute("keyword", keyword);
			
			return "redirect:/product/detail.do";
			
		} catch (Exception e) {
			// TODO: handle exception
			
			return "redirect:/product/error.do";
		}
	}
	
	@RequestMapping(value="/product/delete.do", method=RequestMethod.GET)
	public String productDeleteOne(int productNo, Model model) {
		try {
			logger.info("Welcome ProductController productDelete! ");
			
			productService.productReplyDeleteList(productNo);
			productService.productDeleteOne(productNo);
			
			return "redirect:/product/list.do";
			
		} catch (Exception e) {
			// TODO: handle exception
			
			return "redirect:/product/error.do";
		}
	}
	
	@RequestMapping(value="/product/reInsert.do", method=RequestMethod.POST)
	public String productReplyInsertOne(int productNo
							, int curPage
							, String searchOption
							, String keyword
							, String story
							, int score
							, HttpSession session
							, Model model) {
		try {
			logger.info("Welcome ProductController productReInsert! ");
			logger.info("productNo : {}", productNo);
			logger.info("curPage : {}", curPage);
			logger.info("searchOption : {}", searchOption);
			logger.info("keyword : {}", keyword);
			logger.info("reply : {}", story);
			logger.info("score : {}", score);
			
			MemberDto memberDto = (MemberDto)session.getAttribute("memberLogin");
			
			logger.info("userNo : {}", memberDto.getUserNo());
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("productNo", productNo);
			map.put("userNo", memberDto.getUserNo());
			map.put("story", story);
			map.put("score", score);
			
			productService.productReplyInsertOne(map);
			
			model.addAttribute("productNo", productNo);
			model.addAttribute("curPage", curPage);
			model.addAttribute("searchOption", searchOption);
			model.addAttribute("keyword", keyword);
			
			return "redirect:/product/detail.do";
			
		} catch (Exception e) {
			// TODO: handle exception
			
			return "redirect:/product/error.do";
		}
	}
	
	@RequestMapping(value="/product/reDeleteCtr.do", method=RequestMethod.GET)
	public String productReplyDeleteOne(int no, int productNo, Model model) {

		try {
			
			productService.productReplyDeleteOne(no);
			
			model.addAttribute("productNo", productNo);
			
			return "redirect:/product/detail.do";
		} catch (Exception e) {
			// TODO: handle exception
			
			return "redirect:/product/error.do";
		}
	}
	
	@RequestMapping(value="/product/paymentReady.do", method=RequestMethod.POST )
	public String productPaymentReady(int productNo
									, int curPage
									, String searchOption
									, String keyword
									, Model model) {
		try {
		logger.info("Welcome ProductController productPaymentReady! ");
		
			
			ProductDto productDto = productService.productPaymentReady(productNo);
			
			model.addAttribute("curPage", curPage);
			model.addAttribute("searchOption", searchOption);
			model.addAttribute("keyword", keyword);
			model.addAttribute("productDto", productDto);
			
			return "product/paymentReadyView";
		} catch (Exception e) {
			// TODO: handle exception
			
			return "redirect:/product/error.do";
		}
	}
	
	@RequestMapping(value="/product/confirmBasket.do", method=RequestMethod.GET)
	public String productConfirmBasket(int productNo
									, int curPage
									, String searchOption
									, String keyword
									, int quantity
									, HttpSession session
									, Model model) {
		
		try {
			
			logger.info("Welcome ProductController confirmBasket.do!");
			logger.info("productNo : {} :: quantity : {} ", productNo, curPage);
			
			
			
			MemberDto memberDto = (MemberDto)session.getAttribute("memberLogin");
			
			int basketCount = productService.productBasketCount(memberDto.getUserNo());
			String basketCheck = "";
			
			if(basketCount < 10) {
				Map<String, Object> map = new HashMap<String, Object>();
				
				map.put("productNo", productNo);
				map.put("quantity", quantity);
				map.put("userNo", memberDto.getUserNo());
				
				productService.productBasketInsertOne(map);
				
				basketCheck = "T";
				
			} else {
				basketCheck = "F";
			}
	
			model.addAttribute("curPage", curPage);
			model.addAttribute("searchOption", searchOption);
			model.addAttribute("keyword", keyword);
			model.addAttribute("basketCheck", basketCheck);
			
			return "product/confirmBasketView";
		} catch (Exception e) {
			// TODO: handle exception
			
			return "redirect:/product/error.do";
		}
	}
	
	@RequestMapping(value="/product/productBasket.do", method=RequestMethod.GET)
	public String productBasketList(HttpSession session, Model model) {
		try {
		
			logger.info("Welcome ProductController productBasket.do! ");
			
			MemberDto memberDto = (MemberDto)session.getAttribute("memberLogin");
			List<Map<String, Object>> basketList 
				= productService.productBasketSelectList(memberDto.getUserNo());
			
			int i = 0;
			int sum = 0;
			while(i < basketList.size()) {
				sum += Integer.parseInt( String.valueOf(basketList.get(i).get("QUANTITY")))
						* Integer.parseInt( String.valueOf(basketList.get(i).get("PRICE")));
				i++;
			}
			
			model.addAttribute("basketSum", sum);
			model.addAttribute("basketList", basketList);
			
			return "product/basketListView";
		} catch (Exception e) {
			// TODO: handle exception
			
			return "redirect:/product/error.do";
		}
	}
	
	@RequestMapping(value="/product/basketQuantity.do", method=RequestMethod.POST)
	public String basketQuantityCtr(int basketNo, int quantity, Model model) {
		try {
			logger.info("Welcome ProductController basketQuantity.do! ");
			
			System.out.println("basketNo : " + basketNo + ", quantity : " + quantity);
			
			productService.BasketQuantityUpdateOne(basketNo, quantity);
			
			return "redirect:/product/productBasket.do";
		} catch (Exception e) {
			// TODO: handle exception
			
			return "redirect:/product/error.do";
		}
	}
	
	@RequestMapping(value="/product/basketDelete.do", method=RequestMethod.POST)
	public String basketDeleteCtr(int basketNo, Model model) {
		try {
			
			logger.info("Welcome ProductController basketDelete.do! ");
			
			productService.BasketDeleteOne(basketNo);
			
			return "redirect:/product/productBasket.do";
		} catch (Exception e) {
			// TODO: handle exception
			
			return "redirect:/product/error.do";
		}
	}
	
	@RequestMapping(value="/product/productPurchaseOne.do", method=RequestMethod.POST)
	public String productPurchaseOne(HttpSession session
								, int productNo
								, int quantity
								, Model model) {
		try {
			
			Map<String, Object> map = new HashMap<String, Object>();
			map = productService.productPurchaseOne(productNo);
			
			int sum = Integer.parseInt(String.valueOf(map.get("PRICE"))) * quantity;
	//		System.out.println("purchaseOne : " + sum);
			
			map.put("QUANTITY", quantity);
			map.put("SUM", sum);
			
			model.addAttribute("allSum", sum);
			model.addAttribute("productMap", map);
			
			
			MemberDto tempDto = new MemberDto();
			tempDto = (MemberDto)session.getAttribute("memberLogin");
			
			MemberDto memberDto = (MemberDto)productService.productMemberSelectOne(tempDto.getUserNo());
			
			model.addAttribute("memberDto", memberDto);
			
			
			String orderType = "solo";
			model.addAttribute("orderType", orderType);
			
			return "product/productPurchaseView";
			
		} catch (Exception e) {
			// TODO: handle exception
			
			return "redirect:/product/error.do";
		}
	}
	
	@RequestMapping(value="/product/productPurchase.do", method=RequestMethod.POST)
	public String productPurchaseList(HttpSession session
								, String basketList
								, Model model) {
		try {
			
			logger.info("Welcome ProductController productPurchase.do! ");
			logger.info("basketList : {}", basketList);
			
			String orderType = "list";
			model.addAttribute("orderType", orderType);
			
			
			MemberDto tempDto = new MemberDto();
			tempDto = (MemberDto)session.getAttribute("memberLogin");
			
			MemberDto memberDto = (MemberDto)productService.productMemberSelectOne(tempDto.getUserNo());
			
			model.addAttribute("memberDto", memberDto);
			
			
			String[] basketNo = basketList.split(",");
			
			
			List<Map<String, Object>> productList = new ArrayList<Map<String,Object>>();
			
	//		String temp = "";
			int allSum = 0;
			
			for(String No : basketNo) {
				Map<String, Object> productMap = new HashMap<String, Object>();
				
				productMap = productService.productBasketSelectOne(Integer.parseInt(No));
				
				int sum = Integer.parseInt(String.valueOf(productMap.get("QUANTITY")))
						* Integer.parseInt(String.valueOf(productMap.get("PRICE")));
				
				allSum += sum;
				productMap.put("SUM", sum);
				
				productList.add(productMap);
			}
			model.addAttribute("allSum", allSum);
			model.addAttribute("productList", productList);
			model.addAttribute("basketList", basketList);
					
			return "product/productPurchaseView";
			
		} catch (Exception e) {
			// TODO: handle exception
			
			return "redirect:/product/error.do";
		}
	}
	
	@RequestMapping(value="/product/productPurchaseCtr.do", method=RequestMethod.POST)
	public String productPurchaseCtr(int userNo, int sum
									, String pickName, String pickAddress
									, String pickPhone, String orderList
									, @RequestParam(defaultValue="-1") int productNo
									, @RequestParam(defaultValue="-1") int quantity
									, @RequestParam(defaultValue="") String basketList
									, HttpSession session
									, Model model) {
		try {
			
			logger.info("Welcome ProductController productPurchaseCtr.do! ");
			logger.info("int : {}, {}", userNo, sum);
			logger.info("pick : {}, {}", pickName, pickAddress);
			logger.info("pick : {}, orderList : {}", pickPhone, orderList);
			logger.info("productMap : {}, {}", productNo, quantity);
			logger.info("basket : {}", basketList);
	//		주문번호 만들기
			String randomStr = CommonUtils.getRandomString();
			randomStr = randomStr.substring(0, 8);
			
			SimpleDateFormat orderFormat = new SimpleDateFormat("yyyyMMdd");
			Date time = new Date();
			
			String orderCode = orderFormat.format(time) + "-" + randomStr;
			
			logger.info("orderCode : {}", orderCode);
			
	//		구매 진행
			
	//		단품구매 진행
			if(orderList.equals("solo")) {
	//			주문목록 추가
				logger.info("단품구매 진행중");
				Map<String, Object> orderMap = new HashMap<String, Object>();
				orderMap.put("orderIdx", orderCode);			
				orderMap.put("userNo", userNo);
				orderMap.put("productNo", productNo);
				orderMap.put("quantity", quantity);
				orderMap.put("pickName", pickName);
				orderMap.put("pickAddress", pickAddress);
				orderMap.put("pickPhone", pickPhone);
				
				productService.productOrderInsertOne(orderMap);
				
	//			상품 재고량 조정
				Map<String, Object> stockMap = new HashMap<String, Object>();
				stockMap.put("productNo", productNo);
				stockMap.put("quantity", quantity);
				
				productService.productStockUpdateOne(stockMap);
			}
	//		장바구니 구매 진행
			else if(orderList.equals("list")) {
				logger.info("장바구니 구매 진행중");
				String[] basketNoArr = basketList.split(",");
				
				for(String basketNo : basketNoArr) {
	//				장바구니 내용을 주문목록으로 삽입
					Map<String, Object> basketMap 
						= productService.basketOrderSelectOne(Integer.parseInt(basketNo));
					
					Map<String, Object> orderMap = new HashMap<String, Object>();
					
					orderMap.put("orderIdx", orderCode);
					orderMap.put("userNo", userNo);
					orderMap.put("productNo", basketMap.get("PRODUCT_NO"));
					orderMap.put("quantity", basketMap.get("QUANTITY"));
					orderMap.put("pickName", pickName);
					orderMap.put("pickAddress", pickAddress);
					orderMap.put("pickPhone", pickPhone);
					productService.productOrderInsertOne(orderMap);
	
	//				장바구니 내용대로 상품 재고량 조정
					Map<String, Object> stockMap = new HashMap<String, Object>();
					
					stockMap.put("productNo", basketMap.get("PRODUCT_NO"));
					stockMap.put("quantity", basketMap.get("QUANTITY"));
					
					productService.productStockUpdateOne(stockMap);
					
	//				장바구니 내에서 구매한 상품 비우기
					productService.basketDeleteOne(Integer.parseInt(String.valueOf(basketMap.get("BASKET_NO"))));
				}
				
				
			}
			
	//			세션 유저 캐시 갱신
			MemberDto memberDto = (MemberDto)session.getAttribute("memberLogin");
			memberDto.setCash(memberDto.getCash() - sum);
			session.setAttribute("memberLogin", memberDto);
			
			Map<String, Object> cashMap = new HashMap<String, Object>();
			cashMap.put("userNo", userNo);
			cashMap.put("sum", sum);
			
			productService.memberOrderCashUpdate(cashMap);
			
			
			return "redirect:/product/list.do";
			
		} catch (Exception e) {
			// TODO: handle exception
			
			return "redirect:/product/error.do";
		}
	}
	
	@RequestMapping(value="/product/orderList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String productPurchaseList(HttpSession session
									, @RequestParam(defaultValue="1") int curPage
									, Model model) {
		try {
			logger.info("welcome to orderList.do");
			
			MemberDto memberDto = (MemberDto)session.getAttribute("memberLogin");
			int userNo = 0;
			String userAdmin = "";
			
			userNo = memberDto.getUserNo();
			userAdmin = memberDto.getAdmin();
			
			System.out.println("userNo : " + userNo);
			System.out.println("userAdmin" + userAdmin);
			
			Map<String, Object> userMap = new HashMap<String, Object>();
			userMap.put("userNo", userNo);
			userMap.put("userAdmin", userAdmin);
				
			int totalCount = productService.orderTotalCount(userMap);
			
			Paging memberPaging = new Paging(totalCount, curPage, 10);
			int start = memberPaging.getPageBegin();
			int end = memberPaging.getPageEnd();
					
			Map<String, Object> orderMap = new HashMap<String, Object>();
			orderMap.put("userNo", userNo);
			orderMap.put("userAdmin", userAdmin);
			orderMap.put("start", start);
			orderMap.put("end", end);
			
			List<Map<String, Object>> orderList = 
					productService.orderListSelectList(orderMap);
			
			Map<String, Object> pagingMap = new HashMap<>();
			pagingMap.put("totalCount", totalCount);
			pagingMap.put("memberPaging", memberPaging);
			
			
			model.addAttribute("pagingMap", pagingMap);
			model.addAttribute("orderList", orderList);
			
			return "product/productOrderList";
		} catch (Exception e) {
			// TODO: handle exception
			
			return "redirect:/product/error.do";
		}
	}
	
	@RequestMapping(value="/product/orderDetail.do", method=RequestMethod.GET)
	public String productOrderDetail(@RequestParam(defaultValue="1") int curPage
								, String orderIdx
								, Model model) {
		try {
			
			logger.info("welcome to orderDetail.do");
			logger.info("orderIdx : {} / curPage : {}", orderIdx, curPage);
			
			List<Map<String, Object>> orderList = new ArrayList<Map<String,Object>>();
			Map<String, Object> orderUserMap = new HashMap<String, Object>();
			int sum = 0;
			
			orderList = productService.orderDetailSelectList(orderIdx);
			orderUserMap = productService.orderDetailUserSelectOne(orderIdx);
			sum = productService.orderDetailSumSelectOne(orderIdx);
			
			model.addAttribute("orderList", orderList);
			model.addAttribute("orderUserMap", orderUserMap);
			model.addAttribute("sum", sum);
			model.addAttribute("curPage", curPage);
			
			return "product/productOrderDetail";
		} catch (Exception e) {
			// TODO: handle exception
			
			return "redirect:/product/error.do";
		}
	}
	
	@RequestMapping(value="/product/orderDelete.do", method=RequestMethod.POST)
	public String productOrderDelete(@RequestParam(defaultValue="1") int curPage
									, String orderIdx
									, Model model) {
		try {
			
			logger.info("welcome to orderDelete.do");
			logger.info("orderIdx : {} / curPage : {}", orderIdx, curPage);
			
			productService.orderDeleteOne(orderIdx);
			
			model.addAttribute("curPage", curPage);
			return "redirect:/product/orderList.do";
		} catch (Exception e) {
			// TODO: handle exception
			
			return "redirect:/product/error.do";
		}
	}
}


