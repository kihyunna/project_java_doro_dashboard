package egovframework.com.sdtic.fecrs.service;

import java.util.HashMap;
import java.util.List;

/**
 * @Class Name : fecMainService.java
 * @Description : fecMainService Class
 * @Modification Information
 * @
 * @ 수정일         수정자                        수정내용
 * @ -----------   ---------   -------------------------------
 * @ 2017. 07.18     nkh                        최초생성
 *
 * @author itforward
 * @since 2017. 07.18 
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public interface fecMainService {

    // 공통코드 리스트 조회
    public List<fecMainVO> fecMainCodeListAjax(fecMainVO fecMainVO) throws Exception;
    
    // MDT 운행현황 금일전일 비교
    public FecMDTOperVO fecMdtoperLv1Ajax(FecSearchVO fecSearchVO) throws Exception;
    // MDT 운행현황 장애현황
    public List<FecMDTOperVO> fecMdttroblLv1Ajax(FecSearchVO fecSearchVO) throws Exception;
    // MDT 운행현황 맵차트
    public List<FecMDTOperVO> fecMdtmapLv1Ajax(FecSearchVO fecSearchVO) throws Exception;
    // MAP 현장설비 아이콘 표시
    public List<FecMainMapVO> fecMainMapLv1Ajax(FecSearchVO fecSearchVO) throws Exception;
    
    // 터널상세LV2 현황 
    public List<FecTunnelDetailVO> fecTunnelDetailLv2Ajax(FecSearchVO fecSearchVO) throws Exception;
    
    // 터널상세LV2 Max Seq 가져오기
    public String fecGetTunnelDetailLv2Seq() throws Exception;
    
    // 전기 시설물LV2 차트
    public List<FecElctyFcltsVO> fecElctyFcltsLv2Ajax(FecSearchVO fecSearchVO) throws Exception;
    
    // 오수처리상세LV2 Max Seq 가져오기
    public String fecGetPltwtrProcessLv2Seq() throws Exception;
    
    // 오수처리상세LV2
    public List<FecPltwtrProcessVO> fecPltwtrProcessLv2Ajax(FecSearchVO fecSearchVO) throws Exception;
    
    // 전기(터널)상세LV2 Max Seq 가져오기
    public String fecGetElctyTunnelLv2Seq() throws Exception;
    
    // 전기(터널)상세LV2
    public List<FecElctyTunnelVO> fecElctyTunnelLv2Ajax(FecSearchVO fecSearchVO) throws Exception;
    
    // 전기(영업소)상세LV2 Max Seq 가져오기
    public String fecGetElctyTollgateLv2Seq() throws Exception;
    
    // 전기(영업소)상세LV2
    public List<FecElctyTollgateVO> fecElctyTollgateLv2Ajax(FecSearchVO fecSearchVO) throws Exception;
    
    // 사면상세LV2 Max Seq 가져오기
    public String fecGetSlopeLv2Seq() throws Exception;
    
    // 사면상세LV2
    public List<FecSlopeVO> fecSlopeLv2Ajax(FecSearchVO fecSearchVO) throws Exception;
    
    // 전기(가로등/조명탑)상세LV2
    public List<FecElctyLampVO> fecElctyLampLv2Ajax(FecSearchVO fecSearchVO) throws Exception;
    
    // 염수상세LV2
    public List<FecBrineVO> fecBrineLv2Ajax(FecSearchVO fecSearchVO) throws Exception;
    
    // 전기(가로등/조명탑)상세LV2 Max Seq 가져오기
    public String fecGetElctyLampLv2Seq() throws Exception;
    
    // 전력사용량LV1
    public List<FecPwrerUsgqtyVO> fecPwrerUsgqtyLv1Ajax(FecSearchVO fecSearchVO) throws Exception;
    
    // 메인 IOT플렛폼
    public List<mainSptIOTVO> mainSptIOTAjax(FecSearchVO fecSearchVO) throws Exception;
    
    // 부서 좌표 가져오기
    public List<FecSearchVO> fecGetDeptAjax(FecSearchVO fecSearchVO) throws Exception;
    
    // 	터널 이벤트 내용 및 좌표 조회
    public List<fecEventVO> fecGetEventTunnelAjax(FecSearchVO fecSearchVO) throws Exception;
    // 	전기 이벤트 내용 및 좌표 조회
    public List<fecEventVO> fecGetEventElctsAjax(FecSearchVO fecSearchVO) throws Exception;
    // 	오수 이벤트 내용 및 좌표 조회
    public List<fecEventVO> fecGetEventSvarAjax(FecSearchVO fecSearchVO) throws Exception;
    // 	사면 이벤트 내용 및 좌표 조회
    public List<fecEventVO> fecGetEventSlopeAjax(FecSearchVO fecSearchVO) throws Exception;
    // 	Cctv 이벤트 내용 및 좌표 조회
    public List<fecEventVO> fecGetEventCctvAjax(FecSearchVO fecSearchVO) throws Exception;
    // 	Mdt 이벤트 내용 및 좌표 조회
    public List<fecEventVO> fecGetEventMdtAjax(FecSearchVO fecSearchVO) throws Exception;
    
    // 	지도 본부 선택 지사 코드 가져오기
    public List<HashMap<String, String>> fecJisaCodeAjax(FecSearchVO fecSearchVO) throws Exception;
    
    // 	이벤트 리스트 조회
    public List<fecEventVO> FecEventListLv2(FecSearchVO fecSearchVO) throws Exception;
    
    // 	메인 현장센서 시설물 리스트 조회
    public List<HashMap<String, String>> mainSptSensor() throws Exception;
    
    // 가동현황 1레벨
    public List<HashMap<String, String>> fecSptEqpOprCstsLv1(FecSearchVO fecSearchVO) throws Exception;   
    
    // 장애/조치 1레벨
    public List<HashMap<String, String>> fecAreclTroblOccrrncManagtLv1(FecSearchVO fecSearchVO) throws Exception;   
    
    // 장애/조치 2레벨
    public List<HashMap<String, String>> fecPsctnTroblOccrrncManagtLv2(FecSearchVO fecSearchVO) throws Exception;   
    
    // 메인 본부별 현황
    public List<FecSptMapVO> fecSptMapAjax(FecSearchVO fecSearchVO) throws Exception;
    
    // 	메인 현장센서 mdt 조회
    public List<HashMap<String, String>> mainSptSensorMdt() throws Exception;
    
    // 메인 본부별 현황 - mdt
    public List<FecSptMapVO> fecSptMapMdtAjax(FecSearchVO fecSearchVO) throws Exception;
     
}
