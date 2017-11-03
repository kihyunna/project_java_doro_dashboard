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
import egovframework.com.sdtic.bucrs.service.BucBnstyService;
import egovframework.com.sdtic.bucrs.service.BucBnstyVO;
import egovframework.com.sdtic.bucrs.service.BucDsgnVO;
import egovframework.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;

/**
 * @Class Name : BucBnstyController.java
 * @Description : BucBnstyController Class
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
public class BucBnstyController {

    /** bucBnstyService */
    @Resource(name = "bucBnstyService")
    private BucBnstyService bucBnstyService;
    /** EgovMessageSource */
    @Resource(name = "egovMessageSource")
    private EgovMessageSource egovMessageSource;

    /******************* S :비즈니스 건설 누적접속자 위젯 화면 ************************/
    /**
     * 비즈니스 건설 누적접속자 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucBnstyAccmltConectrView.do")
    public String bucBnstyAccmltConectrView(@ModelAttribute("bucBnstyVO") BucBnstyVO bucBnstyVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucBnsty/BucBnstyAccmltConectrView";
        return returnValue;
    }
    /******************* E : 비즈니스 건설 누적접속자 위젯 화면 ************************/

    /******************* S :비즈니스 건설 누적접속자 위젯 AJAX  ************************/
    /**
     * 비즈니스 건설 누적접속자 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucBnstyAccmltConectr.do")
    public @ResponseBody ModelAndView bucBnstyAccmltConectr(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucBnstyVO") BucBnstyVO bucBnstyVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucBnstyVO> bucBnstyAccmltConectr = bucBnstyService.bucBnstyAccmltConectrAjax(bucBnstyVO);
        resultMap.put("data", bucBnstyAccmltConectr);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :비즈니스 건설 누적접속자 위젯 AJAX  ************************/
    
    /******************* S :비즈니스 건설 누적접속자 위젯 AJAX  ************************/
    /**
     * 비즈니스 건설 누적접속자 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucBnstyRtAjax.do")
    public @ResponseBody ModelAndView bucBnstyRtAjax(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucBnstyVO") BucBnstyVO bucBnstyVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucBnstyVO> bucBnstyAccmltConectr = bucBnstyService.bucBnstyRtAjax(bucBnstyVO);
        resultMap.put("data", bucBnstyAccmltConectr);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :비즈니스 건설 누적접속자 위젯 AJAX  ************************/
    
    /******************* S :비즈니스 건설 건설현장 위젯 화면 ************************/
    /**
     * 비즈니스 건설 건설현장 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucBnstyPlaceView.do")
    public String bucBnstyPlaceView(@ModelAttribute("bucBnstyVO") BucBnstyVO bucBnstyVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucBnsty/BucBnstyPlaceView";
        return returnValue;
    }
    /******************* E : 비즈니스 건설 건설현장 위젯 화면 ************************/

    /******************* S :비즈니스 건설 건설현장 위젯 AJAX  ************************/
    /**
     * 비즈니스 건설 건설현장 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucBnstyPlace.do")
    public @ResponseBody ModelAndView bucBnstyPlaceView(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucBnstyVO") BucBnstyVO bucBnstyVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucBnstyVO> bucBnstyPlace = bucBnstyService.bucBnstyPlaceAjax(bucBnstyVO);
        resultMap.put("data", bucBnstyPlace);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :비즈니스 건설 건설현장 위젯 AJAX  ************************/
    
    /******************* S :비즈니스 건설 누적접속자 위젯 화면 ************************/
    /**
     * 비즈니스 건설 누적접속자 화면(사용안함)
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucBnstyAccmltConectrView1.do")
    public String bucBnstyAccmltConectrView1(@ModelAttribute("bucBnstyVO") BucBnstyVO bucBnstyVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucBnsty/BucBnstyAccmltConectrView_1";
        return returnValue;
    }
    /******************* E : 비즈니스 건설 누적접속자 위젯 화면 ************************/
    
    /******************* S :비즈니스 건설 누적접속자 db 위젯 화면 ************************/
    /**
     * 비즈니스 건설 누적접속자 db연동 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucBnstyAccmltConectrdbView.do")
    public String bucBnstyAccmltConectrdbView(@ModelAttribute("bucBnstyVO") BucBnstyVO bucBnstyVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucBnsty/BucBnstyAccmltConectrdbView";
        return returnValue;
    }
    /******************* E : 비즈니스 건설 누적접속자 db연동 위젯 화면 ************************/

    /******************* S :비즈니스 건설 누적접속자 db연동 위젯 AJAX  ************************/
    /**
     * 비즈니스 건설 누적접속자 db연동 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucBnstyAccmltConectrdbAjax.do")
    public @ResponseBody ModelAndView bucBnstyAccmltConectrdb(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucBnstyVO") BucBnstyVO bucBnstyVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucBnstyVO> bucBnstyAccmltConectrdb = bucBnstyService.bucBnstyAccmltConectrdbAjax(bucBnstyVO);
        resultMap.put("data", bucBnstyAccmltConectrdb);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :비즈니스 건설 누적접속자 db연동 위젯 AJAX  ************************/
    
    /******************* S :비즈니스 건설 누적접속자(공정율) db연동 위젯 AJAX  ************************/
    /**
     * 비즈니스 건설 누적접속자(공정율) db연동 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucBnstyRtdbAjax.do")
    public @ResponseBody ModelAndView bucBnstyRtAjaxdb(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucBnstyVO") BucBnstyVO bucBnstyVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucBnstyVO> bucBnstyAccmltConectrdb = bucBnstyService.bucBnstyRtdbAjax(bucBnstyVO);
        resultMap.put("data", bucBnstyAccmltConectrdb);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :비즈니스 건설 누적접속자(공정율) db 위젯 AJAX  ************************/
    
    /******************* S :비즈니스 건설 건설현장 위젯 db연동 화면 ************************/
    /**
     * 비즈니스 건설 건설현장 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucBnstyPlacedbView.do")
    public String bucBnstyPlacedbView(@ModelAttribute("bucBnstyVO") BucBnstyVO bucBnstyVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucBnsty/BucBnstyPlacedbView";
        return returnValue;
    }
    /******************* E : 비즈니스 건설 건설현장 위젯 db연동 화면 ************************/

    /******************* S :비즈니스 건설 건설현장 위젯 db연동 AJAX  ************************/
    /**
     * 비즈니스 건설 건설현장 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucBnstyPlacedbAjax.do")
    public @ResponseBody ModelAndView bucBnstyPlacedbAjax(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucBnstyVO") BucBnstyVO bucBnstyVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucBnstyVO> bucBnstyPlacedbAjax = bucBnstyService.bucBnstyPlacedbAjax(bucBnstyVO);
        resultMap.put("data", bucBnstyPlacedbAjax);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    /******************* E : 비즈니스 건설 건설현장 위젯 db연동 화면 ************************/

}
