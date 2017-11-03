package egovframework.com.sdtic.main.web;

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
import egovframework.com.sdtic.bucrs.service.BucCmmnVO;
import egovframework.com.sdtic.bucrs.service.bucMainVO;
import egovframework.com.sdtic.bucrs.service.bucMainService;
import egovframework.com.sdtic.fecrs.service.FecMDTOperVO;
import egovframework.com.sdtic.fecrs.service.FecMainMapVO;
import egovframework.com.sdtic.fecrs.service.FecSearchVO;
import egovframework.com.sdtic.fecrs.service.fecMainService;
import egovframework.com.sdtic.fecrs.service.fecMainVO;

//import flexjson.JSONSerializer;

/**
 * @Class Name : MainBucController.java
 * @Description : MainBucController Class
 * @Modification Information
 * @
 * @ 수정일          수정자                       수정내용
 * @ -----------   ---------   -------------------------------
 * @ 2017. 06. 01    jkheo                        최초생성
 *
 * @author
 * @since
 * @version 1.0
 * @see
 *
 */
@Controller
public class MainBucController {
	
	/** bucMainService      */  @Resource(name = "bucMainService")      private     bucMainService          bucMainService;
    /**
    * 매인 대시보드
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/main/mainBucView.do")    
    public String mainBucView(     
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/main/mainBucView";
        return returnValue;
    }
    /******************* E : 메인 대시보드 ************************/

    /******************* S : 메인관제 비즈니스 메뉴 Top5 위젯 ************************/

    /**
    * 메인관제 비즈니스 건설공정율 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucMainTopmenuView.do")
    public String bucMainTopmenuView(    
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/BucMainTopmenuView";
        return returnValue;
    }
    /******************* E : 메인관제 비즈니스 메뉴 Top5 위젯 ************************/
    
    
    /******************* S : 메인관제 비즈니스 대외연계 위젯 ************************/

    /**
    * 메인관제 비즈니스 건설공정율 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucMainExtrnlCntcView.do")
    public String bucMainExtrnlCntcView(     @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/BucMainExtrnlCntcView";
        return returnValue;
    }
    /******************* E : 메인관제 비즈니스  대외연계 위젯 ************************/
    
    /******************* S : 메인관제 비즈니스 접속자수 위젯 ************************/

    /**
    * 메인관제 비즈니스 건설공정율 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucMainConectCstsView.do")
    public String bucMainConectCstsView(     @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/BucMainConectCstsView";
        return returnValue;
    }
    /******************* E : 메인관제 비즈니스 접속자수 위젯 ************************/
    
	/******************* S : 메인관제 비즈니스 접속자수 위젯 AJAX ************************/
	/**
	 * 비즈니스 공통 매인 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucMainConectCsts.do")
	public @ResponseBody ModelAndView bucMainConectCsts(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucMainVO") bucMainVO bucMainVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<bucMainVO> bucMainConectCsts = bucMainService.bucMainConectCstsAjax(bucMainVO);	
		resultMap.put("data", bucMainConectCsts);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E : 메인관제 비즈니스 접속자수 위젯 AJAX ************************/
    
    /******************* S : 메인관제 비즈니스 본부별 전력량 추이 위젯 ************************/

    /**
    * 메인관제 비즈니스 건설공정율 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucMainElctyUseView.do")
    public String bucMainElctyUseView(     @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/BucMainElctyUseView";
        return returnValue;
    }
    /******************* E : 메인관제 비즈니스 본부별 전력량 추이 위젯 ************************/
    
    /******************* S : 메인관제 비즈니스 대외연계 위젯 ************************/

    /**
    * 메인관제 비즈니스 건설공정율 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucMainExtrnlCntcdbView.do")
    public String bucMainExtrnlCntcdbView(     @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/BucMainExtrnlCntcdbView";
        return returnValue;
    }
    /******************* E : 메인관제 비즈니스  대외연계 위젯 ************************/
    
	/******************* S : 메인관제 비즈니스 대외연계 위젯 AJAX ************************/
	/**
	 * 비즈니스 공통 매인 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucMainExtrnlCntcdbAjax.do")
	public @ResponseBody ModelAndView bucMainExtrnlCntcdb(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucMainVO") bucMainVO bucMainVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<bucMainVO> bucMainExtrnlCntcdb = bucMainService.bucMainExtrnlCntcdbAjax(bucMainVO);	
		resultMap.put("data", bucMainExtrnlCntcdb);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E : 메인관제 비즈니스 대외연계 위젯 AJAX ************************/
	
    /******************* S : 메인관제 비즈니스 접속자수 위젯 ************************/

    /**
    * 메인관제 비즈니스 건설공정율 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucMainConectCstsdbView.do")
    public String bucMainConectCstsdbView(     @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/BucMainConectCstsdbView";
        return returnValue;
    }
    /******************* E : 메인관제 비즈니스 접속자수 위젯 ************************/
    
	/******************* S : 메인관제 비즈니스 접속자수 위젯 AJAX ************************/
	/**
	 * 비즈니스 공통 매인 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucMainConectCstsdbAjax.do")
	public @ResponseBody ModelAndView bucMainConectCstsdbAjax(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucMainVO") bucMainVO bucMainVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<bucMainVO> bucMainConectCstsdb = bucMainService.bucMainConectCstsdbAjax(bucMainVO);	
		resultMap.put("data", bucMainConectCstsdb);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E : 메인관제 비즈니스 접속자수 위젯 AJAX ************************/
	
    /******************* S : 메인관제 비즈니스 본부별 전력량 추이 위젯 ************************/

    /**
    * 메인관제 비즈니스 건설공정율 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucMainElctyUsedbView.do")
    public String bucMainElctyUsedbView(     @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/BucMainElctyUsedbView";
        return returnValue;
    }
    /******************* E : 메인관제 비즈니스 본부별 전력량 추이 db 위젯 ************************/
    
	/******************* S : 메인관제 비즈니스 본부별 전력량 추이 db 위젯 AJAX ************************/
	/**
	 * 비즈니스 공통 매인 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucMainElctyUsedbAjax.do")
	public @ResponseBody ModelAndView bucMainElctyUsedbAjax(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucMainVO") bucMainVO bucMainVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<bucMainVO> bucMainElctyUsedb = bucMainService.bucMainElctyUsedbAjax(bucMainVO);	
		resultMap.put("data", bucMainElctyUsedb);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E : 메인관제 비즈니스 본부별 전력량 추이 db 위젯 AJAX ************************/
}




