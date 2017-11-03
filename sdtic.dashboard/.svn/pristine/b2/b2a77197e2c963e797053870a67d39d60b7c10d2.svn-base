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
import egovframework.com.sdtic.bucrs.service.bucMainVO;
import egovframework.com.sdtic.fecrs.service.FecMDTOperVO;
import egovframework.com.sdtic.fecrs.service.FecMainMapVO;
import egovframework.com.sdtic.fecrs.service.FecSearchVO;
import egovframework.com.sdtic.fecrs.service.fecMainService;
import egovframework.com.sdtic.fecrs.service.fecMainVO;

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
public class MainController {
    
    /**
    * 매인 대시보드
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "Main.do")    
    public String Main(     
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/main/FecMain";
        return returnValue;
    }
    /******************* E : 메인 대시보드 ************************/
    
    /**
     * 메인관제 왼쪽 흐름 위젯
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
     @RequestMapping(value = "bucMainLeftView.do")
     public String bucMainLeftView(     
                             HttpServletRequest request,
                             HttpServletResponse response,
                             HttpSession session,
                             ModelMap model
                         ) throws Exception
     {

         String returnValue = "";
         returnValue = "egovframework/sdtic/main/bucMainLeftView";
         return returnValue;
     }
     /******************* E : 메인관제 왼쪽 흐름 위젯 ************************/
     
     /**
      * 메인관제 오른쪽 흐름 위젯
      * @param request
      * @param response
      * @param session
      * @param model
      * @return
      * @throws Exception
      */
      @RequestMapping(value = "bucMainRightView.do")
      public String bucMainRightView(    
                              HttpServletRequest request,
                              HttpServletResponse response,
                              HttpSession session,
                              ModelMap model
                          ) throws Exception
      {

          String returnValue = "";
          returnValue = "egovframework/sdtic/main/bucMainRightView";
          return returnValue;
      }
      /******************* E : 메인관제 오른쪽 흐름 위젯 ************************/
      
      /**
       * 메인관제 상단 현장관리 위젯
       * @param request
       * @param response
       * @param session
       * @param model
       * @return
       * @throws Exception
       */
       @RequestMapping(value = "MainSpteqpView.do")
       public String MainSpteqpView(    
                               HttpServletRequest request,
                               HttpServletResponse response,
                               HttpSession session,
                               ModelMap model
                           ) throws Exception
       {

           String returnValue = "";
           returnValue = "egovframework/sdtic/main/MainSpteqpView";
           return returnValue;
       }
       /******************* E : 메인관제 상단 현장관리 위젯 ************************/
       
       /**
        * 메인관제 상단 인프라 위젯
        * @param request
        * @param response
        * @param session
        * @param model
        * @return
        * @throws Exception
        */
        @RequestMapping(value = "MainInfraView.do")
        public String MainInfraView(    
                                HttpServletRequest request,
                                HttpServletResponse response,
                                HttpSession session,
                                ModelMap model
                            ) throws Exception
        {

            String returnValue = "";
            returnValue = "egovframework/sdtic/main/MainInfraView";
            return returnValue;
        }
        /******************* E : 메인관제  상단 인프라 위젯 ************************/
        
        /**
         * 메인관제 상단 비즈니스 위젯
         * @param request
         * @param response
         * @param session
         * @param model
         * @return
         * @throws Exception
         */
         @RequestMapping(value = "MainBusinessView.do")
         public String MainBusinessView(    
                                 HttpServletRequest request,
                                 HttpServletResponse response,
                                 HttpSession session,
                                 ModelMap model
                             ) throws Exception
         {

             String returnValue = "";
             returnValue = "egovframework/sdtic/main/MainBusinessView";
             return returnValue;
         }
         /******************* E : 메인관제 상단 비즈니스 위젯 ************************/

}




