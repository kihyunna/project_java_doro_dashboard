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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.sdtic.ifcrs.service.IfcMainService;
import egovframework.com.sdtic.ifcrs.service.IfcMainVO;
import egovframework.com.sdtic.ifcrs.service.IfcSptService;
import egovframework.com.sdtic.ifcrs.service.IfcSptVO;

/**
 * @Class Name : IfcSptController.java
 * @Description : IfcSptController Class
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
public class IfcSptController {

    /** ifcSptService */
    @Resource(name = "ifcSptService")
    private IfcSptService ifcSptService;
    /** EgovMessageSource */
    @Resource(name = "egovMessageSource")
    private EgovMessageSource egovMessageSource;

    /******************* S :인프라 현장 서버 위젯 화면 ************************/
    /**
     * 인프라 현장 서버 위젯
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ifc/ifcSptServerView.do")
    public String ifcSptServerView(@ModelAttribute("ifcSptVO") IfcSptVO ifcSptVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/ifcrs/ifcSpt/IfcSptServerView";
        return returnValue;
    }
    /******************* E : 인프라 현장 서버 위젯 화면 ************************/

    /******************* S :인프라 현장 서버 위젯 AJAX  ************************/
    /**
     * 인프라 현장 서버
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
    @RequestMapping(value = "/ifc/ifcSptServer.do")
    public @ResponseBody ModelAndView ifcSptServer(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("ifcSptVO") IfcSptVO ifcSptVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<IfcSptVO> ifcSptServer = ifcSptService.ifcSptServerAjax(ifcSptVO);
        resultMap.put("data", ifcSptServer);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }

}
