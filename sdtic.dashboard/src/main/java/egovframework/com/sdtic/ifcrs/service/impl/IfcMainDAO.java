package egovframework.com.sdtic.ifcrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionException;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.sdtic.ifcrs.service.IfcMainVO;

 /**
 * @Class Name :  ifcMainDAO.java
 * @Description : ifcMainDAO Class
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
@Repository("ifcMainDAO")
public class IfcMainDAO extends EgovComAbstractDAO {

    //인프라 매인 서버
    @SuppressWarnings("unchecked")
    public List<IfcMainVO> ifcMainServerAjax(IfcMainVO ifcMainVO) throws Exception {
        return (List<IfcMainVO>) list("ifcMainDAO.ifcMainServerAjax" , ifcMainVO);
    }

    //인프라 외부연계
    @SuppressWarnings("unchecked")
    public List<IfcMainVO> ifcMainExtrlcntcAjax(IfcMainVO ifcMainVO) throws Exception {
        return (List<IfcMainVO>) list("ifcMainDAO.ifcMainExtrlcntcAjax" , ifcMainVO);
    }
    
    //이벤트 리스트
    @SuppressWarnings("unchecked")
    public List<IfcMainVO> ifcMainEventListAjax(IfcMainVO ifcMainVO) throws Exception {
        return (List<IfcMainVO>) list("ifcMainDAO.ifcMainEventListAjax" , ifcMainVO);
    }
    
    //이벤트 매인 DB
    @SuppressWarnings("unchecked")
    public List<IfcMainVO> ifcMainDbDpmAjax(IfcMainVO ifcMainVO) throws Exception {
        return (List<IfcMainVO>) list("ifcMainDAO.ifcMainDbDpmAjax" , ifcMainVO);
    }
    
    //임계치 조회
    @SuppressWarnings("unchecked")
    public List<IfcMainVO> ifcMainLimitAjax(IfcMainVO ifcMainVO) throws Exception {
        return (List<IfcMainVO>) list("ifcMainDAO.ifcMainLimitAjax" , ifcMainVO);
    }
    
    //이벤트 발생
    @SuppressWarnings("unchecked")
    public List<IfcMainVO> ifcMainEventLineAjax(IfcMainVO ifcMainVO) throws Exception {
        return (List<IfcMainVO>) list("ifcMainDAO.ifcMainEventLineAjax" , ifcMainVO);
    }
    
    //이벤트 팝업(기본)
    @SuppressWarnings("unchecked")
    public List<IfcMainVO> ifcMainEventAjax(IfcMainVO ifcMainVO) throws Exception {
        return (List<IfcMainVO>) list("ifcMainDAO.ifcMainEventAjax" , ifcMainVO);
    }
    
    //이벤트 팝업(현장)
    @SuppressWarnings("unchecked")
    public List<IfcMainVO> ifcMainEventSptAjax(IfcMainVO ifcMainVO) throws Exception {
        return (List<IfcMainVO>) list("ifcMainDAO.ifcMainEventSptAjax" , ifcMainVO);
    }
    
    //이벤트 팝업(WEB)
    @SuppressWarnings("unchecked")
    public List<IfcMainVO> ifcMainEventWebAjax(IfcMainVO ifcMainVO) throws Exception {
        return (List<IfcMainVO>) list("ifcMainDAO.ifcMainEventWebAjax" , ifcMainVO);
    }
    
    //이벤트 팝업(DB)
    @SuppressWarnings("unchecked")
    public List<IfcMainVO> ifcMainEventDbAjax(IfcMainVO ifcMainVO) throws Exception {
        return (List<IfcMainVO>) list("ifcMainDAO.ifcMainEventDbAjax" , ifcMainVO);
    }
    
    //이벤트 상황
    @SuppressWarnings("unchecked")
    public List<IfcMainVO> ifcMainEventLogListAjax(IfcMainVO ifcMainVO) throws Exception {
        return (List<IfcMainVO>) list("ifcMainDAO.ifcMainEventLogListAjax" , ifcMainVO);
    }
    
    //인프라 장애보고서1
    @SuppressWarnings("unchecked")
    public List<IfcMainVO> ifcMainEventReport1Ajax(IfcMainVO ifcMainVO) throws Exception {
        return (List<IfcMainVO>) list("ifcMainDAO.ifcMainEventReport1Ajax" , ifcMainVO);
    }
    
    //인프라 장애보고서2
    @SuppressWarnings("unchecked")
    public List<IfcMainVO> ifcMainEventReport2Ajax(IfcMainVO ifcMainVO) throws Exception {
        return (List<IfcMainVO>) list("ifcMainDAO.ifcMainEventReport2Ajax" , ifcMainVO);
    }
}
