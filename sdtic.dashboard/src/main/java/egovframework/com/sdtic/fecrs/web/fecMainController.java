package egovframework.com.sdtic.fecrs.web;

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
import egovframework.com.sdtic.fecrs.service.FecBrineVO;
import egovframework.com.sdtic.fecrs.service.FecElctyLampVO;
import egovframework.com.sdtic.fecrs.service.FecElctyTollgateVO;
import egovframework.com.sdtic.fecrs.service.FecElctyTunnelVO;
import egovframework.com.sdtic.fecrs.service.FecMDTOperVO;
import egovframework.com.sdtic.fecrs.service.FecPltwtrProcessVO;
import egovframework.com.sdtic.fecrs.service.FecPwrerUsgqtyVO;
import egovframework.com.sdtic.fecrs.service.FecSearchVO;
import egovframework.com.sdtic.fecrs.service.FecSlopeVO;
import egovframework.com.sdtic.fecrs.service.FecTunnelDetailVO;
import egovframework.com.sdtic.fecrs.service.fecEventVO;
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
public class fecMainController extends fecCommon{

    /** fecMainService      */  @Resource(name = "fecMainService")      private     fecMainService          fecMainService;
    /** EgovMessageSource   */  @Resource(name = "egovMessageSource")   private     EgovMessageSource       egovMessageSource;
	private FecSearchVO fecSearchVO;
    
    /******************* S :현장설비 메인맵 1레벨 위젯 ************************/

    /**
    * 현장설비 메인맵 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/fecMainMapLv1View.do")
    public String fecMainMapLv1View(     @ModelAttribute("fecMainVO") fecMainVO fecMainVO,
    						@RequestParam(value="sabun", required=false) String sabun,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/fecrs/FecMainMapLv1View";
        return returnValue;
    }
    /******************* E : 현장설비 메인맵 1레벨 위젯 ************************/  
    
    /******************* S :현장설비 메인맵 2레벨 위젯 ************************/

    /**
    * 현장설비 메인맵 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/fecMainMapLv2View.do")
    public String fecMainMapLv2View(     @ModelAttribute("fecMainVO") fecMainVO fecMainVO,
    						@RequestParam(value="uerId", required=false) String uerId,
    						@RequestParam(value="dptCd", required=false) String dptCd,
    						@RequestParam(value="instClsfcCd", required=false) String instClsfcCd,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        
        // uerId으로 본사, 본부, 지사 등급 가져오기
       if (instClsfcCd != null && instClsfcCd.equals("null") == false){
    	  if (instClsfcCd.equals("B")){
//    		  String  HdqrText = common.getHdqrTextWithHdqrCd(dptCd);    
    		  String  HdqrText = super.getHdqrTextWithHdqrCd(dptCd);  
    		  model.addAttribute("bonbuoption", HdqrText);
    		  
    		  HashMap<String, String> MtnofText = super.getMtnofTextWithHdqrCd(dptCd);
    		  model.addAttribute("jisaoption", MtnofText.get("MtnofText"));
    		  model.addAttribute("jisacode", MtnofText.get("MtnofCd"));
    	  }else{
    		  HashMap<String, String> MtnofText = super.getMtnofTextWithMtnofCd(dptCd);
    		  model.addAttribute("jisaoption", MtnofText.get("MtnofText"));
    		  model.addAttribute("jisacode", MtnofText.get("MtnofCd"));
    		  //MtnofText.get("HdqrCd").toString()
    		  String  HdqrText = super.getHdqrTextWithMtnofCd(MtnofText.get("MtnofCd").toString());    		  
    		  model.addAttribute("bonbuoption", HdqrText);
    	  }
    	   
       }else{
    	  dptCd = "N00218";
    	  HashMap<String, String> MtnofText = super.getMtnofTextWithMtnofCd(dptCd);
 		  model.addAttribute("jisaoption", MtnofText.get("MtnofText"));
 		  model.addAttribute("jisacode", MtnofText.get("MtnofCd"));
 		  
 		  String  HdqrText = super.getHdqrTextWithMtnofCd(MtnofText.get("HdqrCd").toString());    		  
 		  model.addAttribute("bonbuoption", HdqrText);
    	   
       }
        
        returnValue = "egovframework/sdtic/fecrs/FecMainMapLv2View";
        return returnValue;
    }
    /******************* E : 현장설비 메인맵 2레벨 위젯 ************************/
    
    /******************* S : MDT 운영 LV1 위젯 ************************/

    /**
    * MDT 운영 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/fecMDTOperLv1View.do")
    public String fecMDTOperLv1View(     @ModelAttribute("fecMainVO") fecMainVO fecMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";

        returnValue = "egovframework/sdtic/fecrs/FecMDTOperLv1View";
        return returnValue;
    }
    /******************* E : MDT 운영 LV1 위젯 ************************/
    
    /******************* S : MDT 운영 Ajax 데이터 ************************/

    /**
    * MDT 운영 Ajax 데이터 
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/fecMDTOperLv1.do")    
    public @ResponseBody ModelAndView fecMDTOperLv1(  @ModelAttribute("FecSearchVO") FecSearchVO fecSearchVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {
		ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
     
        FecMDTOperVO fecMDTOperVO= fecMainService.fecMdtoperLv1Ajax(fecSearchVO);  
        List<FecMDTOperVO> fecMDTOperlist= fecMainService.fecMdttroblLv1Ajax(fecSearchVO); 
        List<FecMDTOperVO> fecMDTMaplist= fecMainService.fecMdtmapLv1Ajax(fecSearchVO); 
//        
        resultMap.put("Oper", fecMDTOperVO);
        resultMap.put("Trobl", fecMDTOperlist);
        resultMap.put("Map", fecMDTMaplist);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    
    }
    /******************* E : MDT 운영 Ajax 데이터  ************************/
    
    /******************* S : 현장설비 가동현황(LV1) 위젯 ************************/

    /**
    * 현장설비 가동현황 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/fec/fecSptEqpOprCstsLv1View.do")
    public String fecFacilitiesoperation01(  @ModelAttribute("fecMainVO") fecMainVO fecMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/fecrs/FecSptEqpOprCstsLv1View";
        return returnValue;
    }
    /******************* E : 현장설비 가동현황(LV1) 위젯 ************************/

    /******************* S : 현장설비 가동현황(LV1) Ajax 데이터 ************************/

    /**
    * 현장설비 가동현황 Ajax 데이터
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/fec/fecSptEqpOprCstsLv1.do")
    public @ResponseBody ModelAndView fecSptEqpOprCstsLv1(   @ModelAttribute("FecSearchVO") FecSearchVO fecSearchVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {
		ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();

        List<HashMap<String, String>> List = fecMainService.fecSptEqpOprCstsLv1(fecSearchVO);      
        
        resultMap.put("data", List);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    /******************* E : 현장설비 가동현황(LV1) Ajax 데이터 ************************/

    /******************* S : 전력사용량 현황(LV1) 위젯 ************************/

    /**
    * 전력사용량 현황 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/fec/fecPwrerUsgqtyLv1View.do")
    public String fecPwrerUsgqtyLv1View(  @ModelAttribute("fecMainVO") fecMainVO fecMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/fecrs/FecPwrerUsgqtyLv1View";
        return returnValue;
    }
    /******************* E : 전력사용량 현황(LV1) 위젯 ************************/

    /******************* S : 전력사용량 현황(LV1) Ajax 데이터 ************************/

    /**
    * 전력사용량 현황 Ajax 데이터
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/fec/fecPwrerUsgqtyLv1.do")
    public @ResponseBody ModelAndView fecPwrerUsgqtyLv1( @ModelAttribute("FecSearchVO") FecSearchVO fecSearchVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {
		ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        
        List<FecPwrerUsgqtyVO> fecPwrerUsgqtyVO= fecMainService.fecPwrerUsgqtyLv1Ajax(fecSearchVO);
        resultMap.put("data", fecPwrerUsgqtyVO);
        
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    /******************* E : 전력사용량 현황(LV1) Ajax 데이터 ************************/
    
    /******************* S : 권역별 장애발생/조치(LV1) 현황 위젯 ************************/

    /**
    * 권역별 장애발생/조치 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/fec/fecAreclTroblOccrrncManagtLv1View.do")
    public String fecAreclTroblOccrrncManagtLv1View(  @ModelAttribute("fecMainVO") fecMainVO fecMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/fecrs/FecAreclTroblOccrrncManagtLv1View";
        return returnValue;
    }
    /******************* E : 권역별 장애발생/조치(LV1) 현황 위젯 ************************/

    /******************* S : 권역별 장애발생/조치(LV1) 현황 Ajax 데이터 ************************/

    /**
    * 권역별 장애발생/조치 Ajax 데이터
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/fec/fecAreclTroblOccrrncManagtLv1.do")
    public @ResponseBody ModelAndView fecAreclTroblOccrrncManagtLv1(  @ModelAttribute("FecSearchVO") FecSearchVO fecSearchVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {
		ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();

        List<HashMap<String, String>> List = fecMainService.fecAreclTroblOccrrncManagtLv1(fecSearchVO);       
        
        resultMap.put("data", List);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    /******************* E : 권역별 장애발생/조치 현황(LV1) Ajax 데이터 ************************/
    /******************* S : 부문별 장애발생/조치 현황(LV2) 위젯 ************************/

    /**
    * 부문별 장애발생/조치 현황 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/fec/fecPsctnTroblOccrrncManagtLv2View.do")
    public String fecPsctnTroblOccrrncManagtLv2View(  @ModelAttribute("fecMainVO") fecMainVO fecMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/fecrs/FecPsctnTroblOccrrncManagtLv2View";
        return returnValue;
    }
    /******************* E : 부문별 장애발생/조치 현황(LV2) 위젯 ************************/

    /******************* S : 부문별 장애발생/조치 현황(LV2) Ajax 데이터 ************************/

    /**
    * 부문별 장애발생/조치 현황 Ajax 데이터
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/fec/fecPsctnTroblOccrrncManagtLv2.do")
    public @ResponseBody ModelAndView fecPsctnTroblOccrrncManagtLv2(  @ModelAttribute("FecSearchVO") FecSearchVO fecSearchVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {
		ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        
        List<HashMap<String, String>> List = fecMainService.fecPsctnTroblOccrrncManagtLv2(fecSearchVO); 
        
        resultMap.put("data", List);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    /******************* E : 부문별 장애발생/조치 현황(LV2) Ajax 데이터 ************************/
    
    /******************* S : 전기_터널 (LV2) 위젯 ************************/

    /**
    * 전기_터널 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/FecElctyTunnelLv2View.do")
    public String FecElctyTunnelLv2View(  @ModelAttribute("fecMainVO") fecMainVO fecMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/fecrs/FecElctyTunnelLv2View";
        return returnValue;
    }
    /******************* E : 전기_터널 (LV2) 위젯 ************************/

    /******************* S : 전기_터널 (LV2) Ajax 데이터 ************************/

    /**
    * 전기 시설물 Ajax 데이터
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/FecElctyTunnelLv2.do")
    public @ResponseBody ModelAndView fecElctyFcltsLv2(  @ModelAttribute("FecSearchVO") FecSearchVO fecSearchVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {
		ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        
        //맥스값 가져오기    
        String Max_seq = fecMainService.fecGetElctyTunnelLv2Seq();
        
        //맥스값을 fecSearchVO 에 추가
        fecSearchVO.setSeqMax(Max_seq);

        List<FecElctyTunnelVO> fecElctyTunnelVO= fecMainService.fecElctyTunnelLv2Ajax(fecSearchVO);
        resultMap.put("Trobl", fecElctyTunnelVO);
        
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    /******************* E : 전기_터널 (LV2) Ajax 데이터 ************************/
    
    /******************* S : 전기_영업소 (LV2) 위젯 ************************/

    /**
    * 전기_영업소 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/FecElctyTollgateLv2View.do")
    public String FecElctyTollgateLv2View(  @ModelAttribute("fecMainVO") fecMainVO fecMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/fecrs/FecElctyTollgateLv2View";
        return returnValue;
    }
    /******************* E : 전기_영업소 (LV2) 위젯 ************************/

    /******************* S : 전기_영업소 (LV2) Ajax 데이터 ************************/

    /**
    * 전기 영업소 Ajax 데이터
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/FecElctyTollgateLv2.do")
    public @ResponseBody ModelAndView FecElctyTollgateLv2(  @ModelAttribute("FecSearchVO") FecSearchVO fecSearchVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {
		ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
       
        //맥스값 가져오기    
        String Max_seq = fecMainService.fecGetElctyTollgateLv2Seq();        
       
        //맥스값을 fecSearchVO 에 추가
        fecSearchVO.setSeqMax(Max_seq);
        
        List<FecElctyTollgateVO> fecElctyTollgateVO= fecMainService.fecElctyTollgateLv2Ajax(fecSearchVO);
        resultMap.put("Trobl", fecElctyTollgateVO);
        
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    /******************* E : 전기_영업소 (LV2) Ajax 데이터 ************************/
    
    /******************* S : 전기_가로등/조명탑 (LV2) 위젯 ************************/

    /**
    * 전기_가로등/조명탑 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/FecElctyLampLv2View.do")
    public String FecElctyLampLv2View(  @ModelAttribute("fecMainVO") fecMainVO fecMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/fecrs/FecElctyLampLv2View";
        return returnValue;
    }
    /******************* E : 전기_가로등/조명탑 (LV2) 위젯 ************************/

    /******************* S : 전기_가로등/조명탑 (LV2) Ajax 데이터 ************************/

    /**
    * 전기 가로등/조명탑 Ajax 데이터
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/FecElctyLampLv2.do")
    public @ResponseBody ModelAndView FecElctyLampLv2(  @ModelAttribute("FecSearchVO") FecSearchVO fecSearchVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {
		ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        
        //맥스값 가져오기    
        String Max_seq = fecMainService.fecGetElctyLampLv2Seq();        
       
        //맥스값을 fecSearchVO 에 추가
        fecSearchVO.setSeqMax(Max_seq);
        
        List<FecElctyLampVO> fecElctyLampVO= fecMainService.fecElctyLampLv2Ajax(fecSearchVO);
        resultMap.put("Trobl", fecElctyLampVO);
        
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    /******************* E : 전기_가로등/조명탑 (LV2) Ajax 데이터 ************************/
    
    /******************* S : 오수처리(LV2) 위젯 ************************/

    /**
    * 오수처리 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/fec/fecPltwtrProcessLv2View.do")
    public String fecPltwtrProcessLv2View(  @ModelAttribute("fecMainVO") fecMainVO fecMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/fecrs/FecPltwtrProcessLv2View";
        return returnValue;
    }
    /******************* E : 오수처리(LV2) 위젯 ************************/

    /******************* S : 오수처리(LV2) Ajax 데이터 ************************/

    /**
    * 오수처리 Ajax 데이터
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/fec/fecPltwtrProcessLv2.do")
    public @ResponseBody ModelAndView fecPltwtrProcessLv2(  @ModelAttribute("FecSearchVO") FecSearchVO fecSearchVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {
		ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();

        //맥스값 가져오기    
        String Max_seq = fecMainService.fecGetPltwtrProcessLv2Seq();        
       
        //맥스값을 fecSearchVO 에 추가
        fecSearchVO.setSeqMax(Max_seq);     
        
        List<FecPltwtrProcessVO> fecPltwtrProcessVO= fecMainService.fecPltwtrProcessLv2Ajax(fecSearchVO);
        resultMap.put("Trobl", fecPltwtrProcessVO);
        
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    /******************* E : 오수처리(LV2) Ajax 데이터 ************************/
    /******************* S : 터널상세(LV2) 위젯 ************************/

    /**
    * 터널상세 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/fec/fecTunnelDetailLv2View.do")
    public String fecTunnelDetailLv2View(  @ModelAttribute("fecMainVO") fecMainVO fecMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/fecrs/FecTunnelDetailLv2View";
        return returnValue;
    }
    /******************* E : 터널상세(LV2) 위젯 ************************/

    /******************* S : 터널상세(LV2) Ajax 데이터 ************************/

    /**
    * 터널상세 Ajax 데이터
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/fec/fecTunnelDetailLv2.do")
    public @ResponseBody ModelAndView fecTunnelDetailLv2(  @ModelAttribute("FecSearchVO") FecSearchVO fecSearchVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {
		ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();

        //맥스값 가져오기    
        String Max_seq = fecMainService.fecGetTunnelDetailLv2Seq();        
       
        //맥스값을 fecSearchVO 에 추가
        fecSearchVO.setSeqMax(Max_seq);     
        
        List<FecTunnelDetailVO> fecTunnelDetailVO= fecMainService.fecTunnelDetailLv2Ajax(fecSearchVO);
        resultMap.put("Trobl", fecTunnelDetailVO);
        
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    /******************* E : 터널상세(LV2) Ajax 데이터 ************************/

    /******************* S : 사면상세(LV2) 위젯 ************************/

    /**
    * 터널상세 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/fec/fecSlopeDetailLv2View.do")
    public String fecSlopeLv2View(  @ModelAttribute("fecMainVO") fecMainVO fecMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/fecrs/FecSlopeLv2View";
        return returnValue;
    }
    /******************* E : 사면상세(LV2) 위젯 ************************/

    /******************* S : 사면상세(LV2) Ajax 데이터 ************************/

    /**
    * 터널상세 Ajax 데이터
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/FecSlopeLv2.do")
    public @ResponseBody ModelAndView fecSlopeLv2(  @ModelAttribute("FecSearchVO") FecSearchVO fecSearchVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {
		ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();

        //맥스값 가져오기    
        String Max_seq = fecMainService.fecGetSlopeLv2Seq();        
       
        //맥스값을 fecSearchVO 에 추가
        fecSearchVO.setSeqMax(Max_seq);
        
        List<FecSlopeVO> fecSlopeVO= fecMainService.fecSlopeLv2Ajax(fecSearchVO);
        resultMap.put("Trobl", fecSlopeVO);
        
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    /******************* E : 사면상세(LV2) Ajax 데이터 ************************/
    /******************* S : 염수상세(LV2) 위젯 ************************/

    /**
    * 터널상세 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/FecBrineLv2View.do")
    public String fecBrineLv2View(  @ModelAttribute("fecMainVO") fecMainVO fecMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/fecrs/FecBrineLv2View";
        return returnValue;
    }
    /******************* E : 염수상세(LV2) 위젯 ************************/

    /******************* S : 염수상세(LV2) Ajax 데이터 ************************/

    /**
    * 터널상세 Ajax 데이터
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/FecBrineLv2.do")
    public @ResponseBody ModelAndView fecBrineLv2(  @ModelAttribute("FecSearchVO") FecSearchVO fecSearchVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {
		ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();

        List<FecBrineVO> fecBrineVO= fecMainService.fecBrineLv2Ajax(fecSearchVO);
        resultMap.put("Trobl", fecBrineVO);
        
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    /******************* E : 염수상세(LV2) Ajax 데이터 ************************/
        
    /******************* S : 이벤트 조회(LV2) 위젯 ************************/

    /**
    * 이벤트 조회 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/FecEventListLv2View.do")
    public String FecEventListLv2View(  @ModelAttribute("fecMainVO") fecMainVO fecMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/fecrs/FecEventListLv2View";
        return returnValue;
    }
    /******************* E : 이벤트 조회(LV2) 위젯 ************************/

    /******************* S : 이벤트 조회(LV2) Ajax 데이터 ************************/

    /**
    * 이벤트 조회 Ajax 데이터
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/FecEventListLv2.do")
    public @ResponseBody ModelAndView FecEventListLv2(  @ModelAttribute("FecSearchVO") FecSearchVO fecSearchVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {
		ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();

        List<fecEventVO> List= fecMainService.FecEventListLv2(fecSearchVO);
        
        resultMap.put("data", List);

        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    /******************* E : 이벤트 조회(LV2) Ajax 데이터 ************************/
    /******************* S : 본부 지사 위치 좌표 Ajax 데이터 ************************/

    /**
    * 본부 지사 위치 좌표 Ajax 데이터
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/fecGetDeptAjax.do")
    public @ResponseBody ModelAndView fecGetDeptAjax(  @ModelAttribute("FecSearchVO") FecSearchVO fecSearchVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {
		ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        
        List<FecSearchVO> fecSearchList= fecMainService.fecGetDeptAjax(fecSearchVO);
        
        resultMap.put("dept", fecSearchList);
        
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    /******************* E : 본부 지사 위치 좌표 Ajax 데이터 ************************/
    
    /******************* S : 터널 이벤트 조회 Ajax ************************/

    /**
    * 터널 이벤트 조회 Ajax 
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/fecGetEventTunnelAjax.do")
    public @ResponseBody ModelAndView fecGetEventTunnelAjax(  @ModelAttribute("FecSearchVO") FecSearchVO fecSearchVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {
		ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();     
        
        List<fecEventVO> fecEventVOList= fecMainService.fecGetEventTunnelAjax(fecSearchVO);
        
        resultMap.put("features", fecEventVOList);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    /******************* E : 터널 이벤트 Ajax  ************************/
    
    /******************* S : 전기 이벤트 조회 Ajax ************************/

    /**
    * 전기 이벤트 조회 Ajax 
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/fecGetEventElctsAjax.do")
    public @ResponseBody ModelAndView fecGetEventElctsAjax(  @ModelAttribute("FecSearchVO") FecSearchVO fecSearchVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {
		ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
    
        
        List<fecEventVO> fecEventVOList = fecMainService.fecGetEventElctsAjax(fecSearchVO);
        
        resultMap.put("features", fecEventVOList);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    /******************* E : 전기 이벤트 Ajax  ************************/
    
    /******************* S : 오수 이벤트 조회 Ajax ************************/

    /**
    * 오수 이벤트 조회 Ajax 
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/fecGetEventSvarAjax.do")
    public @ResponseBody ModelAndView fecGetEventSvarAjax(  @ModelAttribute("FecSearchVO") FecSearchVO fecSearchVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {
		ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();

        List<fecEventVO> fecEventVOList = fecMainService.fecGetEventSvarAjax(fecSearchVO);
        
        resultMap.put("features", fecEventVOList);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    /******************* E : 오수 이벤트 Ajax  ************************/
    
    /******************* S : 사면 이벤트 조회 Ajax ************************/

    /**
    * 사면 이벤트 조회 Ajax 
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/fecGetEventSlopeAjax.do")
    public @ResponseBody ModelAndView fecGetEventSlopeAjax(  @ModelAttribute("FecSearchVO") FecSearchVO fecSearchVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {
		ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();       
        
        List<fecEventVO> fecEventVOList = fecMainService.fecGetEventSlopeAjax(fecSearchVO);
        
        resultMap.put("features", fecEventVOList);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    /******************* E : 사면 이벤트 Ajax  ************************/
    
    /******************* S : CCTV 이벤트 조회 Ajax ************************/

    /**
    * CCTV 이벤트 조회 Ajax 
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/fecGetEventCctvAjax.do")
    public @ResponseBody ModelAndView fecGetEventCctvAjax(  @ModelAttribute("FecSearchVO") FecSearchVO fecSearchVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {
		ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();       
        
        List<fecEventVO> fecEventVOList = fecMainService.fecGetEventCctvAjax(fecSearchVO);
        
        resultMap.put("features", fecEventVOList);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    /******************* E : CCTV 이벤트 Ajax  ************************/
    
    /******************* S : MDT 이벤트 조회 Ajax ************************/
    /**
     * MDT 이벤트 조회 Ajax 
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
     @SuppressWarnings({ "rawtypes", "unchecked" })
     @RequestMapping(value = "/fecGetEventMdtAjax.do")
     public @ResponseBody ModelAndView fecGetEventMdtAjax(  @ModelAttribute("FecSearchVO") FecSearchVO fecSearchVO,
                             HttpServletRequest request,
                             HttpServletResponse response,
                             HttpSession session,
                             ModelMap model
                         ) throws Exception
     {
 		ModelAndView modelAndView = new ModelAndView();
         Map          resultMap    = new HashMap();       
         
         List<fecEventVO> fecEventVOList = fecMainService.fecGetEventMdtAjax(fecSearchVO);
         
         resultMap.put("features", fecEventVOList);
         modelAndView.addAllObjects(resultMap);
         modelAndView.setViewName("jsonView");
         return modelAndView;
     }
     /******************* E : MDT 이벤트 Ajax  ************************/
    
    /******************* S : 지도 본부 선택 지사 코드 가져오기 Ajax ************************/

    /**
    * 지도 본부 선택 지사 코드 가져오기 Ajax 
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/fecJisaCodeAjax.do")
    public @ResponseBody ModelAndView fecJisaCodeAjax(  @ModelAttribute("FecSearchVO") FecSearchVO fecSearchVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {
		ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();       
        
        List<HashMap<String, String>> mapList = fecMainService.fecJisaCodeAjax(fecSearchVO);
    
        resultMap.put("Jisacode", mapList);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    /******************* E : 지도 본부 선택 지사 코드 가져오기 Ajax  ************************/
   
}