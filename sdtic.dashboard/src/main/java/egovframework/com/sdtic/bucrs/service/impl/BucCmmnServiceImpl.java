package egovframework.com.sdtic.bucrs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.sdtic.bucrs.service.BucCmmnService;
import egovframework.com.sdtic.bucrs.service.BucCmmnVO;
import egovframework.com.sdtic.bucrs.service.BucFcltsVO;
import egovframework.com.sdtic.bucrs.service.BucTrackingVO;
import egovframework.com.sdtic.main.service.MainCmmnVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name :  BucCmmnServiceImpl.java
 * @Description : BucCmmnServiceImpl Class
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

@Service("bucCmmnService")
public class BucCmmnServiceImpl extends EgovAbstractServiceImpl implements BucCmmnService {

    //비즈니스 시설물#1사용
    @Resource(name="bucCmmnDAO")
    private BucCmmnDAO bucCmmnDAO;

    //비즈니스 헬프데스크 처리현황 DB연동 화면  - 다른오라클 계정 접속을 위한 DAO
    @Resource(name="bucHiportalDAO")
    private BucHiportalDAO bucHiportalDAO;
    
    //비즈니스 Sms mysql 사용
    @Resource(name="bucSmsDAO")
    private BucSmsDAO bucSmsDAO;
    
    //비즈니스 Sms mysql 사용
    @Resource(name="bucResearchinfoDAO")
    private BucResearchinfoDAO bucResearchinfoDAO;
    
    //비즈니스 Sms mysql 사용
    @Resource(name="bucFcltsCtlDAO")
    private BucFcltsCtlDAO bucFcltsCtlDAO;
    
    
    // 비즈니스 공통 메인 화면
    @Override
    public List<BucCmmnVO> bucCmmnMainAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnMainAjax(bucCmmnVO);
    }

    // 비즈니스 공통 SMS 발송현황 화면
    @Override
    public List<BucCmmnVO> bucCmmnSmssndngAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnSmssndngAjax(bucCmmnVO);
    }

    // 비즈니스 공통 헬프데스크 처리현황 화면
    @Override
    public List<BucCmmnVO> bucCmmnHelpdeskAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnHelpdeskAjax(bucCmmnVO);
    }
    
    // 비즈니스 공통 헬프데스크 처리현황 db연동 화면
    @Override
    public List<BucCmmnVO> bucCmmnHelpdeskdbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucHiportalDAO.bucCmmnHelpdeskdbAjax(bucCmmnVO);
    }

    // 비즈니스 공통 간이결재 처리현황 화면
    @Override
    public List<BucCmmnVO> bucCmmnSimplctysanctnAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnSimplctysanctnAjax(bucCmmnVO);
    }

    // 비즈니스 공통 대외연계 송수신현황 화면
    @Override
    public List<BucCmmnVO> bucCmmnExtrnlcntcAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnExtrnlcntcAjax(bucCmmnVO);
    }

    // 비즈니스 공통 데이터 증가율 화면
    @Override
    public List<BucCmmnVO> bucCmmnDataicrrt(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnDataicrrt(bucCmmnVO);
    }

    // 비즈니스 공통 데이터 이관율 화면
    @Override
    public List<BucCmmnVO> bucCmmnDatatrnsferAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnDatatrnsferAjax(bucCmmnVO);
    }
    // 비즈니스 공통 정보이관 Tracking Process 화면
    @Override
    public List<BucTrackingVO> bucCmmnInfotrnsfertrkgAjax(BucTrackingVO bucTrackingVO) throws Exception {
        return bucCmmnDAO.bucCmmnInfotrnsfertrkgAjax(bucTrackingVO);
    }
    // 비즈니스  기술자문 화면
    @Override
    public List<BucCmmnVO> bucCmmnTechAdviserAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnTechAdviserAjax(bucCmmnVO);
    }
    // 비즈니스 공통 도로정보시스템 활용메뉴 Top5 화면
    @Override
    public List<BucCmmnVO> bucCmmnLoadinfomenuAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnLoadinfomenuAjax(bucCmmnVO);
    }
    
    // 비즈니스 공통 데이터 증가율 화면
    @Override
    public List<BucCmmnVO> bucCmmnDataicrrt1Ajax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnDataicrrt1Ajax(bucCmmnVO);
    }
    
    // 비즈니스 공통 도로정보시스템 활용메뉴 Top5 DB연동 화면(파이차트)
    @Override
    public List<BucCmmnVO> bucCmmnLoadinfomenudbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnLoadinfomenudbAjax(bucCmmnVO);
    }
    // 비즈니스 공통 도로정보시스템 활용메뉴 Top5 DB연동 화면(그리드)
    @Override
    public List<BucCmmnVO> bucCmmnLoadinfomenudbgridAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnLoadinfomenudbgridAjax(bucCmmnVO);
    }
   
    // 비즈니스 공통 도로정보시스템 사용자 Top10 DB연동 화면(파이차트)
    @Override
    public List<BucCmmnVO> bucCmmnLoadinfouserdbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnLoadinfouserdbAjax(bucCmmnVO);
    }
    // 비즈니스 공통 도로정보시스템 시용자 Top10 DB연동 화면(그리드)
    @Override
    public List<BucCmmnVO> bucCmmnLoadinfouserdbgridAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnLoadinfouserdbgridAjax(bucCmmnVO);
    }
    
    
    // 비즈니스 공통 기술자문 처리 실적 DB연동 화면
    @Override
    public List<BucCmmnVO> bucCmmnTechAdviserdbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnTechAdviserdbAjax(bucCmmnVO);
    }
    
   // 비즈니스 공통 메인위젯 건설공정율 화면
    @Override
    public List<BucCmmnVO> bucCmmnMaindbFcltsAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnMaindbFcltsAjax(bucCmmnVO);
    }
    
    // 비즈니스 공통 유지관리 DB연동 화면
    @Override
    public List<BucCmmnVO> bucCmmnMaindbMntmngAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnMaindbMntmngAjax(bucCmmnVO);
    }

    // 비즈니스 공통 대외연계 송수신현황 db연동화면
    @Override
    public List<BucCmmnVO> bucCmmnExtrnlcntcdbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnExtrnlcntcdbAjax(bucCmmnVO);
    }
    
    // 비즈니스 공통 메인설계 DB연동 화면
    @Override
    public List<BucCmmnVO> bucCmmnMaindbDsgnAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnMaindbDsgnAjax(bucCmmnVO);
    }
    
    // 기관(본부) 선택 Select Level1
    @Override
    public List<MainCmmnVO> selectMainInstt1lv(MainCmmnVO mainCmmnVO) throws Exception {
        return bucCmmnDAO.selectMainInstt1lv(mainCmmnVO);
    }

    // 기관(지사) 선택 Select Level2
    @Override
    public List<MainCmmnVO> selectMainInstt2lv(MainCmmnVO mainCmmnVO) throws Exception {
        return bucCmmnDAO.selectMainInstt2lv(mainCmmnVO);
    }
    
    // 비즈니스 공통 SMS 발송현황 db연동 화면
    @Override
    public List<BucCmmnVO> bucCmmnSmssndngdbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucSmsDAO.bucCmmnSmssndngdbAjax(bucCmmnVO);
    }

    // 비즈니스 공통 시스템별 만족도 db연동 화면
    @Override
    public List<BucCmmnVO> bucCmmnSystmSatisdbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnSystmSatisdbAjax(bucCmmnVO);
    }
    
    // 비즈니스 공통 예약업무 차트 db연동 화면(파이차트)
    @Override
    public List<BucCmmnVO> bucCmmnInfotrnsfertrkgchartdbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnInfotrnsfertrkgchartdbAjax(bucCmmnVO);
    }
    // 비즈니스 공통 예약업무 발송 db연동 화면(그리드)
    @Override
    public List<BucCmmnVO> bucCmmnInfotrnsfertrkgsenddbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnInfotrnsfertrkgsenddbAjax(bucCmmnVO);
    }
    // 비즈니스 공통 예약업무 수신 db연동 화면
    @Override
    public List<BucCmmnVO> bucCmmnInfotrnsfertrkgrecvdbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnInfotrnsfertrkgrecvdbAjax(bucCmmnVO);
    }
    
    // 비즈니스 공통 이벤트 DB연동 화면
    @Override
    public List<BucCmmnVO> bucCmmnEventListdbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnEventListdbAjax(bucCmmnVO);
    }
    
    // 비즈니스 공통 간이결재 처리현황 db연동 화면
    @Override
    public List<BucCmmnVO> bucCmmnSimplctysanctndbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnSimplctysanctndbAjax(bucCmmnVO);
    }
    
    // 비즈니스 공통 기술자문 처리실적 db연동 화면
    @Override
    public List<BucCmmnVO> bucCmmnTechAdvPrcssdbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucResearchinfoDAO.bucCmmnTechAdvPrcssdbAjax(bucCmmnVO);
    }
    
    // 비즈니스 공통 데이터 증가율 db연동 화면
    @Override
    public List<BucFcltsVO> bucCmmnDataicrrtdbAjax(BucFcltsVO bucFcltsVO) throws Exception {
        return bucFcltsCtlDAO.bucCmmnDataicrrtdbAjax(bucFcltsVO);
    }
    
    // 비즈니스 공통 기술자문 처리실적 db연동 화면
    @Override
    public List<BucCmmnVO> bucCmmnEventGraphdbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnEventGraphdbAjax(bucCmmnVO);
    }
    // 비즈니스 공통 데이터 이관율 db 화면
    @Override
    public List<BucCmmnVO> bucCmmnDatatrnsferdbAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnDatatrnsferdbAjax(bucCmmnVO);
    }
    
 // 비즈니스 공통 데이터 이관율 db 화면
    @Override
    public List<BucCmmnVO> bucCmmnGetHGRN_DPTCDAjax(BucCmmnVO bucCmmnVO) throws Exception {
        return bucCmmnDAO.bucCmmnGetHGRN_DPTCDAjax(bucCmmnVO);
    }
}