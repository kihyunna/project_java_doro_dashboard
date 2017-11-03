package egovframework.com.sdtic.bucrs.web;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionException;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.Globals;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.sdtic.bucrs.service.BucCmmnVO;
import egovframework.com.sdtic.bucrs.service.BucDsgnService;
import egovframework.com.sdtic.bucrs.service.BucDsgnVO;
import egovframework.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;

/**
 * @Class Name : BucDsgnController.java
 * @Description : BucDsgnController Class
 * @Modification Information
 * @    수정일      수정자      수정내용
 * @2017. 06. 01    jkheo       최초생성
 * @author
 * @since
 * @version 1.0
 * @see
 *
 */
@Controller
public class BucDsgnController {

    /** bucDsgnService */
    @Resource(name = "bucDsgnService")
    private BucDsgnService bucDsgnService;
    /** EgovMessageSource */
    @Resource(name = "egovMessageSource")
    private EgovMessageSource egovMessageSource;

    /******************* S :비즈니스 설계 누적접속자 위젯 화면 ************************/
    /**
     * 비즈니스 설계 누적접속자 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucDsgnAccmltConectrView.do")
    public String bucDsgnAccmltConectrView(@ModelAttribute("bucDsgnVO") BucDsgnVO bucDsgnVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucDsgn/BucDsgnAccmltConectrView";
        return returnValue;
    }
    /******************* E : 비즈니스 설계 누적접속자 위젯 화면 ************************/

    /******************* S :비즈니스 설계 누적접속자 위젯 AJAX  ************************/
    /**
     * 비즈니스 설계 누적접속자 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucDsgnAccmltConectrAjax.do")
    public @ResponseBody ModelAndView bucDsgnAccmltConectr(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucDsgnVO") BucDsgnVO bucDsgnVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucDsgnVO> bucDsgnAccmltConectr = bucDsgnService.bucDsgnAccmltConectrAjax(bucDsgnVO);
        resultMap.put("data", bucDsgnAccmltConectr);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }


    /******************* S :비즈니스 설계 누적접속자 위젯 화면 ************************/
    /**
     * 비즈니스 설계 누적접속자 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucDsgnAccmltConectrView2.do")
    public String bucDsgnAccmltConectrView2(@ModelAttribute("bucDsgnVO") BucDsgnVO bucDsgnVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucDsgn/BucDsgnAccmltConectrView";
        return returnValue;
    }
    /******************* E : 비즈니스 설계 누적접속자 위젯 화면 ************************/

//    /******************* S :비즈니스 설계 누적접속자 위젯 AJAX  ************************/
//    /**
//     * 비즈니스 설계 누적접속자 AJAX
//     *
//     * @param request
//     * @param response
//     * @param session
//     * @param model
//     * @return
//     * @throws Exception
//     */
//
//    @SuppressWarnings({ "rawtypes", "unchecked" })
//    @RequestMapping(value = "/buc/bucDsgnAccmltConectr2.do")
//    public @ResponseBody ModelAndView bucDsgnAccmltConectr2(
//                                                    HttpServletRequest request,
//                                                    HttpServletResponse response,
//                                                    HttpSession session,
//                                                    ModelMap model,
//                                                    @ModelAttribute("bucDsgnVO") BucDsgnVO bucDsgnVO
//                                                  ) throws Exception
//    {
//        ModelAndView modelAndView = new ModelAndView();
//        Map          resultMap    = new HashMap();
//        List<BucDsgnVO> bucDsgnAccmltConectr = bucDsgnService.bucDsgnAccmltConectrAjax2(bucDsgnVO);
//        resultMap.put("data", bucDsgnAccmltConectr);
//        modelAndView.addAllObjects(resultMap);
//        modelAndView.setViewName("jsonView");
//        return modelAndView;
//    }
//
//
//    
//    
//    /******************* E :비즈니스 설계 누적접속자 위젯 AJAX  ************************/
    
    /******************* S :비즈니스 설계 누적접속자 위젯 AJAX  ************************/
    /**
     * 비즈니스 설계 누적접속자 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucDsgnRtAjax.do")
    public @ResponseBody ModelAndView bucDsgnRtAjax(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucDsgnVO") BucDsgnVO bucDsgnVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucDsgnVO> bucDsgnAccmltConectr = bucDsgnService.bucDsgnRtAjax(bucDsgnVO);
        resultMap.put("data", bucDsgnAccmltConectr);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :비즈니스 설계 누적접속자 위젯 AJAX  ************************/

    /******************* S :비지니스 주간설계 출입현황 HTML 위젯 ************************/

    /**
    * 비지니스 서브1 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucSub21.do")
    public String bucSub21(  @ModelAttribute("bucDsgnVO") BucDsgnVO bucDsgnVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucDsgn/bucSub1";
        return returnValue;
    }
    /******************* E :비지니스 주간설계 출입현황 HTML 위젯 ************************/

    /******************* S :비지니스 설계도서납품현황 HTML 위젯 ************************/

    /**
    * 비지니스 서브2 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucSub20.do")
    public String bucSub20(  @ModelAttribute("bucDsgnVO") BucDsgnVO bucDsgnVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucDsgn/bucSub2";
        return returnValue;
    }
    /******************* E :비지니스 설계도서납품현황 위젯 ************************/

    /******************* S :비지니스 기술자문처리실적 HTML 위젯 ************************/

    /**
    * 비지니스 서브3 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucSub30.do")
    public String bucSub30(  @ModelAttribute("bucDsgnVO") BucDsgnVO bucDsgnVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucDsgn/bucSub3";
        return returnValue;
    }
    /******************* E :비지니스 기술자문처리실적 HTML 위젯 ************************/

    /******************* S :비지니스 데이터이관(시설물34종) HTML 위젯 ************************/

    /**
    * 비지니스 서브4 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucSub40.do")
    public String bucSub40(  @ModelAttribute("bucDsgnVO") BucDsgnVO bucDsgnVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucDsgn/bucSub4";
        return returnValue;
    }
    /******************* E :비지니스 데이터이관(시설물34종) 위젯 ************************/
    
    /******************* S :비즈니스 설계 설계도서 반입반출율 위젯 화면 ************************/
    /**
     * 비즈니스 설계 누적접속자 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucDsgnDrawingInOutRateView.do")
    public String bucDsgnDrawingInOutRateView(@ModelAttribute("bucDsgnVO") BucDsgnVO bucDsgnVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucDsgn/BucDsgnDrawingInOutRateView";
        return returnValue;
    }
    /******************* E : 비즈니스 설계 설계도서 반입반출율 위젯 화면 ************************/

    /******************* S :비즈니스 설계 설계도서 반입반출율 위젯 AJAX  ************************/
    /**
     * 비즈니스 설계 누적접속자 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucDsgnDrawingInOutRate.do")
    public @ResponseBody ModelAndView bucDsgnDrawingInOutRate(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucDsgnVO") BucDsgnVO bucDsgnVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucDsgnVO> bucDsgnDrawingInOutRate = bucDsgnService.bucDsgnDrawingInOutRateAjax(bucDsgnVO);
        resultMap.put("data", bucDsgnDrawingInOutRate);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :비즈니스 설계 설계도서 반입반출율 위젯 AJAX  ************************/
    
    /******************* S :비즈니스 설계 누적접속자 위젯 화면 ************************/
    /**
     * 비즈니스 설계 누적접속자 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucDsgnAccmltConectrdbView.do")
    public String bucDsgnAccmltConectrView1(@ModelAttribute("bucDsgnVO") BucDsgnVO bucDsgnVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucDsgn/BucDsgnAccmltConectrdbView";
        return returnValue;
    }
    /******************* E : 비즈니스 설계 누적접속자 위젯 화면 ************************/
    
    /******************* S :비즈니스 설계 설계도서 납품현황 위젯 화면 ************************/
    /**
     * 비즈니스 설계 누적접속자 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucDsgnBookdeliverView.do")
    public String bucDsgnBookdeliverView(@ModelAttribute("bucDsgnVO") BucDsgnVO bucDsgnVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucDsgn/BucDsgnBookdeliverView";
        return returnValue;
    }
    /******************* E : 비즈니스 설계 설계도서 납품현황 위젯 화면 ************************/
    
    /******************* S :비즈니스 설계 설계도서 납품현황 db 위젯 화면 ************************/
    /**
     * 비즈니스 설계 누적접속자 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucDsgnBookdeliverdbView.do")
    public String bucDsgnBookdeliverdbView(@ModelAttribute("bucDsgnVO") BucDsgnVO bucDsgnVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucDsgn/BucDsgnBookdeliverdbView";
        return returnValue;
    }
    /******************* E : 비즈니스 설계 설계도서 납품현황 db 위젯 화면 ************************/
    
	/******************* S : 비즈니스 설계 설계도서 납품현황 db 위젯  AJAX ************************/
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
	@RequestMapping(value = "/buc/bucDsgnBookdeliverdb.do")
	public @ResponseBody ModelAndView bucDsgnBookdeliverdb(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucDsgnVO") BucDsgnVO bucDsgnVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucDsgnVO> bucDsgnBookdeliverdb = bucDsgnService.bucDsgnBookdeliverdbAjax(bucDsgnVO);		
		resultMap.put("data", bucDsgnBookdeliverdb);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E : 비즈니스 설계 설계도서 납품현황 db 위젯  AJAX ************************/
}
