package egovframework.com.sdtic.main.web;

import java.util.ArrayList;
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

import egovframework.com.sdtic.common.XMLUtil;
import egovframework.com.sdtic.fecrs.service.FecSearchVO;
import egovframework.com.sdtic.fecrs.service.FecSptMapVO;
import egovframework.com.sdtic.fecrs.service.fecMainService;
import egovframework.com.sdtic.fecrs.service.fecMainVO;
import egovframework.com.sdtic.fecrs.service.mainSptIOTVO;
import egovframework.com.sdtic.fecrs.web.fecCommon;
import egovframework.com.sdtic.ifcrs.service.IfcMainVO;
import egovframework.com.sdtic.main.service.MainFecService;

//import flexjson.JSONSerializer;

/**
 * @Class Name : MainFecController.java
 * @Description : MainFecController Class
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
public class MainFecController extends fecCommon{
	
	/** fecMainService      */  @Resource(name = "fecMainService")      private     fecMainService          fecMainService;
	/** fecMainService      */  @Resource(name = "MainFecService")      private     MainFecService          mainFecService;
    
	/******************* S : 메인 대시보드 현장 센서 위젯 ************************/

    /**
    * 메인 대시보드 현장 센서
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/mainSptSensorView.do")
    public String mainSptSensorView(  @ModelAttribute("fecMainVO") fecMainVO fecMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/main/mainSptSensorView";
        return returnValue;
    }
    /******************* E : 메인 대시보드 현장 센서 위젯 ************************/
    
    /******************* S : 메인 대시보드 현장 센서 데이터 ************************/

    /**
    * 메인 대시보드 현장 센서 데이터
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/mainSptSensor.do")
    public @ResponseBody ModelAndView mainSptSensor(  @ModelAttribute("FecSearchVO") FecSearchVO fecSearchVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {
		ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();

        //MDT
        List<HashMap<String, String>> mdtList = fecMainService.mainSptSensorMdt();
        //터널, 전기, 사면, 오수, cctv
        List<HashMap<String, String>> List = fecMainService.mainSptSensor();
       
        resultMap.put("mdt", mdtList);
        resultMap.put("data", List);
        
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    /******************* E : 메인 대시보드 현장 센서 데이터 ************************/
    
    
    /******************* S : 메인 대시보드 IOT 위젯 ************************/

    /**
    * 메인 대시보드 IOT
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/mainSptIOTView.do")
    public String mainSptIOTV(  @ModelAttribute("fecMainVO") fecMainVO fecMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/main/mainSptIOTView";
        return returnValue;
    }
    /******************* E : 메인 대시보드 IOT ************************/
    /******************* S : 메인 대시보드 IOT Ajax 데이터 ************************/

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
    @RequestMapping(value = "/mainSptIOT.do")
    public @ResponseBody ModelAndView mainSptIOT(  @ModelAttribute("FecSearchVO") FecSearchVO fecSearchVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {
		ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();

        
        List<mainSptIOTVO> mainSptIOTVO = fecMainService.mainSptIOTAjax(fecSearchVO);
        
        resultMap.put("data", mainSptIOTVO);
        
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    /******************* E : 메인 대시보드 IOT Ajax 데이터 ************************/
    /******************* S : 메인 Map 위젯 ************************/

    /**
    * 메인 대시보드 IOT
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/FecSptMap.do")
    public String FecSptMap(  @ModelAttribute("fecMainVO") fecMainVO fecMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/main/FecSptMap";
        return returnValue;
    }
    /******************* E : 메인 대시보드 IOT ************************/
    /******************* S : 메인 대시보드 본부별 현황 위젯 ************************/

    /**
    * 터널상세 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/fec/fecSptMapView.do")
    public String fecSptMap(  @ModelAttribute("fecMainVO") fecMainVO fecMainVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/main/FecSptMap";
        return returnValue;
    }
    /******************* E : 메인 대시보드 본부별 현황 위젯 ************************/

    /******************* S : 메인 대시보드 본부별 현황 Ajax 데이터 ************************/

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
    @RequestMapping(value = "/fec/FecSptMap.do")
    public @ResponseBody ModelAndView FecSptMap(  @ModelAttribute("FecSearchVO") FecSearchVO fecSearchVO,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {
		ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();

        
        List<FecSptMapVO> fecSptMapVO= fecMainService.fecSptMapAjax(fecSearchVO);
        //MDT
        List<FecSptMapVO> mdtVO= fecMainService.fecSptMapMdtAjax(fecSearchVO);
        
        resultMap.put("data", fecSptMapVO);
        resultMap.put("mdt", mdtVO);
        
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    /******************* E : 메인 대시보드 본부별 현황 Ajax 데이터 ************************/
    
    /******************* S : 리포트 - 본부별 전일대비 이벤트 현황 ************************/

    /**
    * 리포트 - 본부별 전일대비 이벤트 현황
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/main/MainFecEventReportHdqrView.do")
    public String MainFecEventReportHdqrView(     @ModelAttribute("fecMainVO") fecMainVO fecMainVO,
    						@RequestParam(value="sabun", required=false) String sabun,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {
        return "egovframework/sdtic/main/MainFecEventReportHdqrView";
    }
    /******************* E : 리포트 - 본부별 전일대비 이벤트 현황 ************************/
    
    /******************* S : 리포트 - 시설별 전일대비 이벤트 현황 ************************/

    /**
    * 리포트 - 시설별 전일대비 이벤트 현황
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/main/MainFecEventReportMtnofView.do")
    public String MainFecEventReportMtnofView(     @ModelAttribute("fecMainVO") fecMainVO fecMainVO,
    						@RequestParam(value="sabun", required=false) String sabun,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        
        // sabun으로 본사, 본부, 지사 등급 가져오기 
        
        // 본사
        String bHrml = "";
        bHrml += "<option value='N01795' selected>수도권본부</option>";
        bHrml += "<option value='N01796' >강원본부</option>";
        bHrml += "<option value='N02723' >충북본부</option>";
        bHrml += "<option value='N01797' >대전충남본부</option>";
        bHrml += "<option value='N01798' >전북본부</option>";
        bHrml += "<option value='N01799' >광주전남본부</option>";
        bHrml += "<option value='N01800' >대구경북본부</option>";
        bHrml += "<option value='N01801' >부산경남본부</option>";
        
        model.addAttribute("bonbuoption", bHrml);
        
        String jHrml = "";
        jHrml += "<option value='N00218' selected>인천지사</option>";
        jHrml += "<option value='N00221' >시흥지사</option>";
        jHrml += "<option value='N00225' >군포지사</option>";
        jHrml += "<option value='N00234' >화성지사</option>";
        jHrml += "<option value='N00242' >수원지사</option>";
        jHrml += "<option value='N00255' >동서울지사</option>";
        jHrml += "<option value='N00260' >이천지사</option>";
        jHrml += "<option value='N02241' >경기광주지사</option>";
        model.addAttribute("jisaoption", jHrml);
        
        // 본부
        	
        	
        	
        	
        
        	
        	
        	
        //지사
        model.addAttribute("jisacode", "N00218");
	
        returnValue = "egovframework/sdtic/main/MainFecEventReportMtnofView";
        return returnValue;
    }
    /******************* E : 리포트 - 시설별 전일대비 이벤트 현황 ************************/
    
    /******************* S : 리포트 - 시설별 상세 이벤트 현황 ************************/

    /**
    * 리포트 - 시설별 상세 이벤트 현황
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/main/MainFecEventReportMtnofDetailView.do")
    public String MainFecEventReportMtnofDetailView(     @ModelAttribute("fecMainVO") fecMainVO fecMainVO,
    						@RequestParam(value="sabun", required=false) String sabun,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        
        // sabun으로 본사, 본부, 지사 등급 가져오기 
        
        // 본사
        String bHrml = "";
        bHrml += "<option value='N01795' selected>수도권본부</option>";
        bHrml += "<option value='N01796' >강원본부</option>";
        bHrml += "<option value='N02723' >충북본부</option>";
        bHrml += "<option value='N01797' >대전충남본부</option>";
        bHrml += "<option value='N01798' >전북본부</option>";
        bHrml += "<option value='N01799' >광주전남본부</option>";
        bHrml += "<option value='N01800' >대구경북본부</option>";
        bHrml += "<option value='N01801' >부산경남본부</option>";
        
        model.addAttribute("bonbuoption", bHrml);
        
        String jHrml = "";
        jHrml += "<option value='N00218' selected>인천지사</option>";
        jHrml += "<option value='N00221' >시흥지사</option>";
        jHrml += "<option value='N00225' >군포지사</option>";
        jHrml += "<option value='N00234' >화성지사</option>";
        jHrml += "<option value='N00242' >수원지사</option>";
        jHrml += "<option value='N00255' >동서울지사</option>";
        jHrml += "<option value='N00260' >이천지사</option>";
        jHrml += "<option value='N02241' >경기광주지사</option>";
        model.addAttribute("jisaoption", jHrml);
        
        // 본부
        	
        	
        	
        	
        
        	
        	
        	
        //지사
        model.addAttribute("jisacode", "N00218");
	
        returnValue = "egovframework/sdtic/main/MainFecEventReportMtnofDetailView";
        return returnValue;
    }
    /******************* E : 리포트 - 시설별 상세 이벤트 현황 ************************/
    
    /******************* S : 리포트 - CCTV 장애 현황 ************************/

    /**
    * 리포트 -  CCTV 장애 현황
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/main/MainFecEventReportCctvView.do")
    public String MainFecEventReportCctvView(     @ModelAttribute("fecMainVO") fecMainVO fecMainVO,
    						@RequestParam(value="sabun", required=false) String sabun,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {
        return "egovframework/sdtic/main/MainFecEventReportCctvView";
    }
    /******************* E : 리포트 -  CCTV 장애 현황 ************************/
    
    /******************* S : 리포트 - 본부별 전일대비 이벤트 현황 데이터 생성 ************************/
    /**
     * 리포트 - 본부별 전일대비 이벤트 현황 데이터 생성
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/MainFecEventReportHdqr.do")
    public @ResponseBody ModelAndView MainFecEventReportHdqr(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        ArrayList<HashMap<String,String>> mainFecEventReportHdqrList = mainFecService.MainFecEventReportHdqr();
        
        //rexpertXml 생성
        Map<String,Object> dataMap = new HashMap();
        Map<String,Object> listMap = new HashMap();
                
        listMap.put("event_hdqr", mainFecEventReportHdqrList);        

        String rexpertXml = XMLUtil.mapToXmlString(dataMap, listMap);

        resultMap.put("data", rexpertXml);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    
    /******************* S : 리포트 - 본부별 전일대비 이벤트 현황 데이터 생성 ************************/
    
    /******************* S : 리포트 - 지사별 전일대비 이벤트 현황 데이터 생성 ************************/
    /**
     * 리포트 - 지사별 전일대비 이벤트 현황 데이터 생성
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/MainFecEventReportMtnof.do")
    public @ResponseBody ModelAndView MainFecEventReportMtnof(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @RequestParam(value="DeptCode", required=false) String DeptCode
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        ArrayList<HashMap<String,String>> mainFecEventReportMtnofList = mainFecService.MainFecEventReportMtnof(DeptCode);
        
        //rexpertXml 생성
        Map<String,Object> dataMap = new HashMap();
        Map<String,Object> listMap = new HashMap();
                
        listMap.put("event_mtnof", mainFecEventReportMtnofList);        

        String rexpertXml = XMLUtil.mapToXmlString(dataMap, listMap);

        resultMap.put("data", rexpertXml);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    
    /******************* S : 리포트 - 지사별 전일대비 이벤트 현황 데이터 생성 ************************/
    
    /******************* S : 리포트 - 지사별 상세 이벤트 현황 데이터 생성 ************************/
    /**
     * 리포트 - 지사별 상세 이벤트 현황 데이터 생성
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/MainFecEventReportMtnofDetail.do")
    public @ResponseBody ModelAndView MainFecEventReportMtnofDetail(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @RequestParam(value="DeptCode", required=false) String DeptCode
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        ArrayList<HashMap<String,String>> mainFecEventReportMtnofDetailList = mainFecService.MainFecEventReportMtnofDetail(DeptCode);
        
        //rexpertXml 생성
        Map<String,Object> dataMap = new HashMap();
        Map<String,Object> listMap = new HashMap();
                
        listMap.put("event_mtnof_detail", mainFecEventReportMtnofDetailList);        

        String rexpertXml = XMLUtil.mapToXmlString(dataMap, listMap);

        resultMap.put("data", rexpertXml);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    
    /******************* S : 리포트 - 지사별 상세 이벤트 현황 데이터 생성 ************************/
    
    /******************* S : 리포트 - CCTV장애 현황 데이터 생성 ************************/
    /**
     * 리포트 - CCTV장애 현황 데이터 생성
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/MainFecEventReportCctv.do")
    public @ResponseBody ModelAndView MainFecEventReportCctv(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        ArrayList<HashMap<String,String>> mainFecEventReportCctvList = mainFecService.MainFecEventReportCctv();
        
        //rexpertXml 생성
        Map<String,Object> dataMap = new HashMap();
        Map<String,Object> listMap = new HashMap();
                
        listMap.put("event_cctv", mainFecEventReportCctvList);        

        String rexpertXml = XMLUtil.mapToXmlString(dataMap, listMap);

        resultMap.put("data", rexpertXml);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    
    /******************* S : 리포트 - CCTV장애 현황 데이터 생성 ************************/
    
    
}




