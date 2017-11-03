package egovframework.com.sdtic.bucrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionException;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.service.impl.EgovTofacComAbstractDAO;
import egovframework.com.sdtic.bucrs.service.BucCmmnVO;
import egovframework.com.sdtic.bucrs.service.BucTrackingVO;
import egovframework.com.sdtic.main.service.MainCmmnVO;

 /**
 * @Class Name :  BucCmmnDAO.java
 * @Description : BucCmmnDAO Class
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
@Repository("bucCmmnDAO")
public class BucCmmnDAO extends EgovTofacComAbstractDAO {

    // 비즈니스 공통 메인 화면
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnMainAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnMainAjax" , bucCmmnVO);
    }

    // 비즈니스 공통 SMS 발송현황 화면
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnSmssndngAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnSmssndngAjax" , bucCmmnVO);
    }

    // 비즈니스 공통 헬프데스크 처리현황 화면
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnHelpdeskAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnHelpdeskAjax" , bucCmmnVO);
    }
    
    // 비즈니스 공통 헬프데스크 처리현황 db연동 화면
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnHelpdeskdbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnHelpdeskdbAjax" , bucCmmnVO);
    }

    // 비즈니스 공통 간이결재 처리현황 화면
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnSimplctysanctnAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnSimplctysanctnAjax" , bucCmmnVO);
    }

    // 비즈니스 공통 대외연계 송수신현황 화면
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnExtrnlcntcAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnExtrnlcntcAjax" , bucCmmnVO);
    }

    // 비즈니스 공통 데이터 증가율 화면
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnDataicrrt(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnDataicrrt" , bucCmmnVO);
    }

    // 비즈니스 공통 데이터 이관율 화면
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnDatatrnsferAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnDatatrnsferAjax" , bucCmmnVO);
    }

    // 비즈니스 공통 정보이관 Tracking Process 화면
    @SuppressWarnings("unchecked")
    public List<BucTrackingVO> bucCmmnInfotrnsfertrkgAjax(BucTrackingVO bucTrackingVO) throws Exception {
        return (List<BucTrackingVO>) list("bucCmmnDAO.bucCmmnInfotrnsfertrkgAjax" , bucTrackingVO);
    }
    
    // 비즈니스 기술자문 화면
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnTechAdviserAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnTechAdviserAjax" , bucCmmnVO);
    }
    
    // 비즈니스 공통 도로정보시스템 활용메뉴 Top5 화면
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnLoadinfomenuAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnLoadinfomenuAjax" , bucCmmnVO);
    }
    
    // 비즈니스 공통 데이터 증가율 화면
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnDataicrrt1Ajax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnDataicrrt1Ajax" , bucCmmnVO);
    }
    
    // 비즈니스 공통 도로정보시스템 활용메뉴 Top5 DB연동 화면(파이차트)
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnLoadinfomenudbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnLoadinfomenudbAjax" , bucCmmnVO);
    }
    // 비즈니스 공통 도로정보시스템 활용메뉴 Top5 DB연동 화면(그리드)
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnLoadinfomenudbgridAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnLoadinfomenudbgridAjax" , bucCmmnVO);
    }
    
    // 비즈니스 공통 헬프데스크 처리현황 DB연동 화면
   /* @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnHelpdeskdbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnHiportalDAO.bucCmmnHelpdeskdbAjax" , bucCmmnVO);
    }*/
    
    // 비즈니스 공통 도로정보시스템 시용자 Top10 DB연동 화면(파이차트)
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnLoadinfouserdbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnLoadinfouserdbAjax" , bucCmmnVO);
    }
    // 비즈니스 공통 도로정보시스템 시용자 Top10 DB연동 화면(그리드)
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnLoadinfouserdbgridAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnLoadinfouserdbgridAjax" , bucCmmnVO);
    }
    
    // 비즈니스 공통 기술자문 처리 실적 DB연동 화면 
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnTechAdviserdbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnTechAdviserdbAjax" , bucCmmnVO);
    }
    
    // 비즈니스 공통 메인위젯 건설공정율 화면
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnMaindbFcltsAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnMaindbFcltsAjax" , bucCmmnVO);
    }
    // 비즈니스 공통 대외연계 송수신현황 DB연동 화면
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnExtrnlcntcdbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnExtrnlcntcdbAjax" , bucCmmnVO);
    }
    
    // 비즈니스 공통 메인 설계 DB연동 화면
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnMaindbDsgnAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnMaindbDsgnAjax" , bucCmmnVO);
    }
   
    // 비즈니스 공통 메인 유지관리 DB연동 화면
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnMaindbMntmngAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnMaindbMntmngAjax" , bucCmmnVO);
    }
    
    // 기관(본부) 선택 Select Level1
    @SuppressWarnings("unchecked")
    public List<MainCmmnVO> selectMainInstt1lv(MainCmmnVO mainCmmnVO) throws Exception {
        return (List<MainCmmnVO>) list("bucCmmnDAO.selectMainInstt1lv" , mainCmmnVO);
    }

    // 기관(지사) 선택 Select Level2
    @SuppressWarnings("unchecked")
    public List<MainCmmnVO> selectMainInstt2lv(MainCmmnVO mainCmmnVO) throws Exception {
        return (List<MainCmmnVO>) list("bucCmmnDAO.selectMainInstt2lv" , mainCmmnVO);
    }
    
    // 비즈니스 공통 시스템별 만족도 DB연동 화면
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnSystmSatisdbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnSystmSatisdbAjax" , bucCmmnVO);
    }
    
    // 비즈니스 공통 예약업무 DB연동 화면(파이차트)
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnInfotrnsfertrkgchartdbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnInfotrnsfertrkgchartdbAjax" , bucCmmnVO);
    }
    // 비즈니스 공통 예약업무 발송 DB연동 화면(그리드)
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnInfotrnsfertrkgsenddbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnInfotrnsfertrkgsenddbAjax" , bucCmmnVO);
    }
    // 비즈니스 공통 예약업무 수신 DB연동 화면 
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnInfotrnsfertrkgrecvdbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnInfotrnsfertrkgrecvdbAjax" , bucCmmnVO);
    }
    // 비즈니스 공통 이벤트 DB연동 화면
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnEventListdbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnEventListdbAjax" , bucCmmnVO);
    }
    // 비즈니스 공통 간이결재 처리현황 DB연동 화면
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnSimplctysanctndbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnSimplctysanctndbAjax" , bucCmmnVO);
    }
    // 비즈니스 공통 이벤트 DB연동 화면
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnEventGraphdbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnEventGraphdbAjax" , bucCmmnVO);
    }
    
    // 비즈니스 공통 데이터 이관율 db 화면
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnDatatrnsferdbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnDatatrnsferdbAjax" , bucCmmnVO);
    }
    
    // 지사상위코드 가져오기
    @SuppressWarnings("unchecked")
    public List<BucCmmnVO> bucCmmnGetHGRN_DPTCDAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return (List<BucCmmnVO>) list("bucCmmnDAO.bucCmmnGetHGRN_DPTCDAjax" , bucCmmnVO);
    }
}
