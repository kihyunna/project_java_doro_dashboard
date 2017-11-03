package egovframework.com.sdtic.ifcrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.sdtic.ifcrs.service.IfcUnitVO;
import egovframework.com.sdtic.main.service.MainCmmnVO;

 /**
 * @Class Name :  IfcUnitDAO.java
 * @Description : IfcUnitDAO Class
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
@Repository("ifcUnitDAO")
public class IfcUnitDAO extends EgovComAbstractDAO {

    // 단위업무별 IT인프라
    @SuppressWarnings("unchecked")
    public List<IfcUnitVO> ifcUnitAjax(IfcUnitVO ifcUnitVO) throws Exception {
        return (List<IfcUnitVO>) list("ifcUnitDAO.ifcUnitAjax" , ifcUnitVO);
    }
    
    // 단위업무별 IT인프라 설정 - 주제영역
    @SuppressWarnings("unchecked")
    public List<IfcUnitVO> ifcUnitGrid1Ajax(IfcUnitVO ifcUnitVO) throws Exception {
        return (List<IfcUnitVO>) list("ifcUnitDAO.ifcUnitGrid1Ajax" , ifcUnitVO);
    }
    
    // 단위업무별 IT인프라 설정 - 업무
    @SuppressWarnings("unchecked")
    public List<IfcUnitVO> ifcUnitGrid2Ajax(IfcUnitVO ifcUnitVO) throws Exception {
        return (List<IfcUnitVO>) list("ifcUnitDAO.ifcUnitGrid2Ajax" , ifcUnitVO);
    }
    
    // 단위업무별 IT인프라 설정 - 업무 상세조회
    @SuppressWarnings("unchecked")
    public IfcUnitVO ifcUnitGrid2DetailAjax(IfcUnitVO ifcUnitVO) throws Exception {
    	return (IfcUnitVO) select("ifcUnitDAO.ifcUnitGrid2DetailAjax", ifcUnitVO);
    }
    
    // 단위업무별 IT인프라 설정 - 업무 수정 액션
    public void ifcUnitModGrid2Ajax(IfcUnitVO ifcUnitVO) throws Exception {
    	update("ifcUnitDAO.ifcUnitModGrid2Ajax", ifcUnitVO); 
    }
    
    // 단위업무별 IT인프라 설정 - 업무 삭제 액션
    public void ifcUnitDelGrid2Ajax (IfcUnitVO ifcUnitVO) throws Exception {
    	delete("ifcUnitDAO.ifcUnitDelGrid2Ajax", ifcUnitVO); 
    }
    
    // 단위업무별 IT인프라 설정 - 서버
    @SuppressWarnings("unchecked")
    public List<IfcUnitVO> ifcUnitGrid3Ajax(IfcUnitVO ifcUnitVO) throws Exception {
        return (List<IfcUnitVO>) list("ifcUnitDAO.ifcUnitGrid3Ajax" , ifcUnitVO);
    }
    
    // 단위업무별 IT인프라 설정 - 서버 입력 액션
    public void ifcUnitAddGrid3Ajax(IfcUnitVO ifcUnitVO) throws Exception {
    	insert("ifcUnitDAO.ifcUnitAddGrid3Ajax", ifcUnitVO); 
    }
    
    // 단위업무별 IT인프라 설정 - 서버 상세조회
    @SuppressWarnings("unchecked")
    public IfcUnitVO ifcUnitGrid3DetailAjax(IfcUnitVO ifcUnitVO) throws Exception {
    	return (IfcUnitVO) select("ifcUnitDAO.ifcUnitGrid3DetailAjax", ifcUnitVO);
    }
    
    // 단위업무별 IT인프라 설정 - 서버 수정 액션
    public void ifcUnitModGrid3Ajax(IfcUnitVO ifcUnitVO) throws Exception {
    	update("ifcUnitDAO.ifcUnitModGrid3Ajax", ifcUnitVO); 
    }
    
    // 단위업무별 IT인프라 설정 - 서버 삭제 액션
    public void ifcUnitDelGrid3Ajax (IfcUnitVO ifcUnitVO) throws Exception {
    	delete("ifcUnitDAO.ifcUnitDelGrid3Ajax", ifcUnitVO); 
    }
    
    // 단위업무별 IT인프라 장애 조회
    @SuppressWarnings("unchecked")
    public List<IfcUnitVO> ifcUnitTroblAjax(IfcUnitVO ifcUnitVO) throws Exception {
        return (List<IfcUnitVO>) list("ifcUnitDAO.ifcUnitTroblAjax" , ifcUnitVO);
    }
}
