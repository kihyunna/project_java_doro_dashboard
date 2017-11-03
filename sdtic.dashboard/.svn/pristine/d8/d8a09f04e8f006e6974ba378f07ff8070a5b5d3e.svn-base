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
import egovframework.com.sdtic.bucrs.service.BucMntmngService;
import egovframework.com.sdtic.bucrs.service.BucMntmngVO;
import egovframework.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;

/**
 * @Class Name : BucMntmngController.java
 * @Description : BucMntmngController Class
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
public class BucMntmngController {

    /** bucMntmngService */
    @Resource(name = "bucMntmngService")
    private BucMntmngService bucMntmngService;
    /** EgovMessageSource */
    @Resource(name = "egovMessageSource")
    private EgovMessageSource egovMessageSource;

    /******************* S :비즈니스 유지관리 누적접속자 위젯 화면 ************************/
    /**
     * 비즈니스 유지관리 누적접속자 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucMntmngAccmltConectrView.do")
    public String bucMntmngAccmltConectrView(@ModelAttribute("bucMntmngVO") BucMntmngVO bucMntmngVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMntmng/BucMntmngAccmltConectrView";
        return returnValue;
    }
    /******************* E : 비즈니스 유지관리 누적접속자 위젯 화면 ************************/

    /******************* S :비즈니스 유지관리 누적접속자 위젯 AJAX  ************************/
    /**
     * 비즈니스 유지관리 누적접속자 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucMntmngAccmltConectr.do")
    public @ResponseBody ModelAndView bucMntmngAccmltConectr(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucMntmngVO") BucMntmngVO bucMntmngVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucMntmngVO> bucMntmngAccmltConectr = bucMntmngService.bucMntmngAccmltConectrAjax(bucMntmngVO);
        resultMap.put("data", bucMntmngAccmltConectr);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :비즈니스 유지관리 누적접속자 위젯 AJAX  ************************/
    
    /******************* S :비즈니스 유지관리 누적접속자 위젯 AJAX  ************************/
    /**
     * 비즈니스 유지관리 누적접속자 계획대비 실적율 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucMntmngRtAjax.do")
    public @ResponseBody ModelAndView bucMntmngRtAjax(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucMntmngVO") BucMntmngVO bucMntmngVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucMntmngVO> bucMntmngAccmltConectr = bucMntmngService.bucMntmngRtAjax(bucMntmngVO);
        resultMap.put("data", bucMntmngAccmltConectr);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :비즈니스 유지관리 누적접속자 위젯 AJAX  ************************/
    
    /******************* S :비즈니스 유지관리 MDT 운행 위젯 화면 ************************/
    /**
     * 비즈니스 유지관리 MDT 운행현황 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucMntmngVehicleCtldbView.do")
    public String bucMntmngMdtRunView(@ModelAttribute("bucMntmngVO") BucMntmngVO bucMntmngVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMntmng/BucMntmngVehicleCtldbView";
        return returnValue;
    }
    /******************* E : 비즈니스 유지관리 MDT 운행 위젯 화면 ************************/

    /******************* S :비즈니스 유지관리 MDT 운행 위젯 AJAX  ************************/
    /**
     * 비즈니스 유지관리 MDT 운행현황 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucMntmngVehicleCtldbAjax.do")
    public @ResponseBody ModelAndView bucMntmngMdtRunAjax(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucMntmngVO") BucMntmngVO bucMntmngVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucMntmngVO> bucMntmngVehicleCtldbAjax = bucMntmngService.bucMntmngVehicleCtldbAjax(bucMntmngVO);
        resultMap.put("data", bucMntmngVehicleCtldbAjax);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :비즈니스 유지관리 MDT 운행 위젯 AJAX  ************************/
    
    /******************* S :비즈니스 유지관리 유지관리 현황 화면 ************************/
    /**
     * 비즈니스 유지관리 장비,자재,거리 KM 화면(사용안함)
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucMntmngView.do")
    public String bucMntmngView(@ModelAttribute("bucMntmngVO") BucMntmngVO bucMntmngVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMntmng/BucMntmngView";
        return returnValue;
    }
    /******************* E : 비즈니스 유지관리 유지관리 현황 화면 ************************/

    /******************* S :비즈니스 유지관리 유지관리 현황 AJAX  ************************/
    /**
     * 비즈니스 유지관리 장비,자재,거리 KM  AJAX(사용안함)
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucMntmngAjax.do")
    public @ResponseBody ModelAndView bucMntmngAjax(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucMntmngVO") BucMntmngVO bucMntmngVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucMntmngVO> bucMntmng = bucMntmngService.bucMntmngAjax(bucMntmngVO);
        resultMap.put("data", bucMntmng);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :비즈니스 유지관리 유지관리 현황 AJAX  ************************/
    
    
    
    /******************* S :비즈니스 유지관리 누적접속자 위젯 화면 ************************/
    /**
     * 비즈니스 유지관리 누적접속자 화면(사용안함)
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucMntmngAccmltConectrView1.do")
    public String bucMntmngAccmltConectrView1(@ModelAttribute("bucMntmngVO") BucMntmngVO bucMntmngVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMntmng/BucMntmngAccmltConectrView_1";
        return returnValue;
    }
    /******************* E : 비즈니스 유지관리 누적접속자 위젯 화면 ************************/
    
    
    /******************* S :비즈니스 유지관리 유지관리 주간현황 위젯 화면 ************************/
    /**
     * 비즈니스 유지관리 인력,장비,거리 주간 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucMntmngWeekView.do")
    public String bucMntmngWeekView(@ModelAttribute("bucMntmngVO") BucMntmngVO bucMntmngVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMntmng/BucMntmngWeekView";
        return returnValue;
    }
    /******************* E : 비즈니스 유지관리 유지관리 주간현황 위젯 화면 ************************/

    /******************* S :비즈니스 유지관리 유지관리 주간현황 위젯 AJAX  ************************/
    /**
     * 비즈니스 유지관리 인력,장비,거리 주간 Ajax
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucMntmngWeek.do")
    public @ResponseBody ModelAndView bucMntmngWeek(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucMntmngVO") BucMntmngVO bucMntmngVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucMntmngVO> bucMntmngWeek = bucMntmngService.bucMntmngWeekAjax(bucMntmngVO);
        resultMap.put("data", bucMntmngWeek);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :비즈니스 유지관리 유지관리 주간현황 위젯 AJAX  ************************/
    
    /******************* S :비즈니스 유지관리 유지관리 일단위 현황 위젯 화면 ************************/
    /**
     * 비즈니스 유지관리 일단위 현황 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "buc/bucMntmngDayView.do")
    public String bucMntmngDayView(@ModelAttribute("bucMntmngVO") BucMntmngVO bucMntmngVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMntmng/BucMntmngDayView";
        return returnValue;
    }
    /******************* E : 비즈니스 유지관리 유지관리 일단위 현황 위젯 화면 ************************/

    /******************* S :비즈니스 유지관리 유지관리 일단위 현황 위젯 AJAX  ************************/
    /**
     * 비즈니스 유지관리 일단위 현황 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucMntmngDay.do")
    public @ResponseBody ModelAndView bucMntmngDay(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucMntmngVO") BucMntmngVO bucMntmngVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucMntmngVO> bucMntmngDay = bucMntmngService.bucMntmngDayAjax(bucMntmngVO);
        resultMap.put("data", bucMntmngDay);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :비즈니스 유지관리 유지관리 일단위 현황 위젯 AJAX  ************************/
    /******************* S :비즈니스 유지관리 점검계획대비 점검완료율 위젯 화면 ************************/
    /**
     * 비즈니스 점검계획대비 점검완료율 위젯 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "buc/bucMntmngProfitToPlanView.do")
    public String bucMntmngProfitToPlanView(@ModelAttribute("bucMntmngVO") BucMntmngVO bucMntmngVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMntmng/BucMntmngProfitToPlanView";
        return returnValue;
    }
    /******************* E : 비즈니스 유지관리  점검계획대비 점검완료율 위젯 화면 ************************/

    /******************* S :비즈니스 유지관리  점검계획대비 점검완료율 위젯 AJAX  ************************/
    /**
     * 비즈니스 점검계획대비 점검완료율 위젯 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucMntmngProfitToPlanAjax.do")
    public @ResponseBody ModelAndView bucMntmngProfitToPlanAjax(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucMntmngVO") BucMntmngVO bucMntmngVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucMntmngVO> bucMntmngDay = bucMntmngService.bucMntmngProfitToPlanAjax(bucMntmngVO);
        resultMap.put("data", bucMntmngDay);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :비즈니스 유지관리  점검계획대비 점검완료율 위젯 AJAX  ************************/
    /******************* S :비즈니스 유지관리  점검계획대비 본부최대갯수 위젯 AJAX  ************************/
    /**
     * 비즈니스 점검계획대비 본부최대갯수 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucMntmngProfitToPlanMaxAjax.do")
    public @ResponseBody ModelAndView bucMntmngProfitToPlanMaxAjax(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucMntmngVO") BucMntmngVO bucMntmngVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucMntmngVO> bucMntmngDay = bucMntmngService.bucMntmngProfitToPlanMaxAjax(bucMntmngVO);
        resultMap.put("data", bucMntmngDay);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :비즈니스 유지관리  점검계획대비 본부최대갯수 위젯 AJAX  ************************/

    
    
    /******************* S :비즈니스 유지관리 구조물 점검현황 위젯 화면 ************************/
    /**
     * 비즈니스 구조물 점검현황 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucMntmngFcltscheckView.do")
    public String bucMntmngFcltscheckView(@ModelAttribute("bucMntmngVO") BucMntmngVO bucMntmngVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMntmng/BucMntmngFcltscheckView";
        return returnValue;
    }
    /******************* E : 비즈니스 유지관리 구조물 점검현황 위젯 화면 ************************/

    /******************* S :비즈니스 유지관리 구조물 점검현황 위젯 AJAX  ************************/
    /**
     * 비즈니스 유구조물 점검현황 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

/*    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucMntmngProfitToPlan.do")
    public @ResponseBody ModelAndView bucMntmngProfitToPlanAjax(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucMntmngVO") BucMntmngVO bucMntmngVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucMntmngVO> bucMntmngDay = bucMntmngService.bucMntmngProfitToPlanAjax(bucMntmngVO);
        resultMap.put("data", bucMntmngDay);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }*/

    /******************* E :비즈니스 유지관리 구조물 점검현황 위젯 AJAX  ************************/
    
    /******************* S :비즈니스 유지관리 누적접속자 db연동 위젯 화면 ************************/
    /**
     * 비즈니스 유지관리 누적접속자 db연동 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucMntmngAccmltConectrdbView.do")
    public String bucMntmngAccmltConectrdbView(@ModelAttribute("bucMntmngVO") BucMntmngVO bucMntmngVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMntmng/BucMntmngAccmltConectrdbView";
        return returnValue;
    }
    /******************* E : 비즈니스 유지관리 누적접속자 db연동 위젯 화면 ************************/

    /******************* S :비즈니스 유지관리 누적접속자 db연동 위젯 AJAX  ************************/
    /**
     * 비즈니스 유지관리 누적접속자  db연동 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucMntmngAccmltConectrdbAjax.do")
    public @ResponseBody ModelAndView bucMntmngAccmltConectrdb(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucMntmngVO") BucMntmngVO bucMntmngVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucMntmngVO> bucMntmngAccmltConectrdb = bucMntmngService.bucMntmngAccmltConectrdbAjax(bucMntmngVO);
        resultMap.put("data", bucMntmngAccmltConectrdb);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :비즈니스 유지관리 누적접속자 db연동 위젯 AJAX  ************************/
    
    /******************* S :비즈니스 유지관리 누적접속자 db연동 위젯 AJAX  ************************/
    /**
     * 비즈니스 유지관리 누적접속자 db연동 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucMntmngRtdbAjax.do")
    public @ResponseBody ModelAndView bucMntmngRtdbAjax(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucMntmngVO") BucMntmngVO bucMntmngVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucMntmngVO> bucMntmngAccmltConectrdb = bucMntmngService.bucMntmngRtdbAjax(bucMntmngVO);
        resultMap.put("data", bucMntmngAccmltConectrdb);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :비즈니스 유지관리 누적접속자 db 위젯 AJAX  ************************/

    /******************* S :비즈니스 유지관리 유지관리 전일대비현황 위젯 db연동 화면 ************************/
    /**
     * 비즈니스 유지관리 전일대비현황 위젯 db연동 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucMntmngDaydbView.do")
    public String bucMntmngDaydbView(@ModelAttribute("bucMntmngVO") BucMntmngVO bucMntmngVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMntmng/BucMntmngDaydbView";
        return returnValue;
    }
    /******************* E : 비즈니스 유지관리 유지관리 전일대비현황 위젯 db연동 화면 ************************/

    /******************* S :비즈니스 유지관리 유지관리 전일대비현황 위젯 db연동  AJAX  ************************/
    /**
     * 비즈니스 유지관리 전일대비현황 위젯 db연동 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucMntmngdaydbAjax.do")
    public @ResponseBody ModelAndView bucMntmngdaydbAjax(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucMntmngVO") BucMntmngVO bucMntmngVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucMntmngVO> bucMntmngdaydbAjax = bucMntmngService.bucMntmngdaydbAjax(bucMntmngVO);
        resultMap.put("data", bucMntmngdaydbAjax);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :비즈니스 유지관리 유지관리 전일대비현황 위젯 db연동 AJAX  ************************/

    /******************* S :비즈니스 유지관리 구조물 점검현황 db연동 위젯 화면 ************************/
    /**
     * 비즈니스 구조물 점검현황 db연동
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucMntmngProfitToPlandbView.do")
    public String bucMntmngProfitToPlandbView(@ModelAttribute("bucMntmngVO") BucMntmngVO bucMntmngVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMntmng/BucMntmngProfitToPlandbView";
        return returnValue;
    }
    /******************* E : 비즈니스 유지관리 구조물 점검현황 db연동 위젯 화면 ************************/

    /******************* S :비즈니스 유지관리 구조물 점검현황 db연동(본부) 위젯 AJAX  ************************/
    /**
     * 비즈니스 구조물 점검현황 db연동 Ajax
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

  @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucMntmngProfitToPlanbonbuAjax.do")
    public @ResponseBody ModelAndView bucMntmngProfitToPlanbonbuAjax(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucMntmngVO") BucMntmngVO bucMntmngVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucMntmngVO> bucMntmngProfitToPlanbonbuAjax = bucMntmngService.bucMntmngProfitToPlanbonbuAjax(bucMntmngVO);
        resultMap.put("data", bucMntmngProfitToPlanbonbuAjax);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :비즈니스 유지관리 구조물 점검현황 db연동(본부) 위젯 AJAX  ************************/
    
  /******************* S :비즈니스 유지관리 MDT 운행 위젯 db연동 화면 ************************/
  /**
   * 비즈니스 유지관리 MDT 운행현황 화면
   *
   * @param request
   * @param response
   * @param session
   * @param model
   * @return
   * @throws Exception
   */
  @RequestMapping(value = "/buc/bucMntmngMdtRundbView.do")
  public String bucMntmngMdtRundbView(@ModelAttribute("bucMntmngVO") BucMntmngVO bucMntmngVO,
          HttpServletRequest request, HttpServletResponse response,
          HttpSession session, ModelMap model) throws Exception {

      String returnValue = "";
      returnValue = "egovframework/sdtic/bucrs/bucMntmng/BucMntmngMdtRundbView";
      return returnValue;
  }
  /******************* E : 비즈니스 유지관리 MDT 운행 위젯 db연동 화면 ************************/

  /******************* S :비즈니스 유지관리 MDT 운행 위젯 db연동 AJAX  ************************/
  /**
   * 비즈니스 유지관리 MDT 운행현황 AJAX
   *
   * @param request
   * @param response
   * @param session
   * @param model
   * @return
   * @throws Exception
   */

  @SuppressWarnings({ "rawtypes", "unchecked" })
  @RequestMapping(value = "/buc/bucMntmngMdtRundbAjax.do")
  public @ResponseBody ModelAndView bucMntmngMdtRundbAjax(
                                                  HttpServletRequest request,
                                                  HttpServletResponse response,
                                                  HttpSession session,
                                                  ModelMap model,
                                                  @ModelAttribute("bucMntmngVO") BucMntmngVO bucMntmngVO
                                                ) throws Exception
  {
      ModelAndView modelAndView = new ModelAndView();
      Map          resultMap    = new HashMap();
      List<BucMntmngVO> bucMntmngMdtRundbAjax = bucMntmngService.bucMntmngMdtRundbAjax(bucMntmngVO);
      resultMap.put("data", bucMntmngMdtRundbAjax);
      modelAndView.addAllObjects(resultMap);
      modelAndView.setViewName("jsonView");
      return modelAndView;
  }

  /******************* E :비즈니스 유지관리 MDT 운행 위젯 db연동 AJAX  ************************/
  
}


