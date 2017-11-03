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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.sdtic.main.service.MainCmmnService;
import egovframework.com.sdtic.main.service.MainCmmnVO;


//import flexjson.JSONSerializer;

/**
 * @Class Name : fecMainController.java
 * @Description : fecMainController Class
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
public class MainCmmnController {


    /** ifcDbService */
    @Resource(name = "mainCmmnService")
    private MainCmmnService mainCmmnService;
    /** EgovMessageSource */
    @Resource(name = "egovMessageSource")
    private EgovMessageSource egovMessageSource;

     /******************* S :SMS 전송 화면 ************************/
    /**
     * SMS 전송 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/main/mainCmmnSmsView.do")
    public String mainCmmnSmsView(@ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/main/MainCmmnSmsView";
        return returnValue;
    }
    /******************* E : SMS 전송 화면 ************************/

    /******************* S :SMS 전송 AJAX  ************************/
    /**
     * SMS 전송 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */

    // SuppressWarnings : 컴파일러 경고 제외 어노테이션
    // 1. all : 모든 경고를 억제
    // 2. cast : 캐스트 연산자 관련 경고 억제
    // 3. dep-ann : 사용하지 말아야 할 주석 관련 경고 억제
    // 4. deprecation : 사용하지 말아야 할 메소드 관련 경고 억제
    // 5. fallthrough : switch문에서의 break 누락 관련 경고 억제
    // 6. finally : 반환하지 않는 finally 블럭 관련 경고 억제
    // 7. null : null 분석 관련 경고 억제
    // 8. rawtypes : 제네릭을 사용하는 클래스 매개 변수가 불특정일 때의 경고 억제
    // 9. unchecked : 검증되지 않은 연산자 관련 경고 억제
    // 10. unused : 사용하지 않는 코드 관련 경고 억제

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/main/insertMainCmmnSms.do")
    public @ResponseBody ModelAndView insertMainCmmnSms(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();

        mainCmmnService.insertMainCmmnSms(mainCmmnVO);

        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

    /******************* E :인프라 DB 통합 위젯 AJAX  ************************/



     /******************* S : 위젯 Select 테스트 화면  ************************/
    /**
     * 위젯 Select 테스트 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/main/mainSelectTestView.do")
    public String mainSelectTestView(@ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/main/MainSelectTestView";
        return returnValue;
    }
    /******************* E : 위젯 Select 테스트 화면 ************************/



     /******************* S :보고서 목록 화면  ************************/
    /**
     * 보고서 목록 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/main/mainCmmnReportListView.do")
    public String mainCmmnReportListView(@ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/main/MainCmmnReportListView";
        return returnValue;
    }
    /******************* E : 보고서 목록 화면 ************************/


     /******************* S :보고서 목록 AJAX  ************************/
    /**
     * 보고서 목록 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/main/mainCmmnReportListAjax.do")
    public @ResponseBody ModelAndView mainCmmnReportListAjax(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();

        List<MainCmmnVO> ReportList = mainCmmnService.mainCmmnReportList(mainCmmnVO);
        resultMap.put("rows", ReportList);

        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;

    }
    /******************* E : 보고서 목록 AJAX ************************/

    /******************* S :보고서 입력 화면  ************************/
    /**
     * 보고서 입력 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/main/mainCmmnReportInstView.do")
    public String mainCmmnReportInstView(@ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/main/MainCmmnReportInstView";
        return returnValue;
    }
    /******************* E : 보고서 입력 화면 ************************/

    /******************* S :보고서 입력 액션  ************************/
    /**
     * 보고서 입력 액션
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/main/mainCmmnReportInst.do")
    public void mainCmmnReportInst(@ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

            //보고서 등록
            mainCmmnService.mainCmmnReportInst(mainCmmnVO);

    }
    /******************* E : 보고서 입력 액션 ************************/

    /******************* S :보고서 수정 화면  ************************/
    /**
     * 보고서 수정 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/main/mainCmmnReportUpdtView.do")
    public String mainCmmnReportUpdtView(@ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO,
                                         @RequestParam HashMap<String, Object> param,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

            String report_id = (String) param.get("report_id");
            mainCmmnVO.setReport_id((String) param.get("report_id"));
            MainCmmnVO data      = mainCmmnService.mainCmmnReportDetail(mainCmmnVO); // 보고서 상세보기
            model.addAttribute("data", data);

        String returnValue = "";
        returnValue = "egovframework/sdtic/main/MainCmmnReportUpdtView";
        return returnValue;
    }


    /******************* E : 보고서 입력/수정 화면 ************************/


    /******************* S :보고서 수정 액션  ************************/
    /**
     * 보고서 수정 액션
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/main/mainCmmnReportUpdt.do")
    public void mainCmmnReportUpdt(@ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

            //보고서 수정
            mainCmmnService.mainCmmnReportUpdt(mainCmmnVO);

    }
    /******************* E : 보고서 수정 액션 ************************/

    /******************* S :보고서 삭제 액션  ************************/
    /**
     * 보고서 삭제 액션
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/main/mainCmmnReportDel.do")
    public String mainCmmnReportDel(@ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

            //보고서 수정
            mainCmmnService.mainCmmnReportDel(mainCmmnVO);

        return "redirect:/main/mainCmmnReportListView.do";
    }
    /******************* E : 보고서 삭제 액션 ************************/

     /******************* S :장애등급 주기 관리 화면  ************************/
    /**
     * 장애등급 주기 관리 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/main/mainCmmnCycleManageView.do")
    public String mainCmmnCycleManageView(@ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/main/MainCmmnCycleManageView";
        return returnValue;
    }
    /******************* E : 장애등급 주기 관리 화면 ************************/

     /******************* S :장애등급 주기 AJAX  ************************/
    /**
     * 장애등급 주기 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/main/mainCmmnCycleManageAjax.do")
    public @ResponseBody ModelAndView mainCmmnCycleManageAjax(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();

        List<MainCmmnVO> rows = mainCmmnService.mainCmmnCycleManageAjax(mainCmmnVO);
        resultMap.put("rows", rows);

        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;

    }
    /******************* E : 장애등급 주기 AJAX ************************/

    /******************* S :장애등급 주기 수정 화면  ************************/
    /**
     * 장애등급 주기 수정 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/main/mainCmmnCycleManageDetailView.do")
    public String mainCmmnCycleManageDetailView(@ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO,
                                         @RequestParam HashMap<String, Object> param,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

            String manageseq = (String) param.get("manageseq");
            mainCmmnVO.setReport_id((String) param.get("manageseq"));
            MainCmmnVO data      = mainCmmnService.mainCmmnCycleManageDetail(mainCmmnVO); // 장애등급 주기 상세보기
            List sms      = mainCmmnService.mainCmmnSmsUserViewAjax(mainCmmnVO); // 사용자목록
            model.addAttribute("data", data);
            model.addAttribute("sms", sms);
            
        String returnValue = "";
        returnValue = "egovframework/sdtic/main/MainCmmnCycleManageDetailView";
        return returnValue;
    }


     /******************* S :장애등급 주기 수정 액션  ************************/
    /**
     * 장애등급 주기 수정 액션
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/main/mainCmmnCycleManageUpdtAjax.do")
    public void mainCmmnCycleManageUpdtAjax(@ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

            ModelAndView modelAndView = new ModelAndView();
            Map          resultMap    = new HashMap();

            mainCmmnService.updateMainCmmnCycleManageAjax(mainCmmnVO);

    }
    /******************* E : 장애등급 주기 수정 액션 ************************/

     /******************* S :SMS 사용자 목록 화면  ************************/
    /**
     * SMS 사용자 목록 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/main/mainCmmnSmsUserView.do")
    public String mainCmmnSmsUserView(@ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/main/MainCmmnSmsUserView";
        return returnValue;
    }
    /******************* E : SMS 사용자 목록 화면 ************************/

     /******************* S :SMS 사용자 목록 AJAX  ************************/
    /**
     * SMS 사용자 목록 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/main/mainCmmnSmsUserViewAjax.do")
    public @ResponseBody ModelAndView mainCmmnSmsUserViewAjax(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();

        List<MainCmmnVO> rows = mainCmmnService.mainCmmnSmsUserViewAjax(mainCmmnVO);
        resultMap.put("rows", rows);

        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;

    }
    /******************* E : SMS 사용자 목록 AJAX ************************/

     /******************* S :SMS 사용자 추가 화면  ************************/
    /**
     * SMS 사용자 추가 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/main/mainCmmnSmsUserInstView.do")
    public String mainCmmnSmsUserInstView(@ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/main/MainCmmnSmsUserInstView";
        return returnValue;
    }
    /******************* E : SMS 사용자 추가 화면 ************************/

     /******************* S :SMS 사용자 추가 AJAX  ************************/
    /**
     * S :SMS 사용자 추가 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/main/mainCmmnSmsUserInst.do")
    public @ResponseBody ModelAndView mainCmmnSmsUserInst(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();

        mainCmmnService.insertMainCmmnSmsUserAjax(mainCmmnVO);

        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;

    }
    /******************* E :SMS 사용자 추가 AJAX ************************/


    /******************* S :SMS 사용자 수정 AJAX  ************************/
   /**
    * S :SMS 사용자 수정 AJAX
    *
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
   @SuppressWarnings({ "rawtypes", "unchecked" })
   @RequestMapping(value = "/main/mainCmmnSmsUserUpdt.do")
   public @ResponseBody ModelAndView mainCmmnSmsUserUpdt(
                                                   HttpServletRequest request,
                                                   HttpServletResponse response,
                                                   HttpSession session,
                                                   ModelMap model,
                                                   @ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO
                                                 ) throws Exception
   {
       ModelAndView modelAndView = new ModelAndView();
       Map          resultMap    = new HashMap();

       mainCmmnService.updateMainCmmnSmsUserAjax(mainCmmnVO);

       modelAndView.addAllObjects(resultMap);
       modelAndView.setViewName("jsonView");
       return modelAndView;

   }
   /******************* E :SMS 사용자 수정 AJAX ************************/

   
     /******************* S :SMS 사용자 삭제화면   ************************/
    /**
     * S :SMS 사용자 삭제화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/main/mainCmmnSmsUserDelView.do")
    public String  mainCmmnSmsUserDelView(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO,
                                                    @RequestParam HashMap<String, Object> param
                                                  ) throws Exception
    {
            String user_seq = (String) param.get("user_seq");
            mainCmmnVO.setUser_seq((String) param.get("user_seq"));
            MainCmmnVO data      = mainCmmnService.mainCmmnSmsUserDelDetail(mainCmmnVO); // 사용자 상세(삭제)화면
            model.addAttribute("data", data);

        String returnValue = "";
        returnValue = "egovframework/sdtic/main/MainCmmnSmsUserDelView";
        return returnValue;


    }
    /******************* E :SMS 사용자 삭제화면 ************************/

    /******************* S :SMS 사용자 삭제 AJAX  ************************/
    /**
     * SMS 사용자 삭제 AJAX
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/main/mainCmmnSmsUserDel.do")
    public @ResponseBody ModelAndView mainCmmnSmsUserDel(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();

        mainCmmnService.deleteMainCmmnSmsUserAjax(mainCmmnVO);

        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    /******************* E : SMS 사용자 삭제 AJAX ************************/
    
    /******************* S :장애이력 목록 화면  ************************/
   /**
    * 장애이력 목록 화면
    *
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
   @RequestMapping(value = "/main/mainCmmnTroblHistListView.do")
   public String mainCmmnTroblHistListView(@ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO,
           HttpServletRequest request, HttpServletResponse response,
           HttpSession session, ModelMap model) throws Exception {

       String returnValue = "";
       returnValue = "egovframework/sdtic/main/MainCmmnTroblHistListView";
       return returnValue;
   }
   /******************* E : 장애이력 목록 화면 ************************/


    /******************* S :장애이력 목록 AJAX  ************************/
   /**
    * 장애이력 목록 AJAX
    *
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
   @SuppressWarnings({ "rawtypes", "unchecked" })
   @RequestMapping(value = "/main/mainCmmnTroblHistList.do")
   public @ResponseBody ModelAndView mainCmmnTroblHistList(
                                                   HttpServletRequest request,
                                                   HttpServletResponse response,
                                                   HttpSession session,
                                                   ModelMap model,
                                                   @ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO
                                                 ) throws Exception
   {
       ModelAndView modelAndView = new ModelAndView();
       Map          resultMap    = new HashMap();

       List<MainCmmnVO> TroblList = mainCmmnService.mainCmmnTroblHistList(mainCmmnVO);
       resultMap.put("rows", TroblList);

       modelAndView.addAllObjects(resultMap);
       modelAndView.setViewName("jsonView");
       return modelAndView;

   }
   /******************* E : 장애이력 목록 AJAX ************************/
   
   /******************* S :장애상세이력 목록 화면  ************************/
  /**
   * 장애상세이력 목록 화면
   *
   * @param request
   * @param response
   * @param session
   * @param model
   * @return
   * @throws Exception
   */
  @RequestMapping(value = "/main/mainCmmnTroblDetailHistListView.do")
  public String mainCmmnTroblDetailHistListView(@ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO,
          @RequestParam HashMap<String, Object> param,
          HttpServletRequest request, HttpServletResponse response,
          HttpSession session, ModelMap model) throws Exception {

      String troblseq = (String) param.get("troblseq");
      mainCmmnVO.setTroblseq((String) param.get("troblseq"));
      List<MainCmmnVO> TroblDetailList      = mainCmmnService.mainCmmnTroblDetailHistList(mainCmmnVO); // 장애상세이력조회
      model.addAttribute("rows", TroblDetailList);
	  
      String returnValue = "";
      returnValue = "egovframework/sdtic/main/MainCmmnTroblDetailHistListView";
      return returnValue;
  }
  /******************* E : 장애상세이력 목록 화면 ************************/


   /******************* S :장애상세이력 목록 AJAX  ************************/
  /**
   * 장애상세이력 목록 AJAX
   *
   * @param request
   * @param response
   * @param session
   * @param model
   * @return
   * @throws Exception
   */
  @SuppressWarnings({ "rawtypes", "unchecked" })
  @RequestMapping(value = "/main/mainCmmnTroblDetailHistList.do")
  public @ResponseBody ModelAndView mainCmmnTroblDetailHistList(
                                                  HttpServletRequest request,
                                                  HttpServletResponse response,
                                                  HttpSession session,
                                                  ModelMap model,
                                                  @ModelAttribute("mainCmmnVO") MainCmmnVO mainCmmnVO
                                                ) throws Exception
  {
      ModelAndView modelAndView = new ModelAndView();
      Map          resultMap    = new HashMap();

      List<MainCmmnVO> TroblDetailList = mainCmmnService.mainCmmnTroblDetailHistList(mainCmmnVO);
      resultMap.put("rows", TroblDetailList);

      modelAndView.addAllObjects(resultMap);
      modelAndView.setViewName("jsonView");
      return modelAndView; 

  }
  /******************* E : 장애상세이력 목록 AJAX ************************/
}
