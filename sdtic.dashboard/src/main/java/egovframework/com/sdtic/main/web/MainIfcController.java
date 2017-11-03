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

import egovframework.com.sdtic.ifcrs.service.IfcDbService;
import egovframework.com.sdtic.ifcrs.service.IfcDbVO;
import egovframework.com.sdtic.ifcrs.service.IfcMainService;
import egovframework.com.sdtic.ifcrs.service.IfcMainVO;
import egovframework.com.sdtic.ifcrs.service.IfcRlayService;
import egovframework.com.sdtic.ifcrs.service.IfcSptService;
import egovframework.com.sdtic.ifcrs.service.IfcSptVO;
import egovframework.com.sdtic.ifcrs.service.IfcWebService;
import egovframework.com.sdtic.ifcrs.service.IfcWebVO;

//import flexjson.JSONSerializer;

/**
 * @Class Name : MainIfcController.java
 * @Description : MainIfcController Class
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
public class MainIfcController {
	
	/** ifcSptService */
    @Resource(name = "ifcSptService")
    private IfcSptService ifcSptService;
    
    /** ifcDbService */
    @Resource(name = "ifcDbService")
    private IfcDbService ifcDbService;
    
    /** ifcRlayService */
    @Resource(name = "ifcRlayService")
    private IfcRlayService ifcRlayService;
    
    /** ifcWebService */
    @Resource(name = "ifcWebService")
    private IfcWebService ifcWebService;
    
    /** ifcMainService */
    @Resource(name = "ifcMainService")
    private IfcMainService ifcMainService;
    
    /**
    * 현장중계기 위젯
    * @param request
    * @param response
    * @param session
    * @param model
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/main/mainSptRelayView.do")    
    public String mainSptRelayView(     
                            HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session,
                            ModelMap model
                        ) throws Exception
    {

        String returnValue = "";
        returnValue = "egovframework/sdtic/main/MainSptRelayView";
        return returnValue;
    }
    
    /**
     * 현장중계기
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
    @RequestMapping(value = "/main/mainSptRelay.do")
    public @ResponseBody ModelAndView mainSptRelay(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("ifcSptVO") IfcSptVO ifcSptVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        
        //임계치 세팅
        String cpu_limit = "101";
        String mem_limit = "101";
        String disk_limit = "101";
        
        IfcMainVO ifcMainVO = new IfcMainVO();
        List<IfcMainVO> ifcMainServer = ifcMainService.ifcMainLimitAjax(ifcMainVO);
        
        if(ifcMainServer.size() > 0){
        	for(int i=0;i<ifcMainServer.size();i++){
        		ifcMainVO = ifcMainServer.get(i);
        		
        		if("CPU".equals(ifcMainVO.getDetailclse())){
        			cpu_limit = ifcMainVO.getThrhld();
        		}else if("MEM".equals(ifcMainVO.getDetailclse())){
        			mem_limit = ifcMainVO.getThrhld();
        		}else if("DISK".equals(ifcMainVO.getDetailclse())){
        			disk_limit = ifcMainVO.getThrhld();
        		}
        	}
        }
        
        ifcSptVO.setCpu_limit(cpu_limit);
        ifcSptVO.setMem_limit(mem_limit);
        ifcSptVO.setDisk_limit(disk_limit);
        
        List<IfcSptVO> ifcSptServer = ifcSptService.mainSptRelayAjax(ifcSptVO);
        resultMap.put("data", ifcSptServer);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    
    /**
     * 빅데이터분석#1 위젯
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/main/mainBigData1View.do")    
	public String mainBigData1View(     
	                         HttpServletRequest request,
	                         HttpServletResponse response,
	                         HttpSession session,
	                         ModelMap model
	                     ) throws Exception
	{
	
	    String returnValue = "";
	    returnValue = "egovframework/sdtic/main/MainBigData1View";
	    return returnValue;
	}
    
    /**
     * 빅데이터분석#1
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
    @RequestMapping(value = "/main/mainBigData1.do")
    public @ResponseBody ModelAndView mainBigData1(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("ifcDbVO") IfcDbVO ifcDbVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<IfcDbVO> ifcDbUnity = ifcDbService.mainBigData1Ajax(ifcDbVO);
        resultMap.put("data", ifcDbUnity);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
     
	/**
	* 빅데이터분석#2 위젯
	* @param request
	* @param response
	* @param session
	* @param model
	* @return
	* @throws Exception
	*/
	@RequestMapping(value = "/main/mainBigData2View.do")    
	public String mainBigData2View(     
	                          HttpServletRequest request,
	                          HttpServletResponse response,
	                          HttpSession session,
	                          ModelMap model
	                      ) throws Exception
	{
		String returnValue = "";
	    returnValue = "egovframework/sdtic/main/MainBigData2View";
	    return returnValue;
	}
	 
	/**
	 * 빅데이터분석#2
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
	@RequestMapping(value = "/main/mainBigData2.do")
	public @ResponseBody ModelAndView mainBigData2(
	                                                HttpServletRequest request,
	                                                HttpServletResponse response,
	                                                HttpSession session,
	                                                ModelMap model,
	                                                @ModelAttribute("ifcDbVO") IfcDbVO ifcDbVO
	                                              ) throws Exception
	{
	    ModelAndView modelAndView = new ModelAndView();
	    Map          resultMap    = new HashMap();
	    List<IfcDbVO> ifcDbUnity = ifcDbService.mainBigData2Ajax(ifcDbVO);
	    resultMap.put("data", ifcDbUnity);
	    modelAndView.addAllObjects(resultMap);
	    modelAndView.setViewName("jsonView");
	    return modelAndView;
	}
	
	/**
     * 클라우드 위젯
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/main/mainCloudServerView.do")    
    public String mainCloudServerView(     
                              HttpServletRequest request,
                              HttpServletResponse response,
                              HttpSession session,
                              ModelMap model
                          ) throws Exception
    {
   	 String returnValue = "";
        returnValue = "egovframework/sdtic/main/MainCloudServerView";
        return returnValue;
    }
      
     /**
      * 클라우드(WEB/WAS) 위젯
      * @param request
      * @param response
      * @param session
      * @param model
      * @return
      * @throws Exception
      */
     @RequestMapping(value = "/main/mainCloudWebWasView.do")    
     public String cloudWebWasView(     
                               HttpServletRequest request,
                               HttpServletResponse response,
                               HttpSession session,
                               ModelMap model
                           ) throws Exception
     {
    	 String returnValue = "";
         returnValue = "egovframework/sdtic/main/MainCloudWebWasView";
         return returnValue;
     }
     
     /**
      * 클라우드(WEB/WAS)
      *
      * @param request
      * @param response
      * @param session
      * @param model
      * @return
      * @throws Exception
      */
     @SuppressWarnings({ "rawtypes", "unchecked" })
     @RequestMapping(value = "/main/mainCloudWebWas.do")
     public @ResponseBody ModelAndView mainCloudWebWas(
                                                     HttpServletRequest request,
                                                     HttpServletResponse response,
                                                     HttpSession session,
                                                     ModelMap model,
                                                     @ModelAttribute("ifcWebVO") IfcWebVO ifcWebVO
                                                   ) throws Exception
     {
         ModelAndView modelAndView = new ModelAndView();
         Map          resultMap    = new HashMap();
         List<IfcWebVO> ifcWebPrfomnc = ifcWebService.mainCloudWebWasAjax(ifcWebVO);
         resultMap.put("data", ifcWebPrfomnc);
         modelAndView.addAllObjects(resultMap);
         modelAndView.setViewName("jsonView");
         return modelAndView;
     }
       
     /**
     * 데이터베이스 위젯
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
     @RequestMapping(value = "/main/mainDatabaseView.do")    
     public String mainDatabaseView(     
                                HttpServletRequest request,
                                HttpServletResponse response,
                                HttpSession session,
                                ModelMap model
                            ) throws Exception
     {
    	 String returnValue = "";
         returnValue = "egovframework/sdtic/main/MainDatabaseView";
         return returnValue;
     }
     
     /**
 	 * 데이터베이스
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
 	@RequestMapping(value = "/main/mainDatabase.do")
 	public @ResponseBody ModelAndView mainDatabase(
 	                                                HttpServletRequest request,
 	                                                HttpServletResponse response,
 	                                                HttpSession session,
 	                                                ModelMap model,
 	                                                @ModelAttribute("ifcDbVO") IfcDbVO ifcDbVO
 	                                              ) throws Exception
 	{
 	    ModelAndView modelAndView = new ModelAndView();
 	    Map          resultMap    = new HashMap();
 	    List<IfcDbVO> ifcDbUnity = ifcDbService.mainDatabaseAjax(ifcDbVO);
 	    resultMap.put("data", ifcDbUnity);
 	    modelAndView.addAllObjects(resultMap);
 	    modelAndView.setViewName("jsonView");
 	    return modelAndView;
 	}
}




