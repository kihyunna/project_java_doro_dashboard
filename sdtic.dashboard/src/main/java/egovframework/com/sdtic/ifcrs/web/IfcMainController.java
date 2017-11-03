package egovframework.com.sdtic.ifcrs.web;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.sdtic.common.XMLUtil;
import egovframework.com.sdtic.ifcrs.service.IfcColctVO;
import egovframework.com.sdtic.ifcrs.service.IfcMainService;
import egovframework.com.sdtic.ifcrs.service.IfcMainVO;
import egovframework.com.sdtic.ifcrs.service.IfcTofacVO;

/**
 * @Class Name : ifcMainController.java
 * @Description : ifcMainController Class
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
public class IfcMainController {

    /** ifcMainService */
    @Resource(name = "ifcMainService")
    private IfcMainService ifcMainService;
    /** EgovMessageSource */
    @Resource(name = "egovMessageSource")
    private EgovMessageSource egovMessageSource;

    /**
     * 외부 연계 위젯
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ifc/ifcMainExtrlcntcView.do")
    public String ifcMainExtrlcntcView(@ModelAttribute("ifcMainVO") IfcMainVO ifcMainVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/ifcrs/ifcMain/IfcMainExtrlcntcView";
        return returnValue;
    }
    
    /**
     * 외부 연계
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
    
    @RequestMapping(value = "/ifc/ifcMainExtrlcntc.do")
    public @ResponseBody ModelAndView ifcMainExtrlcntc(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    
                                                    ModelMap model,
                                                    //@ModelAttribute("ifcTofacVO") IfcTofacVO ifcTofacVO
                                                    @ModelAttribute("ifcMainVO") IfcMainVO ifcMainVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        IfcTofacVO ifcTofacVO = new IfcTofacVO();
        IfcMainVO ifcMainVO_tmp = new IfcMainVO();
        IfcTofacVO ifcTofacVO_tmp = new IfcTofacVO();
        List<IfcTofacVO> ifcMainExtrlcntcTofac = ifcMainService.ifcMainExtrlcntcTofacAjax(ifcTofacVO);
        List<IfcMainVO> ifcMainExtrlcntc = ifcMainService.ifcMainExtrlcntcAjax(ifcMainVO);
        
        /*
        for(int i=0;i<ifcMainExtrlcntcTofac.size();i++){
        	ifcTofacVO_tmp = ifcMainExtrlcntcTofac.get(i);
        	
        	ifcMainVO_tmp = new IfcMainVO();
        	ifcMainVO_tmp.setCmmn_cd(ifcTofacVO_tmp.getCmmn_cd());
        	ifcMainVO_tmp.setCmmn_cd_nm(ifcTofacVO_tmp.getCmmn_cd_nm());
        	ifcMainVO_tmp.setCre_dttm(ifcTofacVO_tmp.getCre_dttm());
        	ifcMainVO_tmp.setIs_error(ifcTofacVO_tmp.getIs_error());
        	
        	ifcMainExtrlcntc.add(ifcMainVO_tmp);
        }
        */
        for(int i=0;i<ifcMainExtrlcntc.size();i++){
        	ifcMainVO_tmp = ifcMainExtrlcntc.get(i);
        	
        	ifcTofacVO_tmp = new IfcTofacVO();
        	ifcTofacVO_tmp.setCmmn_cd(ifcMainVO_tmp.getCmmn_cd());
        	ifcTofacVO_tmp.setCmmn_cd_nm(ifcMainVO_tmp.getCmmn_cd_nm());
        	ifcTofacVO_tmp.setCre_dttm(ifcMainVO_tmp.getCre_dttm());
        	ifcTofacVO_tmp.setIs_error(ifcMainVO_tmp.getIs_error());
        	
        	ifcMainExtrlcntcTofac.add(ifcTofacVO_tmp);
        }
        resultMap.put("data", ifcMainExtrlcntcTofac);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    
    /**
     * 인프라 매인 DB DPM 위젯
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ifc/ifcMainDbDpmView.do")
    public String ifcMainDbDpmView(@ModelAttribute("ifcMainVO") IfcMainVO ifcMainVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/ifcrs/ifcMain/IfcMainDbDpmView";
        return returnValue;
    }
    
    /**
     * 인프라 매인 DB DPM
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/ifc/ifcMainDbDpm.do")
    public @ResponseBody ModelAndView ifcMainDbDpm(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("ifcMainVO") IfcMainVO ifcMainVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<IfcMainVO> ifcMainDbDpm = ifcMainService.ifcMainDbDpmAjax(ifcMainVO);
        resultMap.put("data", ifcMainDbDpm);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    
    /**
     * 인프라 매인 서버 위젯
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ifc/ifcMainServerView.do")
    public String ifcMainServerView(@ModelAttribute("ifcMainVO") IfcMainVO ifcMainVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/ifcrs/ifcMain/IfcMainServerView";
        return returnValue;
    }
    
    /**
     * 인프라 매인 서버
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/ifc/ifcMainServer.do")
    public @ResponseBody ModelAndView ifcMainServer(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("ifcMainVO") IfcMainVO ifcMainVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<IfcMainVO> ifcMainServer = ifcMainService.ifcMainServerAjax(ifcMainVO);
        resultMap.put("data", ifcMainServer);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    
    /**
     * 인프라 매인 이벤트리스트 위젯
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ifc/ifcMainEventListView.do")
    public String ifcMainEventListView(@ModelAttribute("ifcMainVO") IfcMainVO ifcMainVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/ifcrs/ifcMain/IfcMainEventListView";
        return returnValue;
    }
    
    /**
     * 인프라 매인 이벤트리스트
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/ifc/ifcMainEventList.do")
    public @ResponseBody ModelAndView ifcMainEventList(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("ifcMainVO") IfcMainVO ifcMainVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<IfcMainVO> ifcMainEventList = ifcMainService.ifcMainEventListAjax(ifcMainVO);
        resultMap.put("data", ifcMainEventList);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    
    /**
     * 이벤트 팝업 위젯
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ifc/ifcMainEventView.do")
    public String ifcMainEventView(@ModelAttribute("ifcMainVO") IfcMainVO ifcMainVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/ifcrs/ifcMain/IfcMainEventView";
        return returnValue;
    }
    
    /**
     * 이벤트 팝업
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/ifc/ifcMainEvent.do")
    public @ResponseBody ModelAndView ifcMainEvent(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("ifcMainVO") IfcMainVO ifcMainVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        
        String dual_cnt = "";
        String dual = "";
        String gubun = "";
        String[] dual_arr = null;
        
        String rownum = ifcMainVO.getRownum();
        String time = ifcMainVO.getTime();
        
        List<IfcMainVO> ifcMainEvent1 = null;
        List<IfcMainVO> ifcMainEventSub1 = null;
        List<IfcMainVO> ifcMainEventList1 = null;
        
        List<IfcMainVO> ifcMainEvent2 = null;
        List<IfcMainVO> ifcMainEventSub2 = null;
        List<IfcMainVO> ifcMainEventList2 = null;
        
        List<IfcMainVO> ifcMainEvent3 = null;
        List<IfcMainVO> ifcMainEventSub3 = null;
        List<IfcMainVO> ifcMainEventList3 = null;
        
        IfcMainVO ifcMainVO1 = new IfcMainVO();
        IfcMainVO ifcMainVO2 = new IfcMainVO();
        IfcMainVO ifcMainVO3 = new IfcMainVO();
        
        //기본정보 가져오기
        if("SPT".equals(ifcMainVO.getColct_gubun())){	//현장서버일 경우
        	ifcMainEvent1 = ifcMainService.ifcMainEventSptAjax(ifcMainVO);
        }else{
        	ifcMainEvent1 = ifcMainService.ifcMainEventAjax(ifcMainVO);
        }
        
        //SVR,WEB,DB 구분별로 정보가져오기
        if(ifcMainEvent1.size() > 0){
        	for(int i=0;i<ifcMainEvent1.size();i++){
        		ifcMainVO1 = ifcMainEvent1.get(i);
        		
        		ifcMainVO1.setRownum(rownum);
        		ifcMainVO1.setTime(time);
        		
        		if("SVR".equals(ifcMainVO1.getGubun())){
        			
        		}else if("WEB".equals(ifcMainVO1.getGubun())){
        			ifcMainEventSub1 = ifcMainService.ifcMainEventWebAjax(ifcMainVO1);
        		}else if("DB".equals(ifcMainVO1.getGubun())){
        			ifcMainEventSub1 = ifcMainService.ifcMainEventDbAjax(ifcMainVO1);
        		}
        		
        		//이중화 서버 여부
        		dual_cnt = ifcMainVO1.getDual_cnt();
        		dual = ifcMainVO1.getDual();
        		gubun = ifcMainVO1.getGubun();
        	}
        }
        
        //이벤트 리스트 가져오기
        ifcMainEventList1 = ifcMainService.ifcMainEventListAjax(ifcMainVO1);
        
        //이중화 서버가 있을 경우 정보 가져오기
    	if("2".equals(dual_cnt)){
    		//이중화 서버 세팅
    		ifcMainVO2.setHostname(dual);
    		
    		if("SPT".equals(ifcMainVO.getColct_gubun())){	//현장서버일 경우
    			ifcMainEvent2 = ifcMainService.ifcMainEventSptAjax(ifcMainVO2);
    		}else{
    			ifcMainEvent2 = ifcMainService.ifcMainEventAjax(ifcMainVO2);
    		}
    		
    		//SVR,WEB,DB 구분별로 정보가져오기
            if(ifcMainEvent2.size() > 0){
            	for(int i=0;i<ifcMainEvent2.size();i++){
            		ifcMainVO2 = ifcMainEvent2.get(i);
            		
            		ifcMainVO2.setRownum(rownum);
            		ifcMainVO2.setTime(time);
            		
            		if("SVR".equals(ifcMainVO2.getGubun())){
            			
            		}else if("WEB".equals(ifcMainVO2.getGubun())){
            			ifcMainEventSub2 = ifcMainService.ifcMainEventWebAjax(ifcMainVO2);
            		}else if("DB".equals(ifcMainVO2.getGubun())){
            			ifcMainEventSub2 = ifcMainService.ifcMainEventDbAjax(ifcMainVO2);
            		}
            	}
            }
            
            //이벤트 리스트 가져오기
            ifcMainEventList2 = ifcMainService.ifcMainEventListAjax(ifcMainVO2);
    	}else if("3".equals(dual_cnt)){
    		dual_arr = dual.split(",");
    		
    		//이중화 서버 세팅(2)
    		ifcMainVO2.setHostname(dual_arr[0]);
    		
    		if("SPT".equals(ifcMainVO.getColct_gubun())){	//현장서버일 경우
    			ifcMainEvent2 = ifcMainService.ifcMainEventSptAjax(ifcMainVO2);
    		}else{
    			ifcMainEvent2 = ifcMainService.ifcMainEventAjax(ifcMainVO2);
    		}
    		
    		//SVR,WEB,DB 구분별로 정보가져오기
            if(ifcMainEvent2.size() > 0){
            	for(int i=0;i<ifcMainEvent2.size();i++){
            		ifcMainVO2 = ifcMainEvent2.get(i);
            		
            		ifcMainVO2.setRownum(rownum);
            		ifcMainVO2.setTime(time);
            		
            		if("SVR".equals(ifcMainVO2.getGubun())){
            			
            		}else if("WEB".equals(ifcMainVO2.getGubun())){
            			ifcMainEventSub2 = ifcMainService.ifcMainEventWebAjax(ifcMainVO2);
            		}else if("DB".equals(ifcMainVO2.getGubun())){
            			ifcMainEventSub2 = ifcMainService.ifcMainEventDbAjax(ifcMainVO2);
            		}
            	}
            }
            
            //이벤트 리스트 가져오기
            ifcMainEventList2 = ifcMainService.ifcMainEventListAjax(ifcMainVO2);
            
            /////////////////////////////////////////////////////////////////////////////
    		
            //이중화 서버 세팅(3)
    		ifcMainVO3.setHostname(dual_arr[1]);
    		
    		if("SPT".equals(ifcMainVO.getColct_gubun())){	//현장서버일 경우
    			ifcMainEvent3 = ifcMainService.ifcMainEventSptAjax(ifcMainVO3);
    		}else{
    			ifcMainEvent3 = ifcMainService.ifcMainEventAjax(ifcMainVO3);
    		}
    		
    		//SVR,WEB,DB 구분별로 정보가져오기
            if(ifcMainEvent3.size() > 0){
            	for(int i=0;i<ifcMainEvent3.size();i++){
            		ifcMainVO3 = ifcMainEvent3.get(i);
            		
            		ifcMainVO3.setRownum(rownum);
            		ifcMainVO3.setTime(time);
            		
            		if("SVR".equals(ifcMainVO3.getGubun())){
            			
            		}else if("WEB".equals(ifcMainVO3.getGubun())){
            			ifcMainEventSub3 = ifcMainService.ifcMainEventWebAjax(ifcMainVO3);
            		}else if("DB".equals(ifcMainVO3.getGubun())){
            			ifcMainEventSub3 = ifcMainService.ifcMainEventDbAjax(ifcMainVO3);
            		}
            	}
            }
            
            //이벤트 리스트 가져오기
            ifcMainEventList3 = ifcMainService.ifcMainEventListAjax(ifcMainVO3);
    	}

        resultMap.put("data1", ifcMainEvent1);
        resultMap.put("data_sub1", ifcMainEventSub1);
        resultMap.put("event_list1", ifcMainEventList1);
        
        resultMap.put("data2", ifcMainEvent2);
        resultMap.put("data_sub2", ifcMainEventSub2);
        resultMap.put("event_list2", ifcMainEventList2);
        
        resultMap.put("data3", ifcMainEvent3);
        resultMap.put("data_sub3", ifcMainEventSub3);
        resultMap.put("event_list3", ifcMainEventList3);
        
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    
    /**
     * 인프라 매인 이벤트리스트Ver2 위젯
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ifc/ifcMainEventListViewVer2.do")
    public String ifcMainEventListViewVer2(@ModelAttribute("ifcMainVO") IfcMainVO ifcMainVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/ifcrs/ifcMain/IfcMainEventListViewVer2";
        return returnValue;
    }
    
    /**
     * 인프라 매인 서버Ver2 위젯
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ifc/ifcMainServerViewVer2.do")
    public String ifcMainServerViewVer2(@ModelAttribute("ifcMainVO") IfcMainVO ifcMainVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/ifcrs/ifcMain/IfcMainServerViewVer2";
        return returnValue;
    }
    
    /**
     * 인프라 매인대시보드 DPM 위젯 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ifc/ifcMainDashDpmView.do")
    public String ifcMainDashDpmView(@ModelAttribute("ifcMainVO") IfcMainVO ifcMainVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/ifcrs/ifcMain/IfcMainDashDpmView";
        return returnValue;
    }
    
    /**
     * 인프라 매인대시보드 WEB/WAS 위젯 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ifc/ifcMainDashWebView.do")
    public String ifcMainDashWebView(@ModelAttribute("ifcMainVO") IfcMainVO ifcMainVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/ifcrs/ifcMain/IfcMainDashWebView";
        return returnValue;
    }
    
    /**
     * 인프라 매인대시보드 현장서버 위젯 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ifc/ifcMainDashSptView.do")
    public String ifcMainDashSptView(@ModelAttribute("ifcMainVO") IfcMainVO ifcMainVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/ifcrs/ifcMain/IfcMainDashSptView";
        return returnValue;
    }
    
    /**
     * 이벤트 발생
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ifc/ifcMainEventLineView.do")
    public String ifcMainEventLineView(@ModelAttribute("ifcMainVO") IfcMainVO ifcMainVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/ifcrs/ifcMain/IfcMainEventLineView";
        return returnValue;
    }
    
    /**
     * 이벤트 발생
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/ifc/ifcMainEventLine.do")
    public @ResponseBody ModelAndView ifcMainEventLine(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("ifcMainVO") IfcMainVO ifcMainVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<IfcMainVO> ifcMainEventLineList = ifcMainService.ifcMainEventLineAjax(ifcMainVO);
        resultMap.put("data", ifcMainEventLineList);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    
    /**
     * 이벤트 상황
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/ifc/ifcMainEventLogList.do")
    public @ResponseBody ModelAndView ifcMainEventLogList(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("ifcMainVO") IfcMainVO ifcMainVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<IfcMainVO> ifcMainEventLineList = ifcMainService.ifcMainEventLogListAjax(ifcMainVO);
        resultMap.put("data", ifcMainEventLineList);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
    
    /**
     * 인프라 장애보고서 화면
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ifc/ifcMainEventReportView.do")
    public String ifcMainEventReportView(@ModelAttribute("ifcMainVO") IfcMainVO ifcMainVO,
            HttpServletRequest request, HttpServletResponse response,
            HttpSession session, ModelMap model) throws Exception {

        String returnValue = "";
        returnValue = "egovframework/sdtic/main/MainIfcEventReportView";
        
        return returnValue;
    }
    
    /**
     * 인프라 장애보고서
     *
     * @param request
     * @param response
     * @param session
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value = "/ifc/ifcMainEventReport.do")
    public @ResponseBody ModelAndView ifcMainEventReport(
                                                    HttpServletRequest request,
                                                    HttpServletResponse response,
                                                    HttpSession session,
                                                    ModelMap model,
                                                    @ModelAttribute("ifcMainVO") IfcMainVO ifcMainVO
                                                  ) throws Exception
    {
        ModelAndView modelAndView = new ModelAndView();
        Map          resultMap    = new HashMap();
        List<IfcMainVO> ifcMainEventReport1List = ifcMainService.ifcMainEventReport1Ajax(ifcMainVO);
        List<IfcMainVO> ifcMainEventReport2List = ifcMainService.ifcMainEventReport2Ajax(ifcMainVO);
        
        //rexpertXml 생성
        Map<String,Object> dataMap = new HashMap();
        Map<String,Object> listMap = new HashMap();
        ArrayList<HashMap<String,String>> al1 = new ArrayList<HashMap<String,String>>();
        ArrayList<HashMap<String,String>> al2 = new ArrayList<HashMap<String,String>>();
        HashMap<String,String> hm1 = new HashMap<String,String>();
        HashMap<String,String> hm2 = new HashMap<String,String>();
        
        for(int i=0;i<ifcMainEventReport1List.size();i++){
        	ifcMainVO = ifcMainEventReport1List.get(i);
			
			hm1 = new HashMap<String,String>();
        	hm1.put("DISK_TROBL", ifcMainVO.getDisk_trobl());
        	hm1.put("DISK_ACTION", ifcMainVO.getDisk_action());
        	hm1.put("CPU_TROBL", ifcMainVO.getCpu_trobl());
        	hm1.put("CPU_ACTION", ifcMainVO.getCpu_action());
        	hm1.put("MEM_TROBL", ifcMainVO.getMem_trobl());
        	hm1.put("MEM_ACTION", ifcMainVO.getMem_action());
        	hm1.put("NETIO_TROBL", ifcMainVO.getNetio_trobl());
        	hm1.put("NETIO_ACTION", ifcMainVO.getNetio_action());
        	hm1.put("CONERR_TROBL", ifcMainVO.getConerr_trobl());
        	hm1.put("CONERR_ACTION", ifcMainVO.getConerr_action());
        	al1.add(hm1);
        }
        listMap.put("trobllist", al1);
        
        for(int i=0;i<ifcMainEventReport2List.size();i++){
        	ifcMainVO = ifcMainEventReport2List.get(i);
			
			hm2 = new HashMap<String,String>();
        	hm2.put("TROBLSEQ", ifcMainVO.getTroblseq());
        	hm2.put("JOBSE", ifcMainVO.getJobse());
        	hm2.put("TROBLCOLCTSE", ifcMainVO.getTroblcolctse());
        	hm2.put("DETAILCLSE", ifcMainVO.getDetailclse());
        	hm2.put("HOSTNAME", ifcMainVO.getHostname());
        	hm2.put("REAL_HOSTNAME", ifcMainVO.getReal_hostname());
        	hm2.put("TROBLGRADSE", ifcMainVO.getTroblgradse());
        	hm2.put("LAST_TROBLPROCESSSTTUS", ifcMainVO.getLast_troblprocesssttus());
        	hm2.put("LAST_TROBLPROCESSSTTUS_TEXT", ifcMainVO.getLast_troblprocesssttus_text());
        	hm2.put("TROBLCN", ifcMainVO.getTroblcn());
        	hm2.put("RM", ifcMainVO.getRm());
        	hm2.put("INST_DATE", ifcMainVO.getInst_date());
        	hm2.put("TROBLPROCESSSTTUS", ifcMainVO.getTroblprocesssttus());
        	hm2.put("TROBLPROCESSSTTUS_TEXT", ifcMainVO.getTroblprocesssttus_text());
        	hm2.put("ACTIONCN", ifcMainVO.getActioncn());
        	hm2.put("LOG_RM", ifcMainVO.getLog_rm());
        	hm2.put("CRE_DATE", ifcMainVO.getCre_date());
        	al2.add(hm2);
        }
        listMap.put("troblloglist", al2);

        String rexpertXml = XMLUtil.mapToXmlString(dataMap, listMap);

        resultMap.put("data", rexpertXml);
        modelAndView.addAllObjects(resultMap);
        modelAndView.setViewName("jsonView");
        return modelAndView;
    }
}
