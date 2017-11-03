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
import egovframework.com.sdtic.bucrs.service.BucFcltsService;
import egovframework.com.sdtic.bucrs.service.BucFcltsVO;
import egovframework.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;

/**
 * @Class Name : BucFcltsController.java
 * @Description : BucFcltsController Class
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
public class BucFcltsController {

    /** bucFcltsService */
    @Resource(name = "bucFcltsService")
    private BucFcltsService bucFcltsService;
    /** EgovMessageSource */
    @Resource(name = "egovMessageSource")
    private EgovMessageSource egovMessageSource;

    /******************* S :비즈니스 시설물 누적접속자 위젯 화면 ************************/
    /**
     * 비즈니스 시설물 누적접속자 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucFcltsAccmltConectrView.do")
    public String bucFcltsAccmltConectrView(@ModelAttribute("bucFcltsVO") BucFcltsVO bucFcltsVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucFclts/BucFcltsAccmltConectrView";
        return returnValue;
    }
    /******************* E : 비즈니스 시설물 누적접속자 위젯 화면 ************************/

    /******************* S :비즈니스 시설물 누적접속자 위젯 AJAX  ************************/
    /**
     * 비즈니스 시설물 누적접속자 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucFcltsAccmltConectrAjax.do")
    public @ResponseBody ModelAndView bucFcltsAccmltConectr(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucFcltsVO") BucFcltsVO bucFcltsVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucFcltsVO> bucFcltsAccmltConectr = bucFcltsService.bucFcltsAccmltConectrAjax(bucFcltsVO);
        resultMap.put("data", bucFcltsAccmltConectr);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :비즈니스 시설물 누적접속자 위젯 AJAX  ************************/
    
    /******************* S :비즈니스 시설물 누적접속자 위젯 AJAX  ************************/
    /**
     * 비즈니스 시설물 누적접속자 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucFcltsRtAjax.do")
    public @ResponseBody ModelAndView bucFcltsRtAjax(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucFcltsVO") BucFcltsVO bucFcltsVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucFcltsVO> bucFcltsAccmltConectr = bucFcltsService.bucFcltsRtAjax(bucFcltsVO);
        resultMap.put("data", bucFcltsAccmltConectr);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :비즈니스 시설물 누적접속자 위젯 AJAX  ************************/
    
    /******************* S :비즈니스 시설물 34종 데이터 입력률 위젯 화면 ************************/
    /**
     * 비즈니스 시설물 34종 데이터 입력률 위젯 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucFcltsInputRateView.do")
    public String bucFcltsInputRateView(@ModelAttribute("bucFcltsVO") BucFcltsVO bucFcltsVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucFclts/BucFcltsInputRateView";
        return returnValue;
    }
    /******************* E : 비즈니스 시설물 34종 데이터 입력률 위젯 화면 ************************/

    /******************* S :비즈니스 시설물 34종 데이터 입력률 위젯 AJAX  ************************/
    /**
     * 비즈니스 시설물 34종 데이터 입력률 위젯 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucFcltsInputRate.do")
    public @ResponseBody ModelAndView bucFcltsInputRateView(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucFcltsVO") BucFcltsVO bucFcltsVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucFcltsVO> bucFcltsInputRate = bucFcltsService.bucFcltsInputRateAjax(bucFcltsVO);
        resultMap.put("data", bucFcltsInputRate);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :비즈니스 시설물 34종 데이터 입력률 위젯 AJAX  ************************/
    
    
    /******************* S :비즈니스 시설물 누적접속자 위젯 db연동화면 ************************/
    /**
     * 비즈니스 시설물 누적접속자 위젯 db연동 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucFcltsAccmltConectrdbView.do")
    public String bucFcltsAccmltConectrView1(@ModelAttribute("bucFcltsVO") BucFcltsVO bucFcltsVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucFclts/BucFcltsAccmltConectrdbView";
        return returnValue;
    }
    /******************* E : 비즈니스 시설물 누적접속자 위젯 db연동화면 ************************/
    
    /******************* S :비즈니스 시설물 34종 데이터 입력률 위젯 화면(히트맵) ************************/
    /**
     * 비즈니스 시설물 34종 데이터 입력률 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucFcltsDataTransferView.do")
    public String bucFcltsDataTransferView(@ModelAttribute("bucFcltsVO") BucFcltsVO bucFcltsVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucFclts/BucFcltsDataTransferView";
        return returnValue;
    }
    /******************* E : 비즈니스 시설물 34종 데이터 입력률 위젯 화면(히트맵) ************************/

    /******************* S :비즈니스 시설물 34종 데이터 입력률 위젯 AJAX(히트맵) ************************/
    /**
     * 비즈니스 시설물 34종 데이터 입력률 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/BucFcltsDataTransferAjax.do")
    public @ResponseBody ModelAndView bucFcltsDataTransferAjax(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucFcltsVO") BucFcltsVO bucFcltsVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucFcltsVO> bucFcltsDataTransfer = bucFcltsService.BucFcltsDataTransferAjax(bucFcltsVO);
        resultMap.put("data", bucFcltsDataTransfer);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :비즈니스 시설물 34종 데이터 입력률 위젯 AJAX(히트맵)  ************************/
    
    /******************* S :비즈니스 시설물 고장 top20 위젯 화면 ************************/
    /**
     * 비즈니스 시설물 고장 top20 위젯 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucFcltsBrokenfercilitytopView.do")
    public String bucFcltsBrokenfercilitytopView(@ModelAttribute("bucFcltsVO") BucFcltsVO bucFcltsVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucFclts/BucFcltsBrokenfercilitytopView";
        return returnValue;
    }
    /******************* E : 비즈니스 시설물 고장 top20 위젯 화면 ************************/

    /******************* S :비즈니스 시설물 고장 top20 위젯 AJAX  ************************/
    /**
     * 비즈니스 시설물 고장 top20 위젯 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucFcltsBrokenfercilitytop.do")
    public @ResponseBody ModelAndView bucFcltsBrokenfercilitytop(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucFcltsVO") BucFcltsVO bucFcltsVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucFcltsVO> bucFcltsDataTransfer = bucFcltsService.bucFcltsBrokenfercilitytop(bucFcltsVO);
        resultMap.put("data", bucFcltsDataTransfer);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :비즈니스 시설물 고장 top20 위젯 AJAX  ************************/
    
    /******************* S :비즈니스 시설물 고장평균처리일 위젯 화면 ************************/
    /**
     * 비즈니스 시설물 고장평균처리일 위젯 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucFcltsBrokenproavgdayView.do")
    public String bucFcltsBrokenproavgdayView(@ModelAttribute("bucFcltsVO") BucFcltsVO bucFcltsVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucFclts/BucFcltsBrokenproavgdayView";
        return returnValue;
    }
    /******************* E : 비즈니스 시설물 고장평균처리일 위젯 화면 ************************/

    /******************* S :비즈니스 시설물 고장평균처리일 위젯 AJAX  ************************/
    /**
     * 비즈니스 시설물 고장평균처리일 위젯 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/buc/bucFcltsBrokenproavgday.do")
    public @ResponseBody ModelAndView bucFcltsBrokenproavgday(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("bucFcltsVO") BucFcltsVO bucFcltsVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<BucFcltsVO> bucFcltsDataTransfer = bucFcltsService.bucFcltsBrokenproavgday(bucFcltsVO);
        resultMap.put("data", bucFcltsDataTransfer);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :비즈니스 시설물 고장평균처리일 위젯 AJAX  ************************/
    /******************* S :비즈니스 시설물 고장평균처리일 위젯 db연동 화면 ************************/
    /**
     * 비즈니스 시설물 고장평균처리일 위젯 db연동 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/buc/bucFcltsBrokenproavgdaydbView.do")
    public String bucFcltsBrokenproavgdaydbView(@ModelAttribute("bucFcltsVO") BucFcltsVO bucFcltsVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucFclts/BucFcltsBrokenproavgdaydbView";
        return returnValue;
    }
    /******************* E : 비즈니스 시설물 고장평균처리일 위젯 db연동 화면 ************************/

    /******************* S :비즈니스 시설물 고장평균처리일 위젯 db연동 AJAX  ************************/
    /**
     * 비즈니스 시설물 고장평균처리일 위젯 db연동 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    
     @SuppressWarnings({ "rawtypes", "unchecked" })
     @RequestMapping(value = "/buc/bucFcltsBrokenproavgdaydb.do")
     public @ResponseBody ModelAndView bucFcltsBrokenproavgdaydbAjax(
                                                     HttpServletRequest request,
                                                     HttpServletResponse response,
                                                     HttpSession session,
                                                     ModelMap model,
                                                     @ModelAttribute("bucFcltsVO") BucFcltsVO bucFcltsVO
                                                   ) throws Exception
     {
         ModelAndView modelAndView = new ModelAndView();
         Map          resultMap    = new HashMap();
         List<BucFcltsVO> bucFcltsBrokenproavgdaybonbuAjax = bucFcltsService.bucFcltsBrokenproavgdaybonbuAjax(bucFcltsVO);
         List<BucFcltsVO> bucFcltsBrokenproavgdayjisaAjax = bucFcltsService.bucFcltsBrokenproavgdayjisaAjax(bucFcltsVO);
         resultMap.put("data1", bucFcltsBrokenproavgdaybonbuAjax);
         resultMap.put("data2", bucFcltsBrokenproavgdayjisaAjax);
         modelAndView.addAllObjects(resultMap);
         modelAndView.setViewName("jsonView");
         return modelAndView;
     }
    /******************* E :비즈니스 시설물 고장평균처리일 위젯 db연동 AJAX  ************************/
     
     
     /******************* S :비즈니스 시설물 고장 top20 위젯 db연동화면 ************************/
     /**
      * 비즈니스 시설물 고장 top20 위젯 db연동 화면
      *
      * @param request
      * @param response
      * @param session
      * @param model
      * @return
      * @throws Exception
      */
     @RequestMapping(value = "/buc/bucFcltsBrokenfercilitytopdbView.do")
     public String bucFcltsBrokenfercilitytopdbView(@ModelAttribute("bucFcltsVO") BucFcltsVO bucFcltsVO,
             HttpServletRequest request, HttpServletResponse response,
             HttpSession session, ModelMap model) throws Exception {

         String returnValue = "";
         returnValue = "egovframework/sdtic/bucrs/bucFclts/BucFcltsBrokenfercilitytopdbView";
         return returnValue;
     }
     /******************* E : 비즈니스 시설물 고장 top20 위젯 db연동 화면 ************************/

     /******************* S :비즈니스 시설물 고장 top20 위젯 db연동 AJAX  ************************/
     /**
      * 비즈니스 시설물 고장 top20 위젯 db연동 AJAX
      *
      * @param request
      * @param response
      * @param session
      * @param model
      * @return
      * @throws Exception
      */

     @SuppressWarnings({ "rawtypes", "unchecked" })
     @RequestMapping(value = "/buc/bucFcltsBrokenfercilitytopdbAjax.do")
     public @ResponseBody ModelAndView bucFcltsBrokenfercilitytopdbAjax(
                                                     HttpServletRequest request,
                                                     HttpServletResponse response,
                                                     HttpSession session,
                                                     ModelMap model,
                                                     @ModelAttribute("bucFcltsVO") BucFcltsVO bucFcltsVO
                                                   ) throws Exception
     {
         ModelAndView modelAndView = new ModelAndView();
         Map          resultMap    = new HashMap();
         List<BucFcltsVO> bucFcltsBrokenfercilitytopdbAjax = bucFcltsService.bucFcltsBrokenfercilitytopdbAjax(bucFcltsVO);
         resultMap.put("data", bucFcltsBrokenfercilitytopdbAjax);
         modelAndView.addAllObjects(resultMap);
         modelAndView.setViewName("jsonView");
         return modelAndView;
     }

     /******************* E :비즈니스 시설물 고장 top20 위젯 db연동 AJAX  ************************/
     
     
     /******************* S :비즈니스 시설물 34종 데이터 이관율 위젯 db연동 화면  ************************/
     /**
      * 비즈니스 시설물 34종 데이터 이관율 위젯 db연동 화면
      *
      * @param request
      * @param response
      * @param session
      * @param model
      * @return
      * @throws Exception
      */
     @RequestMapping(value = "/buc/bucFcltsDataTransferdbView.do")
     public String bucFcltsDataTransferdbView(@ModelAttribute("bucFcltsVO") BucFcltsVO bucFcltsVO,
             HttpServletRequest request, HttpServletResponse response,
             HttpSession session, ModelMap model) throws Exception {

         String returnValue = "";
         returnValue = "egovframework/sdtic/bucrs/bucFclts/BucFcltsDataTransferdbView";
         return returnValue;
     }
     /******************* E : 비즈니스 시설물 34종 데이터 이관율 위젯 db연동 화면 ************************/

     /******************* S :비즈니스 시설물 34종 데이터 이관율 위젯 db연동 AJAX  ************************/
     /**
      * 비즈니스 시설물 34종 데이터 이관율 위젯 db연동 AJAX
      *
      * @param request
      * @param response
      * @param session
      * @param model
      * @return
      * @throws Exception
      */

     @SuppressWarnings({ "rawtypes", "unchecked" })
     @RequestMapping(value = "/buc/bucFcltsDataTransferdbAjax.do")
     public @ResponseBody ModelAndView bucFcltsDataTransferdbAjax(
                                                     HttpServletRequest request,
                                                     HttpServletResponse response,
                                                     HttpSession session,
                                                     ModelMap model,
                                                     @ModelAttribute("bucFcltsVO") BucFcltsVO bucFcltsVO
                                                   ) throws Exception
     {
         ModelAndView modelAndView = new ModelAndView();
         Map          resultMap    = new HashMap();
         List<BucFcltsVO> bucFcltsDataTransferdbAjax = bucFcltsService.bucFcltsDataTransferdbAjax(bucFcltsVO);
         resultMap.put("data", bucFcltsDataTransferdbAjax);
         modelAndView.addAllObjects(resultMap);
         modelAndView.setViewName("jsonView");
         return modelAndView;
     }

     /******************* E :비즈니스 시설물 34종 데이터 이관율 위젯 db연동 AJAX  ************************/
     
     /******************* S :비즈니스 시설물 34종 데이터 입력률 위젯 db연동 화면  ************************/
     /**
      * 비즈니스 시설물 34종 데이터 입력률 위젯 db연동 화면
      *
      * @param request
      * @param response
      * @param session
      * @param model
      * @return
      * @throws Exception
      */
     @RequestMapping(value = "/buc/bucFclts34EscalationRatedbView.do")
     public String bucFclts34EscalationRatedbView(@ModelAttribute("bucFcltsVO") BucFcltsVO bucFcltsVO,
             HttpServletRequest request, HttpServletResponse response,
             HttpSession session, ModelMap model) throws Exception {

         String returnValue = "";
         returnValue = "egovframework/sdtic/bucrs/bucFclts/BucFclts34EscalationRatedbView";
         return returnValue;
     }
     /******************* E : 비즈니스 시설물 34종 데이터 입력률 위젯 db연동 화면 ************************/

     /******************* S :비즈니스 시설물 34종 데이터 입력률 위젯 db연동 AJAX  ************************/
     /**
      * 비즈니스 시설물 34종 데이터 입력률 위젯 db연동 AJAX
      *
      * @param request
      * @param response
      * @param session
      * @param model
      * @return
      * @throws Exception
      */

     @SuppressWarnings({ "rawtypes", "unchecked" })
     @RequestMapping(value = "/buc/bucFclts34EscalationRatedbAjax.do")
     public @ResponseBody ModelAndView bucFclts34EscalationRatedbAjax (
                                                     HttpServletRequest request,
                                                     HttpServletResponse response,
                                                     HttpSession session,
                                                     ModelMap model,
                                                     @ModelAttribute("bucFcltsVO") BucFcltsVO bucFcltsVO
                                                   ) throws Exception
     {
         ModelAndView modelAndView = new ModelAndView();
         Map          resultMap    = new HashMap();
         List<BucFcltsVO> bucFclts34EscalationRatedbAjax = bucFcltsService.bucFclts34EscalationRatedbAjax(bucFcltsVO);
         resultMap.put("data", bucFclts34EscalationRatedbAjax);
         modelAndView.addAllObjects(resultMap);
         modelAndView.setViewName("jsonView");
         return modelAndView;
     }

     /******************* E :비즈니스 시설물 34종 데이터 입력률 위젯 db연동 AJAX  ************************/
     
     /******************* S :비즈니스 시설물 오수 위젯 db연동 화면  ************************/
     /**
      * 비즈니스 시설물 34종 데이터 입력률 위젯 db연동 화면
      *
      * @param request
      * @param response
      * @param session
      * @param model
      * @return
      * @throws Exception
      */
     @RequestMapping(value = "/buc/bucFcltsPollutedWaterdbView.do")
     public String bucFcltsPollutedWaterdbView(@ModelAttribute("bucFcltsVO") BucFcltsVO bucFcltsVO,
             HttpServletRequest request, HttpServletResponse response,
             HttpSession session, ModelMap model) throws Exception {

         String returnValue = "";
         returnValue = "egovframework/sdtic/bucrs/bucFclts/BucFcltsPollutedWaterdbView";
         return returnValue;
     }
     /******************* E : 비즈니스 시설물 오수 db연동 화면 ************************/

     /******************* S :비즈니스 시설물 오수 db연동 AJAX  ************************/
     /**
      * 비즈니스 시설물 34종 데이터 입력률 위젯 db연동 AJAX
      *
      * @param request
      * @param response
      * @param session
      * @param model
      * @return
      * @throws Exception
      */

     @SuppressWarnings({ "rawtypes", "unchecked" })
     @RequestMapping(value = "/buc/bucFcltsPollutedWaterdbAjax.do")
     public @ResponseBody ModelAndView bucFcltsPollutedWaterdbAjax (
                                                     HttpServletRequest request,
                                                     HttpServletResponse response,
                                                     HttpSession session,
                                                     ModelMap model,
                                                     @ModelAttribute("bucFcltsVO") BucFcltsVO bucFcltsVO
                                                   ) throws Exception
     {
         ModelAndView modelAndView = new ModelAndView();
         Map          resultMap    = new HashMap();
         List<BucFcltsVO> bucFcltsPollutedWaterdbAjax = bucFcltsService.bucFcltsPollutedWaterdbAjax(bucFcltsVO);
         resultMap.put("data", bucFcltsPollutedWaterdbAjax);
         modelAndView.addAllObjects(resultMap);
         modelAndView.setViewName("jsonView");
         return modelAndView;
     }

     /******************* E :비즈니스 시설물 오수 db연동 AJAX  ************************/
     
     
    
}
