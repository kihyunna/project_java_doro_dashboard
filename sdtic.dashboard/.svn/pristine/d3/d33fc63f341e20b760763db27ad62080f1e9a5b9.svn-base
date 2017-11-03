package egovframework.com.sdtic.ifcrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionException;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.sdtic.ifcrs.service.IfcDbVO;

 /**
 * @Class Name :  IfcDbDAO.java
 * @Description : IfcDbDAO Class
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
@Repository("ifcDbDAO")
public class IfcDbDAO extends EgovComAbstractDAO {

    // 인프라 DB 통합
    @SuppressWarnings("unchecked")
    public List<IfcDbVO> ifcDbUnityAjax(IfcDbVO ifcDbVO) throws Exception {
        return (List<IfcDbVO>) list("ifcDbDAO.ifcDbUnityAjax" , ifcDbVO);
    }

    // 인프라 DB 관제
    @SuppressWarnings("unchecked")
    public List<IfcDbVO> ifcDbCntrlAjax(IfcDbVO ifcDbVO) throws Exception {
        return (List<IfcDbVO>) list("ifcDbDAO.ifcDbCntrlAjax" , ifcDbVO);
    }
    
    // 인프라 DB DPM1
    @SuppressWarnings("unchecked")
    public List<IfcDbVO> ifcDbDpm1Ajax(IfcDbVO ifcDbVO) throws Exception {
        return (List<IfcDbVO>) list("ifcDbDAO.ifcDbDpm1Ajax" , ifcDbVO);
    }
    
    // 인프라 DB DPM2
    @SuppressWarnings("unchecked")
    public List<IfcDbVO> ifcDbDpm2Ajax(IfcDbVO ifcDbVO) throws Exception {
        return (List<IfcDbVO>) list("ifcDbDAO.ifcDbDpm2Ajax" , ifcDbVO);
    }
    
    // 빅데이터분석#1
    @SuppressWarnings("unchecked")
    public List<IfcDbVO> mainBigData1Ajax(IfcDbVO ifcDbVO) throws Exception {
        return (List<IfcDbVO>) list("ifcDbDAO.mainBigData1Ajax" , ifcDbVO);
    }
    
    // 빅데이터분석#2
    @SuppressWarnings("unchecked")
    public List<IfcDbVO> mainBigData2Ajax(IfcDbVO ifcDbVO) throws Exception {
        return (List<IfcDbVO>) list("ifcDbDAO.mainBigData2Ajax" , ifcDbVO);
    }
    
    // 데이터베이스
    @SuppressWarnings("unchecked")
    public List<IfcDbVO> mainDatabaseAjax(IfcDbVO ifcDbVO) throws Exception {
        return (List<IfcDbVO>) list("ifcDbDAO.mainDatabaseAjax" , ifcDbVO);
    }
}


