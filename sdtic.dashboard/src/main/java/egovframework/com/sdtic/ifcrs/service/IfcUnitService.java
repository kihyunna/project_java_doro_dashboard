package egovframework.com.sdtic.ifcrs.service;

import java.util.List;

import egovframework.com.sdtic.main.service.MainCmmnVO;

/**
 * @Class Name :  IfcWebService.java
 * @Description : IfcWebService Class
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
public interface IfcUnitService {

    // 단위업무별 IT인프라
    public List<IfcUnitVO> ifcUnitAjax(IfcUnitVO ifcUnitVO) throws Exception;
    
    // 단위업무별 IT인프라 설정 - 주제영역
    public List<IfcUnitVO> ifcUnitGrid1Ajax(IfcUnitVO ifcUnitVO) throws Exception;
    
    // 단위업무별 IT인프라 설정 - 업무
    public List<IfcUnitVO> ifcUnitGrid2Ajax(IfcUnitVO ifcUnitVO) throws Exception;
    
    // 단위업무별 IT인프라 설정 - 업무 입력 액션
    public void ifcUnitAddGrid2Ajax(IfcUnitVO ifcUnitVO) throws Exception;
    
    // 단위업무별 IT인프라 설정 - 업무 상세 조회
    public IfcUnitVO ifcUnitGrid2DetailAjax(IfcUnitVO ifcUnitVO) throws Exception;
    
    // 단위업무별 IT인프라 설정 - 업무 수정 액션
    public void ifcUnitModGrid2Ajax(IfcUnitVO ifcUnitVO) throws Exception;
    
    // 단위업무별 IT인프라 설정 - 업무 삭제 액션
    public void ifcUnitDelGrid2Ajax(IfcUnitVO ifcUnitVO) throws Exception;
    
    // 단위업무별 IT인프라 설정 - 서버
    public List<IfcUnitVO> ifcUnitGrid3Ajax(IfcUnitVO ifcUnitVO) throws Exception;
    
    // 단위업무별 IT인프라 설정 - 서버 입력 액션
    public void ifcUnitAddGrid3Ajax(IfcUnitVO ifcUnitVO) throws Exception;
    
    // 단위업무별 IT인프라 설정 - 서버 상세 조회
    public IfcUnitVO ifcUnitGrid3DetailAjax(IfcUnitVO ifcUnitVO) throws Exception;
    
    // 단위업무별 IT인프라 설정 - 서버 수정 액션
    public void ifcUnitModGrid3Ajax(IfcUnitVO ifcUnitVO) throws Exception;
    
    // 단위업무별 IT인프라 설정 - 서버 삭제 액션
    public void ifcUnitDelGrid3Ajax(IfcUnitVO ifcUnitVO) throws Exception;
    
    // 단위업무별 IT인프라
    public List<IfcUnitVO> ifcUnitTroblAjax(IfcUnitVO ifcUnitVO) throws Exception; 
}
