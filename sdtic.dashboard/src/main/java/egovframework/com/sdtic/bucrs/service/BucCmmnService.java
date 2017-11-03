package egovframework.com.sdtic.bucrs.service;

import java.util.List;

import egovframework.com.sdtic.main.service.MainCmmnVO;

/**
 * @Class Name :  BucCmmnService.java
 * @Description : BucCmmnService Class
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
public interface BucCmmnService {

    // 비즈니스 공통 매인 화면
    public List<BucCmmnVO> bucCmmnMainAjax(BucCmmnVO bucCmmnVO) throws Exception;

    // 비즈니스 공통 SMS 발송현황 화면
    public List<BucCmmnVO> bucCmmnSmssndngAjax(BucCmmnVO bucCmmnVO) throws Exception;

    // 비즈니스 공통 헬프데스크 처리현황 화면
    public List<BucCmmnVO> bucCmmnHelpdeskAjax(BucCmmnVO bucCmmnVO) throws Exception;
    
    // 비즈니스 공통 헬프데스크 처리현황 db연동 화면
    public List<BucCmmnVO> bucCmmnHelpdeskdbAjax(BucCmmnVO bucCmmnVO) throws Exception;
    
    // 비즈니스 공통 간이결재 처리현황 화면
    public List<BucCmmnVO> bucCmmnSimplctysanctnAjax(BucCmmnVO bucCmmnVO) throws Exception;

    // 비즈니스 공통 대외연계 송수신현황 화면
    public List<BucCmmnVO> bucCmmnExtrnlcntcAjax(BucCmmnVO bucCmmnVO) throws Exception;

    // 비즈니스 공통 데이터 증가율 화면
    public List<BucCmmnVO> bucCmmnDataicrrt(BucCmmnVO bucCmmnVO) throws Exception;

    // 비즈니스 공통 데이터 이관율 화면
    public List<BucCmmnVO> bucCmmnDatatrnsferAjax(BucCmmnVO bucCmmnVO) throws Exception;

    // 비즈니스 공통 정보이관 Tracking Process 화면
    public List<BucTrackingVO> bucCmmnInfotrnsfertrkgAjax(BucTrackingVO bucTrackingVO) throws Exception;
    
    // 비즈니스 공통 기술자문 처리 실적 화면
    public List<BucCmmnVO> bucCmmnTechAdviserAjax(BucCmmnVO bucCmmnVO) throws Exception;

    // 비즈니스 공통 도로정보시스템 활용메뉴 Top5 화면
    public List<BucCmmnVO> bucCmmnLoadinfomenuAjax(BucCmmnVO bucCmmnVO) throws Exception;
    
    // 비즈니스 공통 데이터 증가율 화면
    public List<BucCmmnVO> bucCmmnDataicrrt1Ajax(BucCmmnVO bucCmmnVO) throws Exception;
    
    // 비즈니스 공통 도로정보시스템 활용메뉴 Top5 DB연동 화면
    public List<BucCmmnVO> bucCmmnLoadinfomenudbAjax(BucCmmnVO bucCmmnVO) throws Exception;
    public List<BucCmmnVO> bucCmmnLoadinfomenudbgridAjax(BucCmmnVO bucCmmnVO) throws Exception;   
   
       
    // 비즈니스 공통 도로정보시스템 사용자 Top10 DB연동 화면
    public List<BucCmmnVO> bucCmmnLoadinfouserdbAjax(BucCmmnVO bucCmmnVO) throws Exception;
    public List<BucCmmnVO> bucCmmnLoadinfouserdbgridAjax(BucCmmnVO bucCmmnVO) throws Exception; 
    
    // 비즈니스 공통 기술자문 처리 실적 화면
    public List<BucCmmnVO> bucCmmnTechAdviserdbAjax(BucCmmnVO bucCmmnVO) throws Exception;
    
    // 비즈니스 공통 메인 건설공정률db 화면
    public List<BucCmmnVO> bucCmmnMaindbFcltsAjax(BucCmmnVO bucCmmnVO) throws Exception;
    
    // 비즈니스 공통 메인 유지관리db 화면
    public List<BucCmmnVO> bucCmmnMaindbMntmngAjax(BucCmmnVO bucCmmnVO) throws Exception;

    // 비즈니스 공통 대외연계 송수신현황 db연동화면
    public List<BucCmmnVO> bucCmmnExtrnlcntcdbAjax(BucCmmnVO bucCmmnVO) throws Exception;
    
    // 비즈니스 공통 매인 설계 db 화면
    public List<BucCmmnVO> bucCmmnMaindbDsgnAjax(BucCmmnVO bucCmmnVO) throws Exception;
    
    // 기관(본부) 선택 Select Level1
    public List<MainCmmnVO> selectMainInstt1lv(MainCmmnVO mainCmmnVO) throws Exception;
    
    // 기관(지사) 선택 Select Level2
    public List<MainCmmnVO> selectMainInstt2lv(MainCmmnVO mainCmmnVO) throws Exception;
    
    // 비즈니스 공통 SMS 발송현황 db연동 화면
    public List<BucCmmnVO> bucCmmnSmssndngdbAjax(BucCmmnVO bucCmmnVO) throws Exception;

    // 비즈니스 공통 시스템별 만족도 db연동 화면
    public List<BucCmmnVO> bucCmmnSystmSatisdbAjax(BucCmmnVO bucCmmnVO) throws Exception;
    
    // 비즈니스 공통 예약업무 파이차트 db연동 화면
    public List<BucCmmnVO> bucCmmnInfotrnsfertrkgchartdbAjax(BucCmmnVO bucCmmnVO) throws Exception;
    // 비즈니스 공통 예약업무 발송그리드 db연동 화면
    public List<BucCmmnVO> bucCmmnInfotrnsfertrkgsenddbAjax(BucCmmnVO bucCmmnVO) throws Exception;
    // 비즈니스 공통 예약업무 수신그리드 db연동 화면
    public List<BucCmmnVO> bucCmmnInfotrnsfertrkgrecvdbAjax(BucCmmnVO bucCmmnVO) throws Exception;
    
    // 비즈니스 공통 이벤트 db연동 화면
    public List<BucCmmnVO> bucCmmnEventListdbAjax(BucCmmnVO bucCmmnVO) throws Exception;
    
    // 비즈니스 공통 간이결재 처리현황 db연동 화면
    public List<BucCmmnVO> bucCmmnSimplctysanctndbAjax(BucCmmnVO bucCmmnVO) throws Exception;
    
    // 비즈니스 공통 기술자문 처리실적 db연동 화면
    public List<BucCmmnVO> bucCmmnTechAdvPrcssdbAjax(BucCmmnVO bucCmmnVO) throws Exception;
    
    // 비즈니스 공통 데이터 증가율 화면
    public List<BucFcltsVO> bucCmmnDataicrrtdbAjax(BucFcltsVO bucFcltsVO) throws Exception;
    
    // 비즈니스 공통 이벤트 그래프 화면
    public List<BucCmmnVO> bucCmmnEventGraphdbAjax(BucCmmnVO bucCmmnVO) throws Exception;
    
    // 비즈니스 공통 데이터 이관율 db 화면
    public List<BucCmmnVO> bucCmmnDatatrnsferdbAjax(BucCmmnVO bucCmmnVO) throws Exception;
    
    // 지사 상위코드 가져오기
    public List<BucCmmnVO> bucCmmnGetHGRN_DPTCDAjax(BucCmmnVO bucCmmnVO) throws Exception;
}
