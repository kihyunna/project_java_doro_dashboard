package egovframework.com.sdtic.ifcrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.sdtic.ifcrs.service.IfcTroblVO;
import egovframework.com.sdtic.ifcrs.service.IfcUnitVO;

 /**
 * @Class Name :  ifcTroblDAO.java
 * @Description : ifcTroblDAO Class
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
@Repository("ifcTroblDAO")
public class IfcTroblDAO extends EgovComAbstractDAO {

    //장애 수집 테이블 insert
	public String ifcAddTroblAjax(IfcTroblVO ifcTroblVO) throws Exception {
    	return (String)insert("ifcTroblDAO.ifcAddTroblAjax", ifcTroblVO); 
    }
	
	//장애 수집 테이블 update
	public String ifcModTroblAjax(IfcTroblVO ifcTroblVO) throws Exception {
    	return (String)insert("ifcTroblDAO.ifcModTroblAjax", ifcTroblVO); 
    }
	
	//장애 수집 로그 테이블 insert
    public void ifcAddTroblLogAjax(IfcTroblVO ifcTroblVO) throws Exception {
    	insert("ifcTroblDAO.ifcAddTroblLogAjax", ifcTroblVO); 
    }
	
	//DISK 장애 수집
    @SuppressWarnings("unchecked")
    public List<IfcTroblVO> ifcTroblDiskAjax(IfcTroblVO ifcTroblVO) throws Exception {
        return (List<IfcTroblVO>) list("ifcTroblDAO.ifcTroblDiskAjax", ifcTroblVO);
    }
    
	//NETIO 장애 수집
    @SuppressWarnings("unchecked")
    public List<IfcTroblVO> ifcTroblNetioAjax(IfcTroblVO ifcTroblVO) throws Exception {
        return (List<IfcTroblVO>) list("ifcTroblDAO.ifcTroblNetioAjax", ifcTroblVO);
    }
    
	//컨테이너 로그 장애 수집
    @SuppressWarnings("unchecked")
    public List<IfcTroblVO> ifcTroblConlogAjax(IfcTroblVO ifcTroblVO) throws Exception {
        return (List<IfcTroblVO>) list("ifcTroblDAO.ifcTroblConlogAjax", ifcTroblVO);
    }
    
    //에러서버구분 가져오기
    @SuppressWarnings("unchecked")
    public List<IfcTroblVO> ifcTroblServerGubunAjax(IfcTroblVO ifcTroblVO) throws Exception {
        return (List<IfcTroblVO>) list("ifcTroblDAO.ifcTroblServerGubunAjax", ifcTroblVO);
    }
    
    //중복확인
    @SuppressWarnings("unchecked")
    public List<IfcTroblVO> ifcTroblChkDataAjax(IfcTroblVO ifcTroblVO) throws Exception {
        return (List<IfcTroblVO>) list("ifcTroblDAO.ifcTroblChkDataAjax", ifcTroblVO);
    }
}


