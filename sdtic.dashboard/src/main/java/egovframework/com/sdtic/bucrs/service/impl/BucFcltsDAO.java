package egovframework.com.sdtic.bucrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionException;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.service.impl.EgovTofacComAbstractDAO;
import egovframework.com.sdtic.bucrs.service.BucFcltsVO;

 /**
 * @Class Name :  BucFcltsDAO.java
 * @Description : BucFcltsDAO Class
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
@Repository("bucFcltsDAO")
public class BucFcltsDAO extends EgovTofacComAbstractDAO {

    // 비즈니스 시설물 누적접속자 화면(db연동)
    @SuppressWarnings("unchecked")
    public List<BucFcltsVO> bucFcltsAccmltConectrAjax(BucFcltsVO bucFcltsVO) throws Exception {
        return (List<BucFcltsVO>) list("bucFcltsDAO.bucFcltsAccmltConectrAjax" , bucFcltsVO);
    }
    
   
    // 비즈니스 시설물 34종 데이터(막대그래프) 입력률 화면
    @SuppressWarnings("unchecked")
    public List<BucFcltsVO> bucFcltsInputRateAjax(BucFcltsVO bucFcltsVO) throws Exception {
        return (List<BucFcltsVO>) list("bucFcltsDAO.bucFcltsInputRateAjax" , bucFcltsVO);
    }
    
    // 비즈니스 시설물 34종 데이터 입력률 화면
    @SuppressWarnings("unchecked")
    public List<BucFcltsVO> BucFcltsDataTransferAjax(BucFcltsVO bucFcltsVO) throws Exception {
        return (List<BucFcltsVO>) list("bucFcltsDAO.BucFcltsDataTransferAjax" , bucFcltsVO);
    }
    
    // 비즈니스 시설물 고장평균처리일 위젯 db연동(본부) 화면
    @SuppressWarnings("unchecked")
    public List<BucFcltsVO> BucFcltsBrokenproavgdaybonbuAjax(BucFcltsVO bucFcltsVO) throws Exception {
        return (List<BucFcltsVO>) list("bucFcltsDAO.bucFcltsBrokenproavgdaybonbuAjax" , bucFcltsVO);
    }
    // 비즈니스 시설물 고장평균처리일 위젯 db연동(지사) 화면
    @SuppressWarnings("unchecked")
    public List<BucFcltsVO> BucFcltsBrokenproavgdayjisaAjax(BucFcltsVO bucFcltsVO) throws Exception {
        return (List<BucFcltsVO>) list("bucFcltsDAO.bucFcltsBrokenproavgdayjisaAjax" , bucFcltsVO);
    }
    
    // 비즈니스 시설물 고장 top20 화면
    @SuppressWarnings("unchecked")
    public List<BucFcltsVO> bucFcltsBrokenfercilitytop(BucFcltsVO bucFcltsVO) throws Exception {
        return (List<BucFcltsVO>) list("bucFcltsDAO.bucFcltsBrokenfercilitytop" , bucFcltsVO);
    }
    
    // 비즈니스 시설물 고장평균처리일수 화면
    @SuppressWarnings("unchecked")
    public List<BucFcltsVO> bucFcltsBrokenproavgday(BucFcltsVO bucFcltsVO) throws Exception {
        return (List<BucFcltsVO>) list("bucFcltsDAO.bucFcltsBrokenproavgday" , bucFcltsVO);
    }
    
    // 비즈니스 시설물 고장 top20 화면
    @SuppressWarnings("unchecked")
    public List<BucFcltsVO> bucFcltsBrokenfercilitytopdbAjax(BucFcltsVO bucFcltsVO) throws Exception {
        return (List<BucFcltsVO>) list("bucFcltsDAO.bucFcltsBrokenfercilitytopdbAjax" , bucFcltsVO);
    }
    
    // 비즈니스 시설물 34종 데이터 이관율 DB연동 화면(히트맵)
    @SuppressWarnings("unchecked")
    public List<BucFcltsVO> bucFcltsDataTransferdbAjax(BucFcltsVO bucFcltsVO) throws Exception {
        return (List<BucFcltsVO>) list("bucFcltsDAO.bucFcltsDataTransferdbAjax" , bucFcltsVO);
    }
    
    // 비즈니스 시설물 34종 입력률(막대그래프) DB연동 화면
    @SuppressWarnings("unchecked")
    public List<BucFcltsVO> bucFclts34EscalationRatedbAjax(BucFcltsVO bucFcltsVO) throws Exception {
        return (List<BucFcltsVO>) list("bucFcltsDAO.bucFclts34EscalationRatedbAjax" , bucFcltsVO);
    }
}


