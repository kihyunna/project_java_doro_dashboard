package egovframework.com.sdtic.fecrs.service;

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
public interface fecMainFacDBService {

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
    
    // 터널상세LV2 현황 차트
    public List<FecTunnelDetailVO> fecTunnelDetailLv2Ajax(FecSearchVO fecSearchVO) throws Exception;
    
    // 전기 시설물LV2 차트
    public List<FecElctyFcltsVO> fecElctyFcltsLv2Ajax(FecSearchVO fecSearchVO) throws Exception;
    
    // 오수처리LV2 차트
    public List<FecPltwtrProcessVO> fecPltwtrProcessLv2Ajax(FecSearchVO fecSearchVO) throws Exception;

}
