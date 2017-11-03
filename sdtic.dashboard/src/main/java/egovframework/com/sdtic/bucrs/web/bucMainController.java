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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.Globals;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.sdtic.bucrs.service.BucCmmnVO;
import egovframework.com.sdtic.bucrs.service.bucMainService;
import egovframework.com.sdtic.bucrs.service.bucMainVO;
import egovframework.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;

/**
 * @Class Name : bucMainController.java
 * @Description : bucMainController Class
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
public class bucMainController {


    /** bucMainService      */  @Resource(name = "bucMainService")      private     bucMainService          bucMainService;
    /** EgovMessageSource   */  @Resource(name = "egovMessageSource")   private     EgovMessageSource       egovMessageSource;

    /******************* S :비지니스 매인 위젯 ************************/

    /**
    * 비지니스 매인 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucMain.do")
    public String Main(     @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/bucMain";
        return returnValue;
    }
    /******************* E : 비지니스 매인 위젯 ************************/

    /******************* S :비지니스 서브1 위젯 ************************/

    /**
    * 비지니스 서브1 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucSub1.do")
    public String bucSub1(  @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/bucSub1";
        return returnValue;
    }
    /******************* E : 비지니스 서브1 위젯 ************************/

    /******************* S :비지니스 서브2 위젯 ************************/

    /**
    * 비지니스 서브2 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucSub2.do")
    public String bucSub2(  @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/bucSub2";
        return returnValue;
    }
    /******************* E : 비지니스 서브2 위젯 ************************/

    /******************* S :비지니스 서브3 위젯 ************************/

    /**
    * 비지니스 서브3 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucSub3.do")
    public String bucSub3(  @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/bucSub3";
        return returnValue;
    }
    /******************* E : 비지니스 서브3 위젯 ************************/

    /******************* S :비지니스 서브4 위젯 ************************/

    /**
    * 비지니스 서브4 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucSub4.do")
    public String bucSub4(  @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/bucSub4";
        return returnValue;
    }
    /******************* E : 비지니스 서브4 위젯 ************************/

    /******************* S :비지니스 서브5 위젯 ************************/

    /**
    * 비지니스 서브5 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucSub5.do")
    public String bucSub5(  @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/bucSub5";
        return returnValue;
    }
    /******************* E : 비지니스 서브5 위젯 ************************/

    /******************* S :비지니스 서브6 위젯 ************************/

    /**
    * 비지니스 서브6 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucSub6.do")
    public String bucSub6(  @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/bucSub6";
        return returnValue;
    }
    /******************* E : 비지니스 서브6 위젯 ************************/
    /******************* S :비지니스 서브7 위젯 ************************/

    /**
    * 비지니스 서브7 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucSub7.do")
    public String bucSub7(  @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/bucSub7";
        return returnValue;
    }
    /******************* E : 비지니스 서브7 위젯 ************************/


    /******************* S :비지니스 서브8 위젯 ************************/

    /**
    * 비지니스 서브8 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucSub8.do")
    public String bucSub8(  @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/bucSub8";
        return returnValue;
    }
    /******************* E : 비지니스 서브8 위젯 ************************/


    /******************* S :비지니스 서브9 위젯 ************************/

    /**
    * 비지니스 서브9 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucSub9.do")
    public String bucSub9(  @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/bucSub9";
        return returnValue;
    }
    /******************* E : 비지니스 서브9 위젯 ************************/


    /******************* S :비지니스 서브10 위젯 ************************/

    /**
    * 비지니스 서브10 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucSub10.do")
    public String bucSub10(  @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/bucSub10";
        return returnValue;
    }
    /******************* E : 비지니스 서브10 위젯 ************************/


    /******************* S :비지니스 서브11 위젯 ************************/

    /**
    * 비지니스 서브11 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucSub11.do")
    public String bucSub11(  @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/bucSub11";
        return returnValue;
    }
    /******************* E : 비지니스 서브11 위젯 ************************/


    /******************* S :비지니스 블랙 매인 위젯 ************************/

    /**
    * 비지니스 블랙 매인 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucBMain.do")
    public String bucBMain(     @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/bucBMain";
        return returnValue;
    }
    /******************* E : 비지니스 블랙 매인 위젯 ************************/

    /******************* S :비지니스 블랙 서브 1 위젯 ************************/

    /**
    * 비지니스 블랙 서브 1 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucBSub1.do")
    public String bucBSub1(  @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/bucBSub1";
        return returnValue;
    }
    /******************* E : 비지니스 블랙 서브 1 위젯 ************************/

    /******************* S :비지니스 블랙 서브 2 위젯 ************************/

    /**
    * 비지니스 블랙 서브 2 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucBSub2.do")
    public String bucBSub2(  @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/bucBSub2";
        return returnValue;
    }
    /******************* E : 비지니스 블랙 서브 2 위젯 ************************/

    /******************* S :비지니스 블랙 서브 3 위젯 ************************/

    /**
    * 비지니스 블랙 서브 3 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucBSub3.do")
    public String bucBSub3(  @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/bucBSub3";
        return returnValue;
    }
    /******************* E : 비지니스 블랙 서브 3 위젯 ************************/

    /******************* S :비지니스 블랙 서브 4 위젯 ************************/

    /**
    * 비지니스 블랙 서브 4 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucBSub4.do")
    public String bucBSub4(  @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/bucBSub4";
        return returnValue;
    }
    /******************* E : 비지니스 블랙 서브 4 위젯 ************************/

    /******************* S :비지니스 블랙 서브 5 위젯 ************************/

    /**
    * 비지니스 블랙 서브 5 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucBSub5.do")
    public String bucBSub5(  @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/bucBSub5";
        return returnValue;
    }
    /******************* E : 비지니스 블랙 서브 5 위젯 ************************/

    /******************* S :비지니스 블랙 서브 6 위젯 ************************/

    /**
    * 비지니스 블랙 서브 6 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucBSub6.do")
    public String bucBSub6(  @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/bucBSub6";
        return returnValue;
    }
    /******************* E : 비지니스 블랙 서브 6 위젯 ************************/
    /******************* S :비지니스 블랙 서브 7 위젯 ************************/

    /**
    * 비지니스 블랙 서브 7 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucBSub7.do")
    public String bucBSub7(  @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/bucBSub7";
        return returnValue;
    }
    /******************* E : 비지니스 블랙 서브 7 위젯 ************************/


    /******************* S :비지니스 블랙 서브 8 위젯 ************************/

    /**
    * 비지니스 블랙 서브 8 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucBSub8.do")
    public String bucBSub8(  @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/bucBSub8";
        return returnValue;
    }
    /******************* E : 비지니스 블랙 서브 8 위젯 ************************/


    /******************* S :비지니스 블랙 서브 9 위젯 ************************/

    /**
    * 비지니스 블랙 서브 9 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucBSub9.do")
    public String bucBSub9(  @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/bucBSub9";
        return returnValue;
    }
    /******************* E : 비지니스 블랙 서브 9 위젯 ************************/


    /******************* S :비지니스 블랙 서브 10 위젯 ************************/

    /**
    * 비지니스 블랙 서브 10 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucBSub10.do")
    public String bucBSub10(  @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/bucBSub10";
        return returnValue;
    }
    /******************* E : 비지니스 블랙 서브 10 위젯 ************************/


    /******************* S :비지니스 블랙 서브 11 위젯 ************************/

    /**
    * 비지니스 블랙 서브 11 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucBSub11.do")
    public String bucBSub11(  @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/bucBSub11";
        return returnValue;
    }
    /******************* E : 비지니스 블랙 서브 11 위젯 ************************/

    /******************* S :비지니스 블랙 서브 11 위젯 ************************/

    /**
    * 비지니스 블랙 서브 11 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/test.do")
    public String test(  @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/test";
        return returnValue;
    }
    /******************* E : 비지니스 블랙 서브 11 위젯 ************************/
    
    
    /******************* S : 메인관제 비즈니스 SMS 위젯 ************************/

    /**
    * 메인관제 비즈니스 SMS 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucMainSmsSndngView.do")
    public String bucMainSmsSndngView(     @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/BucMainSmsSndngView";
        return returnValue;
    }
    /******************* E : 비지니스 매인 위젯 ************************/
    
    /******************* S : 메인관제 비즈니스 설계도서 위젯 ************************/

    /**
    * 메인관제 비즈니스 설계도서 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucMainDsgnIslndsView.do")
    public String bucMainDsgnIslndsView(     @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/BucMainDsgnIslndsView";
        return returnValue;
    }
    /******************* E : 비지니스 매인 위젯 ************************/
    
    /******************* S : 메인관제 비즈니스 건설사업단 공정율 위젯 ************************/

    /**
    * 메인관제 비즈니스 건설사업단 공정율 설계도서 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucMainBnstyFairRtView.do")
    public String bucMainBnstyFairRtView(     @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/BucMainBnstyFairRtView";
        return returnValue;
    }
    /******************* E : 비지니스 건설사업단 공정율 위젯 ************************/
    
    /******************* S : 메인관제 비즈니스 건설공정율 위젯 ************************/

    /**
    * 메인관제 비즈니스 건설공정율 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucMainMntmngChckView.do")
    public String bucMainMntmngChckView(     @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/BucMainMntmngChckView";
        return returnValue;
    }
    /******************* E : 비지니스 건설공정율 위젯 ************************/
    
    
    
    
    /******************* S : 메인관제 비즈니스 건설공정율 34종(히트맵)위젯 ************************/

    /**
    * 메인관제 비즈니스 건설공정율 34종(히트맵)
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucMainFcltsDataTrnsferRtView.do")
    public String bucMainFcltsDataTrnsferRtView(     @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/BucMainFcltsDataTrnsferRtView";
        return returnValue;
    }
    /******************* E : 비지니스 건설공정율 34종(히트맵) 위젯 ************************/

    /******************* S :비즈니스 메인 도로정보시스템 활용메뉴 Top5 DB연동 화면 ************************/
	/**
	 * 비즈니스 공통  메인 도로정보시스템 활용메뉴 Top5 DB연동 화면
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buc/bucMainTopmenudbView.do")
	public String bucMainTopmenudbView(@ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, ModelMap model) throws Exception {

		String returnValue = "";
		returnValue = "egovframework/sdtic/bucrs/bucMain/BucMainTopmenudbView";
		return returnValue;
	}

	/******************* E : 비즈니스 메인 도로정보시스템 활용메뉴 Top5 DB연동 화면 ************************/

	/******************* S :비즈니스 메인 도로정보시스템 활용메뉴 Top5 DB연동 AJAX ************************/
	/**
	 * 비즈니스 공통 메인 도로정보시스템 활용메뉴 Top5 DB연동 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucMainTopmenudb.do")
	public @ResponseBody ModelAndView bucMainTopmenudb(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucCmmnVO") BucCmmnVO bucCmmnVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<BucCmmnVO> bucMainTopmenudb = bucMainService.bucMainTopmenudbAjax(bucCmmnVO);
		resultMap.put("data", bucMainTopmenudb);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 메인 도로정보시스템 활용메뉴 Top5 DB연동 AJAX ************************/
	
    /******************* S : 메인관제 비즈니스 건설사업단 공정율 db 위젯 ************************/

    /**
    * 메인관제 비즈니스 건설사업단 공정율 설계도서 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/buc/bucMainBnstyFairRtdbView.do")
    public String bucMainBnstyFairRtdbView(     @ModelAttribute("bucMainVO") bucMainVO bucMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/bucrs/bucMain/BucMainBnstyFairRtdbView";
        return returnValue;
    }
    /******************* E : 비지니스 건설사업단 공정율 db 위젯 ************************/
    
	/******************* S :비즈니스 메인 건설사업단 공정율 db연동 AJAX ************************/
	/**
	 * 비즈니스 공통 메인 도로정보시스템 활용메뉴 Top5 DB연동 AJAX
	 *
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/buc/bucMainBnstyFairRtdbAjax.do")
	public @ResponseBody ModelAndView bucMainBnstyFairRtdbAjax(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, ModelMap model, @ModelAttribute("bucMainVO") bucMainVO bucMainVO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Map resultMap = new HashMap();
		List<bucMainVO> bucMainBnstyFairRtdbAjax = bucMainService.bucMainBnstyFairRtdbAjax(bucMainVO);
		resultMap.put("data", bucMainBnstyFairRtdbAjax);
		modelAndView.addAllObjects(resultMap);
		modelAndView.setViewName("jsonView");
		return modelAndView;
	}

	/******************* E :비즈니스 메인 건설사업단 공정율 db 연동 AJAX ************************/
}




