package egovframework.com.sdtic.ifcrs.web;

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
import egovframework.com.sdtic.ifcrs.service.IfcMainService;
import egovframework.com.sdtic.ifcrs.service.IfcMainVO;
import egovframework.com.sdtic.ifcrs.service.IfcUnitService;
import egovframework.com.sdtic.ifcrs.service.IfcUnitVO;

/**
 * @Class Name : IfcUnitController.java
 * @Description : IfcUnitController Class
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
public class IfcUnitController {

    /** ifcUnitService */
    @Resource(name = "ifcUnitService")
    private IfcUnitService ifcUnitService;
    /** ifcMainService */
    @Resource(name = "ifcMainService")
    private IfcMainService ifcMainService;
    /** EgovMessageSource */
    @Resource(name = "egovMessageSource")
    private EgovMessageSource egovMessageSource;

    /**
     * 단위업무별 IT인프라 위젯
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ifc/ifcUnitView.do")
    public String ifcUnitView(@ModelAttribute("ifcUnitVO") IfcUnitVO ifcUnitVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/ifcrs/ifcUnit/IfcUnitView";
        return returnValue;
    }

    /**
     * 단위업무별 IT인프라
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
    @RequestMapping(value = "/ifc/ifcUnit.do")
    public @ResponseBody ModelAndView ifcUnit(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("ifcUnitVO") IfcUnitVO ifcUnitVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        
        IfcMainVO ifcMainVO_limit = new IfcMainVO();
        List<IfcMainVO> ifcMainServer = ifcMainService.ifcMainLimitAjax(ifcMainVO_limit);
        List<IfcUnitVO> ifcUnit = ifcUnitService.ifcUnitAjax(ifcUnitVO);
        IfcMainVO ifcMainVO = new IfcMainVO();
        ifcMainVO.setRownum(ifcUnitVO.getRownum());
        ifcMainVO.setIstoday(ifcUnitVO.getIstoday());
        List<IfcMainVO> ifcMainEventList = ifcMainService.ifcMainEventListAjax(ifcMainVO);
        resultMap.put("limit", ifcMainServer);
        resultMap.put("data", ifcUnit);
        resultMap.put("eventData", ifcMainEventList);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    
    /**
     * 단위업무별 IT인프라 설정 위젯
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ifc/ifcUnitSetupView.do")
    public String ifcUnitSetupView(@ModelAttribute("ifcUnitVO") IfcUnitVO ifcUnitVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/ifcrs/ifcUnit/IfcUnitSetupView";
        return returnValue;
    }
    
    /**
     * 단위업무별 IT인프라 설정 - 주제영역
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
    @RequestMapping(value = "/ifc/ifcUnitGrid1.do")
    public @ResponseBody ModelAndView ifcUnitGrid1(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("ifcUnitVO") IfcUnitVO ifcUnitVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<IfcUnitVO> ifcUnitGrid1 = ifcUnitService.ifcUnitGrid1Ajax(ifcUnitVO);
        resultMap.put("rows", ifcUnitGrid1);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    
    /**
     * 단위업무별 IT인프라 설정 - 업무
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
    @RequestMapping(value = "/ifc/ifcUnitGrid2.do")
    public @ResponseBody ModelAndView ifcUnitGrid2(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("ifcUnitVO") IfcUnitVO ifcUnitVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<IfcUnitVO> ifcUnitGrid2 = ifcUnitService.ifcUnitGrid2Ajax(ifcUnitVO);
        resultMap.put("rows", ifcUnitGrid2);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    
    /**
     * 단위업무별 IT인프라 설정 - 업무 추가 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ifc/ifcUnitAddGrid2View.do")
    public String ifcUnitAddGrid2View(@ModelAttribute("ifcUnitVO") IfcUnitVO ifcUnitVO,
            @RequestParam HashMap<String, Object> param,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {		
		String returnValue = "";
		returnValue = "egovframework/sdtic/ifcrs/ifcUnit/IfcUnitAddGrid2View";
		return returnValue;
	}
    
    /**
     * 단위업무별 IT인프라 설정 - 업무 입력 액션
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ifc/ifcUnitAddGrid2Ajax.do")
    public void ifcUnitAddGrid2Ajax(@ModelAttribute("ifcUnitVO") IfcUnitVO ifcUnitVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

    	ifcUnitService.ifcUnitAddGrid2Ajax(ifcUnitVO);
    }
    
    /**
     * 단위업무별 IT인프라 설정 - 업무 수정 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ifc/ifcUnitModGrid2View.do")
    public String ifcUnitModGrid2View(@ModelAttribute("ifcUnitVO") IfcUnitVO ifcUnitVO,
                                         @RequestParam HashMap<String, Object> param,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

            ifcUnitVO.setUnit((String) param.get("unit"));
            ifcUnitVO.setGubun((String) param.get("gubun"));
            ifcUnitVO.setServer_gubun((String) param.get("server_gubun"));
            ifcUnitVO.setHostname((String) param.get("hostname"));
            
            IfcUnitVO data = ifcUnitService.ifcUnitGrid2DetailAjax(ifcUnitVO);
            
            model.addAttribute("data", data);

        String returnValue = "";
        returnValue = "egovframework/sdtic/ifcrs/ifcUnit/IfcUnitModGrid2View";
        return returnValue;
    }
    
    /**
     * 단위업무별 IT인프라 설정 - 업무 수정 액션
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ifc/ifcUnitModGrid2Ajax.do")
    public void ifcUnitModGrid2Ajax(@ModelAttribute("ifcUnitVO") IfcUnitVO ifcUnitVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

    	ifcUnitService.ifcUnitModGrid2Ajax(ifcUnitVO);
    }
    
    /**
     * 단위업무별 IT인프라 설정 - 업무 삭제 액션
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ifc/ifcUnitDelGrid2Ajax.do")
    public void ifcUnitDelGrid2Ajax(@ModelAttribute("ifcUnitVO") IfcUnitVO ifcUnitVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

    	ifcUnitService.ifcUnitDelGrid2Ajax(ifcUnitVO);
    }
    
    /**
     * 단위업무별 IT인프라 설정 - 서버
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
    @RequestMapping(value = "/ifc/ifcUnitGrid3.do")
    public @ResponseBody ModelAndView ifcUnitGrid3(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("ifcUnitVO") IfcUnitVO ifcUnitVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<IfcUnitVO> ifcUnitGrid3 = ifcUnitService.ifcUnitGrid3Ajax(ifcUnitVO);
        resultMap.put("rows", ifcUnitGrid3);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    
    /**
     * 단위업무별 IT인프라 설정 - 서버 추가 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ifc/ifcUnitAddGrid3View.do")
    public String ifcUnitAddGrid3View(@ModelAttribute("ifcUnitVO") IfcUnitVO ifcUnitVO,
            @RequestParam HashMap<String, Object> param,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {
		String returnValue = "";
		returnValue = "egovframework/sdtic/ifcrs/ifcUnit/IfcUnitAddGrid3View";
		return returnValue;
	}
    
    /**
     * 단위업무별 IT인프라 설정 - 서버 입력 액션
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ifc/ifcUnitAddGrid3Ajax.do")
    public void ifcUnitAddGrid3Ajax(@ModelAttribute("ifcUnitVO") IfcUnitVO ifcUnitVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

    	ifcUnitService.ifcUnitAddGrid3Ajax(ifcUnitVO);
    }
    
    /**
     * 단위업무별 IT인프라 설정 - 서버 수정 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ifc/ifcUnitModGrid3View.do")
    public String ifcUnitModGrid3View(@ModelAttribute("ifcUnitVO") IfcUnitVO ifcUnitVO,
                                         @RequestParam HashMap<String, Object> param,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

            ifcUnitVO.setUnit((String) param.get("unit"));
            ifcUnitVO.setGubun((String) param.get("gubun"));
            ifcUnitVO.setServer_gubun((String) param.get("server_gubun"));
            ifcUnitVO.setHostname((String) param.get("hostname"));
            
            IfcUnitVO data = ifcUnitService.ifcUnitGrid3DetailAjax(ifcUnitVO);
            
            model.addAttribute("data", data);

        String returnValue = "";
        returnValue = "egovframework/sdtic/ifcrs/ifcUnit/IfcUnitModGrid3View";
        return returnValue;
    }
    
    /**
     * 단위업무별 IT인프라 설정 - 서버 수정 액션
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ifc/ifcUnitModGrid3Ajax.do")
    public void ifcUnitModGrid3Ajax(@ModelAttribute("ifcUnitVO") IfcUnitVO ifcUnitVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

    	ifcUnitService.ifcUnitModGrid3Ajax(ifcUnitVO);
    }
    
    /**
     * 단위업무별 IT인프라 설정 - 서버 삭제 액션
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ifc/ifcUnitDelGrid3Ajax.do")
    public void ifcUnitDelGrid3Ajax(@ModelAttribute("ifcUnitVO") IfcUnitVO ifcUnitVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

    	ifcUnitService.ifcUnitDelGrid3Ajax(ifcUnitVO);
    }
    
    /**
     * 단위업무별 IT인프라 장애 조회
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
    @RequestMapping(value = "/ifc/ifcUnitTrobl.do")
    public @ResponseBody ModelAndView ifcUnitTrobl(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("ifcUnitVO") IfcUnitVO ifcUnitVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<IfcUnitVO> ifcUnit = ifcUnitService.ifcUnitTroblAjax(ifcUnitVO);
        resultMap.put("data", ifcUnit);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
}
