package egovframework.com.sdtic.ifcrs.service;

import java.util.List;

/**
 * @Class Name :  ifcMainService.java
 * @Description : ifcMainService Class
 * @Modification Information
 * @
 * @ 수정일          수정자                       수정내용
 * @ -----------   ---------   -------------------------------
 * @ 2017. 06. 01    jkheo                       최초생성
 *
 * @author
 * @since
 * @version 1.0
 * @see
 *
 */
public interface IfcMainService {

    // 인프라 매인 AJAX
    public List<IfcMainVO> ifcMainServerAjax(IfcMainVO ifcMainVO) throws Exception;

    // 외부연계 AJAX
    public List<IfcTofacVO> ifcMainExtrlcntcTofacAjax(IfcTofacVO ifcTofacVO) throws Exception;
    
    // 외부연계 AJAX
    public List<IfcMainVO> ifcMainExtrlcntcAjax(IfcMainVO ifcMainVO) throws Exception;
    
    // 이벤트리스트 AJAX
    public List<IfcMainVO> ifcMainEventListAjax(IfcMainVO ifcMainVO) throws Exception;
    
 	// 인프라 매인 DB AJAX
    public List<IfcMainVO> ifcMainDbDpmAjax(IfcMainVO ifcMainVO) throws Exception;
    
    // 임계치 조회 AJAX
    public List<IfcMainVO> ifcMainLimitAjax(IfcMainVO ifcMainVO) throws Exception;
    
    // 이벤트 발생 AJAX
    public List<IfcMainVO> ifcMainEventLineAjax(IfcMainVO ifcMainVO) throws Exception;
    
    // 이벤트 팝업(기본) AJAX
    public List<IfcMainVO> ifcMainEventAjax(IfcMainVO ifcMainVO) throws Exception;
    
    // 이벤트 팝업(현장) AJAX
    public List<IfcMainVO> ifcMainEventSptAjax(IfcMainVO ifcMainVO) throws Exception;
    
    // 이벤트 팝업(WEB) AJAX
    public List<IfcMainVO> ifcMainEventWebAjax(IfcMainVO ifcMainVO) throws Exception;
    
    // 이벤트 팝업(DB) AJAX
    public List<IfcMainVO> ifcMainEventDbAjax(IfcMainVO ifcMainVO) throws Exception;
    
    // 이벤트 상황 AJAX
    public List<IfcMainVO> ifcMainEventLogListAjax(IfcMainVO ifcMainVO) throws Exception;
    
    // 인프라 장애보고서1 AJAX
    public List<IfcMainVO> ifcMainEventReport1Ajax(IfcMainVO ifcMainVO) throws Exception;
    
    // 인프라 장애보고서2 AJAX
    public List<IfcMainVO> ifcMainEventReport2Ajax(IfcMainVO ifcMainVO) throws Exception;
}
