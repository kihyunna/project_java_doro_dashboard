package egovframework.com.sdtic.bucrs.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.sdtic.bucrs.service.BucCmmnService;
import egovframework.com.sdtic.bucrs.service.BucCmmnVO;
import egovframework.com.sdtic.bucrs.service.BucFcltsVO;
import egovframework.com.sdtic.bucrs.service.BucTrackingVO;
import egovframework.com.sdtic.bucrs.service.bucMainService;
import egovframework.com.sdtic.bucrs.service.bucMainVO;
import egovframework.com.sdtic.main.service.MainCmmnVO;

/**
 * @Class Name : BucCmmnController.java
 * @Description : BucCmmnController Class
 * @Modification Information @ 수정일 수정자 수정내용 @2017. 06. 01 jkheo 최초생성
 * @author
 * @since
 * @version 1.0
 * @see
 *
 */
@Controller
public class BucCmmnController {

	/** bucCmmnService */
	@Resource(name = "bucCmmnService")
	private BucCmmnService bucCmmnService;
	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	private EgovMessageSource egovMessageSource;
	
	/** bucMainService */
	@Resource(name = "bucMainService")
	private bucMainService bucMainService;

	/******************* S :비즈니스 공통 메인 위젯 화면 ************************/
	/**
	 * 비즈니스 공통 메인 화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnMainView.do")
	public String bucCmmnMainView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, ModelMap model) throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnMainView";
		return returnValue;
	}

	/******************* E : 비즈니스 공통 메인 위젯 화면 ************************/

	/******************* S :비즈니스 공통 메인 위젯 AJAX ************************/
	/**
	 * 비즈니스 공통 메인 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucCmmnMain.do")
	public @ResponseBody ModelAndView bucCmmnMain(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucCmmnVO> bucCmmnMain = bucCmmnService.bucCmmnMainAjax(bucCmmnVO);
		resultMap.put("data", bucCmmnMain);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 공통 메인 위젯 AJAX ************************/

	/******************* S :비즈니스 공통 SMS 발송현황 위젯 화면 ************************/
	/**
	 * 비즈니스 공통 SMS 발송현황 화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnSmssndngView.do")
	public String bucCmmnSmssndngView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, ModelMap model) throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnSmssndngView";
		return returnValue;
	}

	/******************* E : 비즈니스 공통 SMS 발송현황 위젯 화면 ************************/

	/******************* S :비즈니스 공통 SMS 발송현황 위젯 AJAX ************************/
	/**
	 * 비즈니스 공통 SMS 발송현황 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucCmmnSmssndng.do")
	public @ResponseBody ModelAndView bucCmmnSmssndng(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucCmmnVO> bucCmmnSmssndng = bucCmmnService.bucCmmnSmssndngAjax(bucCmmnVO);
		resultMap.put("data", bucCmmnSmssndng);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 공통 SMS 발송현황 위젯 AJAX ************************/

	/******************* S :비즈니스 공통 헬프데스크 처리현황 위젯 화면 ************************/
	/**
	 * 비즈니스 공통 헬프데스크 처리현황 화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnHelpdeskView.do")
	public String bucCmmnHelpdeskView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, ModelMap model) throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnHelpdeskView";
		return returnValue;
	}

	/******************* E : 비즈니스 공통 헬프데스크 처리현황 위젯 화면 ************************/

	/******************* S :비즈니스 공통 헬프데스크 처리현황 위젯 AJAX ************************/
	/**
	 * 비즈니스 공통 헬프데스크 처리현황 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucCmmnHelpdesk.do")
	public @ResponseBody ModelAndView bucCmmnHelpdesk(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucCmmnVO> bucCmmnHelpdesk = bucCmmnService.bucCmmnHelpdeskAjax(bucCmmnVO);
		resultMap.put("data", bucCmmnHelpdesk);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 공통 헬프데스크 처리현황 위젯 AJAX ************************/
	
	/******************* S :비즈니스 공통 헬프데스크 처리현황 db연동 위젯 화면 ************************/
	/**
	 * 비즈니스 공통 헬프데스크 처리현황 db연동 화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnHelpdeskdbView.do")
	public String bucCmmnHelpdeskdbView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, ModelMap model) throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnHelpdeskdbView";
		return returnValue;
	}

	/******************* E : 비즈니스 공통 헬프데스크 처리현황 위젯 db연동 화면 ************************/

	/******************* S :비즈니스 공통 헬프데스크 처리현황 db연동 위젯 AJAX ************************/
	/**
	 * 비즈니스 공통 헬프데스크 처리현황 db연동 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucCmmnHelpdeskdbAjax.do")
	public @ResponseBody ModelAndView bucCmmnHelpdeskdb(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucCmmnVO> bucCmmnHelpdesk = bucCmmnService.bucCmmnHelpdeskdbAjax(bucCmmnVO);
		resultMap.put("data", bucCmmnHelpdesk);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 공통 헬프데스크 처리현황 db연동 위젯 AJAX ************************/

	/******************* S :비즈니스 공통 간이결재 처리현황 위젯 화면 ************************/
	/**
	 * 비즈니스 공통 간이결재 처리현황 화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnSimplctysanctnView.do")
	public String bucCmmnSimplctysanctnView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO,
			HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model)
			throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnSimplctysanctnView";
		return returnValue;
	}

	/******************* E : 비즈니스 공통 간이결재 처리현황 위젯 화면 ************************/

	/******************* S :비즈니스 공통 간이결재 처리현황 위젯 AJAX ************************/
	/**
	 * 비즈니스 공통 간이결재 처리현황 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucCmmnSimplctysanctn.do")
	public @ResponseBody ModelAndView bucCmmnSimplctysanctn(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucCmmnVO> bucCmmnSimplctysanctn = bucCmmnService.bucCmmnSimplctysanctnAjax(bucCmmnVO);
		resultMap.put("data", bucCmmnSimplctysanctn);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 공통 간이결재 처리현황 위젯 AJAX ************************/

	/******************* S :비즈니스 공통 대외연계 송수신현황 위젯 화면 ************************/
	/**
	 * 비즈니스 공통 대외연계 송수신현황 화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnExtrnlcntcView.do")
	public String bucCmmnExtrnlcntcView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, ModelMap model) throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnExtrnlcntcView";
		return returnValue;
	}

	/******************* E : 비즈니스 공통 대외연계 송수신현황 위젯 화면 ************************/

	/******************* S :비즈니스 공통 대외연계 송수신현황 위젯 AJAX ************************/
	/**
	 * 비즈니스 공통 대외연계 송수신현황 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucCmmnExtrnlcntc.do")
	public @ResponseBody ModelAndView bucCmmnExtrnlcntc(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucCmmnVO> bucCmmnExtrnlcntc = bucCmmnService.bucCmmnExtrnlcntcAjax(bucCmmnVO);
		resultMap.put("data", bucCmmnExtrnlcntc);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 공통 대외연계 송수신현황 위젯 AJAX ************************/

	/******************* S :비즈니스 공통 데이터 증가율 위젯 화면 ************************/
	/**
	 * 비즈니스 공통 데이터 증가율 화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnDataicrrtView.do")
	public String bucCmmnDataicrrtView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, ModelMap model) throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnDataicrrtView";
		return returnValue;
	}

	/******************* E : 비즈니스 공통 데이터 증가율 위젯 화면 ************************/



	/******************* S :비즈니스 공통 데이터 이관율 위젯 화면 ************************/
	/**
	 * 비즈니스 공통 데이터 이관율 화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnDatatrnsferView.do")
	public String bucCmmnDatatrnsferView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, ModelMap model) throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnDatatrnsferView";
		return returnValue;
	}

	/******************* E : 비즈니스 공통 데이터 이관율 위젯 화면 ************************/

	/******************* S :비즈니스 공통 데이터 이관율 위젯 AJAX ************************/
	/**
	 * 비즈니스 공통 데이터 이관율 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucCmmnDatatrnsfer.do")
	public @ResponseBody ModelAndView bucCmmnDatatrnsfer(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucCmmnVO> bucCmmnDatatrnsfer = bucCmmnService.bucCmmnDatatrnsferAjax(bucCmmnVO);
		resultMap.put("data", bucCmmnDatatrnsfer);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 공통 데이터 이관율 위젯 AJAX ************************/

	/******************* S :비즈니스 공통 정보이관 Tracking Process 위젯 화면************************/
	/**
	 * 비즈니스 공통 정보이관 Tracking Process 화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnInfotrnsfertrkgView.do")
	public String bucCmmnInfotrnsfertrkgView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO,
			HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model)
			throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnInfotrnsfertrkgView";
		return returnValue;
	}

	/******************** E : 비즈니스 공통 정보이관 Tracking Process 위젯 화면	 ************************/

	/******************** S :비즈니스 공통 정보이관 Tracking Process 위젯 AJAX  ************************/
	/**
	 * 비즈니스 공통 정보이관 Tracking Process AJAX(사용안함)
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/	.do")
	public @ResponseBody ModelAndView bucCmmnInfotrnsfertrkg(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucTrackingVO") BucTrackingVO bucTrackingVO)
			throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucTrackingVO> bucCmmnInfotrnsfertrkg = bucCmmnService.bucCmmnInfotrnsfertrkgAjax(bucTrackingVO);
		resultMap.put("data", bucCmmnInfotrnsfertrkg);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}
	/******************** E :비즈니스 공통 정보이관 Tracking Process 위젯 AJAX ************************/
	
	/******************* S :비즈니스 공통 기술자문 처리실적 화면 ************************/
	/**
	 * 비즈니스 공통 기술자문 처리실적 화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnTechAdviserView.do")
	public String bucCmmnTechAdviserView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, ModelMap model) throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnTechAdviserView";
		return returnValue;
	}

	/******************* E : 비즈니스 공통 기술자문 처리실적 화면 ************************/

	/******************* S :비즈니스 공통 기술자문 처리실적 AJAX ************************/
	/**
	 * 비즈니스 공통 기술자문 처리실적 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucCmmnTechAdviser.do")
	public @ResponseBody ModelAndView bucCmmnTechAdviser(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucCmmnVO> bucCmmnMain = bucCmmnService.bucCmmnTechAdviserAjax(bucCmmnVO);
		resultMap.put("data", bucCmmnMain);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 공통 기술자문 처리실적 AJAX ************************/
	
	/******************* S :비즈니스 공통 도로정보시스템 활용메뉴 Top5 화면 ************************/
	/**
	 * 비즈니스 공통 도로정보시스템 활용메뉴 Top5 화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnLoadinfomenuView.do")
	public String bucCmmnLoadinfomenuView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, ModelMap model) throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnLoadinfomenuView";
		return returnValue;
	}

	/******************* E : 비즈니스 공통 도로정보시스템 활용메뉴 Top5 화면 ************************/

	/******************* S :비즈니스 공통 도로정보시스템 활용메뉴 Top5 AJAX ************************/
	/**
	 * 비즈니스 공통 도로정보시스템 활용메뉴 Top5 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucCmmnLoadinfomenu.do")
	public @ResponseBody ModelAndView bucCmmnLoadinfomenu(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucCmmnVO> bucCmmnLoadinfomenu = bucCmmnService.bucCmmnLoadinfomenuAjax(bucCmmnVO);
		resultMap.put("data", bucCmmnLoadinfomenu);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 공통 도로정보시스템 활용메뉴 Top5 AJAX ************************/
	
	/******************* S :비즈니스 공통 데이터 증가율 화면 ************************/
	/**
	 * 비즈니스 공통 데이터 증가율 화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnDataicrrt1View.do")
	public String bucCmmnDataicrrt1View(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, ModelMap model) throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnDataicrrt1View";
		return returnValue;
	}

	/******************* E : 비즈니스 공통 데이터 증가율 화면 ************************/

	/******************* S :비즈니스 공통 데이터 증가율 AJAX ************************/
	/**
	 * 비즈니스 공통 데이터 증가율 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucCmmnDataicrrt1.do")
	public @ResponseBody ModelAndView bucCmmnDataicrrt1View(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucCmmnVO> bucCmmnDataicrrt1 = bucCmmnService.bucCmmnDataicrrt1Ajax(bucCmmnVO);
		resultMap.put("data", bucCmmnDataicrrt1);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 공통 데이터 증가율 AJAX ************************/

	/******************* S :비즈니스 공통 도로정보시스템 활용메뉴 Top5 DB연동 화면 ************************/
	/**
	 * 비즈니스 공통 도로정보시스템 활용메뉴 Top5 DB연동 화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnLoadinfomenudbView.do")
	public String bucCmmnLoadinfomenudbView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, ModelMap model) throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnLoadinfomenudbView";
		return returnValue;
	}

	/******************* E : 비즈니스 공통 도로정보시스템 활용메뉴 Top5 DB연동 화면 ************************/

	/******************* S :비즈니스 공통 도로정보시스템 활용메뉴 Top5 DB연동 AJAX ************************/
	/**
	 * 비즈니스 공통 도로정보시스템 활용메뉴 Top5 DB연동 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucCmmnLoadinfomenudb.do")
	public @ResponseBody ModelAndView bucCmmnLoadinfomenudb(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucCmmnVO> bucCmmnLoadinfomenudb = bucCmmnService.bucCmmnLoadinfomenudbAjax(bucCmmnVO);
		List<BucCmmnVO> bucCmmnLoadinfomenudb2 = bucCmmnService.bucCmmnLoadinfomenudbgridAjax(bucCmmnVO);
		resultMap.put("data1", bucCmmnLoadinfomenudb);
		resultMap.put("data2", bucCmmnLoadinfomenudb2);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 공통 도로정보시스템 활용메뉴 Top5 DB연동 AJAX ************************/
	
	
	/******************* S :비즈니스 공통 도로정보시스템 사용자 Top10 DB연동 화면 ************************/
	/**
	 * 비즈니스 공통 도로정보시스템 사용자 Top10 DB연동 화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnLoadinfouserdbView.do")
	public String bucCmmnLoadinfouserdbView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, ModelMap model) throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnLoadinfouserdbView";
		return returnValue;
	}

	/******************* E : 비즈니스 공통 도로정보시스템 사용자 Top10 DB연동 화면 ************************/

	/******************* S :비즈니스 공통 도로정보시스템 사용자 Top10 DB연동 AJAX ************************/
	/**
	 * 비즈니스 공통 도로정보시스템 사용자 Top10 DB연동 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucCmmnLoadinfouserdb.do")
	public @ResponseBody ModelAndView bucCmmnLoadinfouserdb(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucCmmnVO> bucCmmnLoadinfouserdb = bucCmmnService.bucCmmnLoadinfouserdbgridAjax(bucCmmnVO);
		List<BucCmmnVO> bucCmmnLoadinfouserdb2 = bucCmmnService.bucCmmnLoadinfouserdbAjax(bucCmmnVO);		
		resultMap.put("data1", bucCmmnLoadinfouserdb);
		resultMap.put("data2", bucCmmnLoadinfouserdb2);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 공통 도로정보시스템 활용메뉴 사용자 Top10 DB연동 AJAX ************************/
	
	/******************* S :비즈니스 공통 기술자문 처리실적 화면 ************************/
	/**
	 * 비즈니스 공통 기술자문 처리실적 화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnTechAdviserdbView.do")
	public String bucCmmnTechAdviserdbView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, ModelMap model) throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnTechAdviserdbView";
		return returnValue;
	}

	/******************* E : 비즈니스 공통 기술자문 처리실적 화면 ************************/

	/******************* S :비즈니스 공통 기술자문 처리실적 AJAX ************************/
	/**
	 * 비즈니스 공통 기술자문 처리실적 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucCmmnTechAdviserAjax.do")
	public @ResponseBody ModelAndView bucCmmnTechAdviserdbAjax(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucCmmnVO> bucCmmnMain = bucCmmnService.bucCmmnTechAdviserdbAjax(bucCmmnVO);
		resultMap.put("data", bucCmmnMain);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 공통 기술자문 처리실적 AJAX ************************/
	
	/******************* S :비즈니스 공통 메인 위젯 화면  ************************/
	/**
	 * 비즈니스 공통 메인 DB연동 화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnMaindbView.do")
	public String bucCmmnMaindbView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, ModelMap model) throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnMaindbView";
		return returnValue;
	}

	/******************* E : 비즈니스 공통 메인 DB연동 위젯 화면 ************************/
	
	/******************* S :비즈니스 공통 대외연계 송수신현황 위젯 화면 ************************/
	/**
	 * 비즈니스 공통 대외연계 송수신현황 db연동 화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnExtrnlcntcdbView.do")
	public String bucCmmnExtrnlcntcdbView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, ModelMap model) throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnExtrnlcntcdbView";
		return returnValue;
	}

	/******************* E : 비즈니스 공통 대외연계 송수신현황 위젯 화면 ************************/
	
	/******************* S :비즈니스 공통 대외연계 송수신현황 db연동 AJAX ************************//*
	/**
	 * 비즈니스 공통  대외연계 송수신현황 db연동 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucCmmnExtrnlcntcdbAjax.do")
	public @ResponseBody ModelAndView bucCmmnExtrnlcntcdbAjax(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucCmmnVO> bucCmmnMainFclts = bucCmmnService.bucCmmnExtrnlcntcdbAjax(bucCmmnVO);
		resultMap.put("data", bucCmmnMainFclts);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 공통 대외연계 송수신현황 db연동 AJAX ************************/

	/******************* S :비즈니스 공통 메인 db연동 위젯 AJAX ************************/
	/**
	 * 비즈니스 공통 메인 db연동  AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucCmmnMaindb.do")
	public @ResponseBody ModelAndView bucCmmnMaindb(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO, 
			 @ModelAttribute("buMainVO") bucMainVO bucMainVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucCmmnVO> bucCmmnMaindbDsgn = bucCmmnService.bucCmmnMaindbDsgnAjax(bucCmmnVO);
		List<BucCmmnVO> bucCmmnMainFclts = bucCmmnService.bucCmmnMaindbFcltsAjax(bucCmmnVO);
		List<BucCmmnVO> bucCmmnMainMntmng = bucCmmnService.bucCmmnMaindbMntmngAjax(bucCmmnVO);
		List<bucMainVO> bucCmmnMainElcty = bucMainService.bucMainElctyUsedbAjax(bucMainVO);
		resultMap.put("data", bucCmmnMaindbDsgn);
		resultMap.put("data2", bucCmmnMainFclts);
		resultMap.put("data3", bucCmmnMainMntmng);
		resultMap.put("data4", bucCmmnMainElcty);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 공통 메인 db연동 위젯 AJAX ************************/
	
    /******************* S :기관(본부) 선택 Select Level1  ************************/
    /**
     * 기관 선택 Select Level2
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/selectMainInstt1lv.do")
    public @ResponseBody ModelAndView selectMainInstt1lv(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();

        List<MainCmmnVO> Instt1lv = bucCmmnService.selectMainInstt1lv(mainCmmnVO);
        resultMap.put("data", Instt1lv);

        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :기관(본부) 선택 Select Level1  ************************/

    /******************* S :기관(지사) 선택 Select Level2  ************************/
    /**
     * 기관 선택 Select Level2
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/selectMainInstt2lv.do")
    public @ResponseBody ModelAndView selectMainInstt2lv(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();

        List<MainCmmnVO> Instt2lv = bucCmmnService.selectMainInstt2lv(mainCmmnVO);
        resultMap.put("data", Instt2lv);

        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :기관(지사) 선택 Select Level2  ************************/	
    
    /******************* S :비즈니스 공통 SMS 발송현황 위젯 db연동 화면 ************************/
	/**
	 * 비즈니스 공통 SMS 발송현황 db연동 화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnSmssndngdbView.do")
	public String bucCmmnSmssndngdbView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, ModelMap model) throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnSmssndngdbView";
		return returnValue;
	}

	/******************* E : 비즈니스 공통 SMS 발송현황 위젯 db연동 화면 ************************/

	/******************* S :비즈니스 공통 SMS 발송현황 위젯 db연동 AJAX ************************/
	/**
	 * 비즈니스 공통 SMS 발송현황 db연동 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucCmmnSmssndngdbAjax.do")
	public @ResponseBody ModelAndView bucCmmnSmssndngdbAjax(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucCmmnVO> bucCmmnSmssndngdbAjax = bucCmmnService.bucCmmnSmssndngdbAjax(bucCmmnVO);
		resultMap.put("data", bucCmmnSmssndngdbAjax);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 공통 SMS 발송현황 위젯 db연동 AJAX ************************/
	
    /******************* S :비즈니스 공통 시스템별 만족도 db연동 화면 ************************/
	/**
	 * 비즈니스 공통 SMS 발송현황 db연동 화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnSystmSatisdbView.do")
	public String bucCmmnSystmSatisdbView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, ModelMap model) throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnSystmSatisdbView";
		return returnValue;
	}

	/******************* E : 비즈니스 공통 시스템별 만족도 db연동 화면 ************************/

	/******************* S :비즈니스 공통 시스템별 만족도 db연동 AJAX ************************/
	/**
	 * 비즈니스 공통 SMS 발송현황 db연동 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucCmmnSystmSatisdbAjax.do")
	public @ResponseBody ModelAndView bucCmmnSystmSatisdbAjax(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucCmmnVO> bucCmmnSmssndngdbAjax = bucCmmnService.bucCmmnSystmSatisdbAjax(bucCmmnVO);
		resultMap.put("data", bucCmmnSmssndngdbAjax);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 공통 시스템별 만족도 db연동 AJAX ************************/
	
    /******************* S :비즈니스 공통 예약업무 트래킹 db연동 화면 ************************/
	/**
	 * 비즈니스 공통 SMS 발송현황 db연동 화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnInfotrnsfertrkgdbView.do")
	public String bucCmmnInfotrnsfertrkgdbView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, ModelMap model) throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnInfotrnsfertrkgdbView";
		return returnValue;
	}

	/******************* E : 비즈니스 공통 예약업무 트래킹 db연동 화면 ************************/

	/******************* S :비즈니스 공통 예약업무 트래킹 db연동 AJAX ************************/
	/**
	 * 비즈니스 공통 SMS 발송현황 db연동 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucCmmnInfotrnsfertrkgdbAjax.do")
	public @ResponseBody ModelAndView bucCmmnInfotrnsfertrkgdbAjax(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucCmmnVO> bucCmmnSmssndngchartdbAjax = bucCmmnService.bucCmmnInfotrnsfertrkgchartdbAjax(bucCmmnVO);
		List<BucCmmnVO> bucCmmnSmssndngsenddbAjax = bucCmmnService.bucCmmnInfotrnsfertrkgsenddbAjax(bucCmmnVO);
		List<BucCmmnVO> bucCmmnSmssndngrecvdbAjax = bucCmmnService.bucCmmnInfotrnsfertrkgrecvdbAjax(bucCmmnVO);
		resultMap.put("chartdata", bucCmmnSmssndngchartdbAjax);
		resultMap.put("senddata", bucCmmnSmssndngsenddbAjax);
		resultMap.put("recvdata", bucCmmnSmssndngrecvdbAjax);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 공통 예약업무 트래킹 db연동 AJAX ************************/
	
	/******************* S :비즈니스 공통 이벤트 위젯 화면 ************************/
	/**
	 * 비즈니스 공통 이벤트화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnEventListView.do")
	public String bucCmmnEventListView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, ModelMap model) throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnEventListView";
		return returnValue;
	}

	/******************* E : 비즈니스 공통 이벤트 위젯 화면 ************************/
	
	/******************* S :비즈니스 공통 이벤트 db 위젯 화면 ************************/
	/**
	 * 비즈니스 공통 이벤트화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnEventListdbView.do")
	public String bucCmmnEventListdbView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, ModelMap model) throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnEventListdbView";
		return returnValue;
	}

	/******************* E : 비즈니스 공통 이벤트 db 위젯 화면 ************************/
	
	/******************* S :비즈니스 공통 이벤트 db연동 AJAX ************************/
	/**
	 * 비즈니스 공통 SMS 발송현황 db연동 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucCmmnEventListdbAjax.do")
	public @ResponseBody ModelAndView bucCmmnEventListdbAjax(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucCmmnVO> bucCmmnEventListdbAjax = bucCmmnService.bucCmmnEventListdbAjax(bucCmmnVO);
		resultMap.put("data", bucCmmnEventListdbAjax);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 공통 이벤트 db연동 AJAX ************************/
	
	/******************* S :비즈니스 공통 간이결재 처리현황 위젯 db연동 화면 ************************/
	/**
	 * 비즈니스 공통 간이결재 처리현황 db연동 화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnSimplctysanctndbView.do")
	public String bucCmmnSimplctysanctndbView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO,
			HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model)
			throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnSimplctysanctndbView";
		return returnValue;
	}

	/******************* E : 비즈니스 공통 간이결재 처리현황 위젯 db연동 화면 ************************/

	/******************* S :비즈니스 공통 간이결재 처리현황 위젯 db연동 AJAX ************************/
	/**
	 * 비즈니스 공통 간이결재 처리현황 db연동 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucCmmnSimplctysanctndbAjax.do")
	public @ResponseBody ModelAndView bucCmmnSimplctysanctndbAjax(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucCmmnVO> bucCmmnSimplctysanctndbAjax = bucCmmnService.bucCmmnSimplctysanctndbAjax(bucCmmnVO);
		resultMap.put("data", bucCmmnSimplctysanctndbAjax);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 공통 간이결재 처리현황 위젯 db연동 AJAX ************************/
	
	/******************* S :비즈니스 공통 기술자문 처리실적 위젯 db연동 화면 ************************/
	/**
	 * 비즈니스 공통 간이결재 처리현황 db연동 화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnTechAdvPrcssdbView.do")
	public String bucCmmnTechAdvPrcssdbView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO,
			HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model)
			throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnTechAdvPrcssdbView";
		return returnValue;
	}

	/******************* E : 비즈니스 공통 기술자문 처리실적 위젯 db연동 화면 ************************/

	/******************* S :비즈니스 공통 기술자문 처리실적 위젯 db연동 AJAX ************************/
	/**
	 * 비즈니스 공통 간이결재 처리현황 db연동 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucCmmnTechAdvPrcssdbAjax.do")
	public @ResponseBody ModelAndView bucCmmnTechAdvPrcssdbAjax(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucCmmnVO> bucCmmnTechAdvPrcssdbAjax = bucCmmnService.bucCmmnTechAdvPrcssdbAjax(bucCmmnVO);
		resultMap.put("data", bucCmmnTechAdvPrcssdbAjax);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 공통 기술자문 처리실적 위젯 db연동 AJAX ************************/
	
	/******************* S :비즈니스 공통 데이터 증가율 db연동 화면  ************************/
	/**
	 * 비즈니스 공통 데이터 증가율 화면 db연동
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnDataicrrtdbView.do")
	public String bucCmmnDataicrrtdbView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, ModelMap model) throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnDataicrrtdbView";
		return returnValue;
	}

	/******************* E : 비즈니스 공통 데이터 증가율 db연동 화면 ************************/

	/******************* S :비즈니스 공통 데이터 증가율 db연동 AJAX ************************/
	/**
	 * 비즈니스 공통 데이터 증가율 db연동 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucCmmnDataicrrtdbAjax.do")
	public @ResponseBody ModelAndView bucCmmnDataicrrtdbView(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucFcltsVO") BucFcltsVO bucFcltsVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucFcltsVO> bucCmmnDataicrrtdbAjax = bucCmmnService.bucCmmnDataicrrtdbAjax(bucFcltsVO);
		resultMap.put("data", bucCmmnDataicrrtdbAjax);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 공통 데이터 증가율 db연동 AJAX ************************/
	
	/******************* S :비즈니스 공통 이벤트 그래프 화면  ************************/
	/**
	 * 비즈니스 공통 이벤트 그래프 화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnEventGraphdbView.do")
	public String bucCmmnEventGraphdbView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, ModelMap model) throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnEventGraphdbView";
		return returnValue;
	}

	/******************* E : 비즈니스 공통 이벤트 그래프 화면 ************************/

	/******************* S :비즈니스 공통 이벤트 그래프 AJAX ************************/
	/**
	 * 비즈니스 공통 이벤트 그래프 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucCmmnEventGraphdbAjax.do")
	public @ResponseBody ModelAndView bucCmmnEventGraphdbView(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucCmmnVO> bucCmmnEventGraphdbAjax = bucCmmnService.bucCmmnEventGraphdbAjax(bucCmmnVO);
		resultMap.put("data", bucCmmnEventGraphdbAjax);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 공통 이벤트 그래프 AJAX ************************/
	/******************* S :비즈니스 공통 데이터 이관율 db 위젯 화면 ************************/
	/**
	 * 비즈니스 공통 데이터 이관율 db 화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucCmmnDatatrnsferdbView.do")
	public String bucCmmnDatatrnsferdbView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, ModelMap model) throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucCmmn/BucCmmnDatatrnsferdbView";
		return returnValue;
	}

	/******************* E : 비즈니스 공통 데이터 이관율 db 위젯 화면 ************************/

	/******************* S :비즈니스 공통 데이터 이관율 db 위젯 AJAX ************************/
	/**
	 * 비즈니스 공통 데이터 이관율 db AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucCmmnDatatrnsferdbAjax.do")
	public @ResponseBody ModelAndView bucCmmnDatatrnsferdbAjax(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucCmmnVO> bucCmmnDatatrnsferdbAjax = bucCmmnService.bucCmmnDatatrnsferdbAjax(bucCmmnVO);
		resultMap.put("data", bucCmmnDatatrnsferdbAjax);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 공통 데이터 이관율 db 위젯 AJAX ************************/
	
	
	/******************* S :비즈니스 공통 지사 상위코드 가져오기 AJAX ************************/
	/**
	 * 비즈니스 공통 데이터 이관율 db AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucCmmnGetHGRN_DPTCDAjax.do")
	public @ResponseBody ModelAndView bucCmmnGetHGRN_DPTCDAjax(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucCmmnVO> bucCmmnDatatrnsferdbAjax = bucCmmnService.bucCmmnGetHGRN_DPTCDAjax(bucCmmnVO);
		resultMap.put("data", bucCmmnDatatrnsferdbAjax);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 공통 지사 상위코드 가져오기 AJAX ************************/

}
