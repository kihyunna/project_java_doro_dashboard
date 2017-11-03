package egovframework.com.sdtic.bucrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionException;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.service.impl.EgovTofacComAbstractDAO;
import egovframework.com.sdtic.bucrs.service.BucMntmngVO;

 /**
 * @Class Name :  BucMntmngDAO.java
 * @Description : BucMntmngDAO Class
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
@Repository("bucMntmngDAO")
public class BucMntmngDAO extends EgovTofacComAbstractDAO {

    // 비즈니스 유지관리 누적접속자 화면
    @SuppressWarnings("unchecked")
    public List<BucMntmngVO> bucMntmngAccmltConectrAjax(BucMntmngVO bucMntmngVO) throws Exception {
        return (List<BucMntmngVO>) list("bucMntmngDAO.bucMntmngAccmltConectrAjax" , bucMntmngVO);
    }
    
    // 비즈니스 유지관리 시설물가동률 화면
    @SuppressWarnings("unchecked")
    public List<BucMntmngVO> bucMntmngRtAjax(BucMntmngVO bucMntmngVO) throws Exception {
        return (List<BucMntmngVO>) list("bucMntmngDAO.bucMntmngRtAjax" , bucMntmngVO);
    }
    
    // 비즈니스 유지관리 차량관제현황 화면(막대그래프)
    @SuppressWarnings("unchecked")
    public List<BucMntmngVO> bucMntmngVehicleCtldbAjax(BucMntmngVO bucMntmngVO) throws Exception {
        return (List<BucMntmngVO>) list("bucMntmngDAO.bucMntmngVehicleCtldbAjax" , bucMntmngVO);
    }
    
    // 비즈니스 유지관리 유지관리 현황화면
    @SuppressWarnings("unchecked")
    public List<BucMntmngVO> bucMntmngAjax(BucMntmngVO bucMntmngVO) throws Exception {
        return (List<BucMntmngVO>) list("bucMntmngDAO.bucMntmngAjax" , bucMntmngVO);
    }  
    
    // 비즈니스 유지관리 유지관리 주단위 현황화면
    @SuppressWarnings("unchecked")
    public List<BucMntmngVO> bucMntmngWeekAjax(BucMntmngVO bucMntmngVO) throws Exception {
        return (List<BucMntmngVO>) list("bucMntmngDAO.bucMntmngAjax" , bucMntmngVO);
    }  
    
    // 비즈니스 유지관리 유지관리 일단위 현황화면
    @SuppressWarnings("unchecked")
    public List<BucMntmngVO> bucMntmngDayAjax(BucMntmngVO bucMntmngVO) throws Exception {
        return (List<BucMntmngVO>) list("bucMntmngDAO.bucMntmngAjax" , bucMntmngVO);
    }
    
    // 비즈니스 유지관리 시스템 고장수리율  화면
    @SuppressWarnings("unchecked")
    public List<BucMntmngVO> bucMntmngProfitToPlanAjax(BucMntmngVO bucMntmngVO) throws Exception {
        return (List<BucMntmngVO>) list("bucMntmngDAO.bucMntmngProfitToPlanAjax" , bucMntmngVO);
    }
    
    // 비즈니스 유지관리 시스템 고장수리율 본부최대갯수 화면
    @SuppressWarnings("unchecked")
    public List<BucMntmngVO> bucMntmngProfitToPlanMaxAjax(BucMntmngVO bucMntmngVO) throws Exception {
        return (List<BucMntmngVO>) list("bucMntmngDAO.bucMntmngProfitToPlanMaxAjax" , bucMntmngVO);
    }
    
    // 비즈니스 유지관리 누적접속자 DB연동 화면
    @SuppressWarnings("unchecked")
    public List<BucMntmngVO> bucMntmngAccmltConectrdbAjax(BucMntmngVO bucMntmngVO) throws Exception {
        return (List<BucMntmngVO>) list("bucMntmngDAO.bucMntmngAccmltConectrdbAjax" , bucMntmngVO);
    }
    
    // 비즈니스 유지관리 시설물가동률 DB연동 화면
    @SuppressWarnings("unchecked")
    public List<BucMntmngVO> bucMntmngRtdbAjax(BucMntmngVO bucMntmngVO) throws Exception {
        return (List<BucMntmngVO>) list("bucMntmngDAO.bucMntmngRtdbAjax" , bucMntmngVO);
    }
    
    // 비즈니스 유지관리 유지관리 전일대비 DB연동 화면
    @SuppressWarnings("unchecked")
    public List<BucMntmngVO> bucMntmngdaydbAjax(BucMntmngVO bucMntmngVO) throws Exception {
        return (List<BucMntmngVO>) list("bucMntmngDAO.bucMntmngdaydbAjax" , bucMntmngVO);
    }  
    
    // 비즈니스 유지관리 시설물고장수리율 DB연동연동 점검완료율 화면(본부)
    @SuppressWarnings("unchecked")
    public List<BucMntmngVO> bucMntmngProfitToPlanbonbuAjax(BucMntmngVO bucMntmngVO) throws Exception {
        return (List<BucMntmngVO>) list("bucMntmngDAO.bucMntmngProfitToPlanbonbuAjax" , bucMntmngVO);
    }
    // 비즈니스 유지관리 차량관제현황 화면
    @SuppressWarnings("unchecked")
    public List<BucMntmngVO> bucMntmngMdtRundbAjax(BucMntmngVO bucMntmngVO) throws Exception {
        return (List<BucMntmngVO>) list("bucMntmngDAO.bucMntmngMdtRundbAjax" , bucMntmngVO);
    }
    
    
}


