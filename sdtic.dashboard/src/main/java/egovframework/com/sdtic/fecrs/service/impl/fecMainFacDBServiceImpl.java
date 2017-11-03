package egovframework.com.sdtic.fecrs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.com.sdtic.fecrs.service.FecElctyFcltsVO;
import egovframework.com.sdtic.fecrs.service.FecMDTOperVO;
import egovframework.com.sdtic.fecrs.service.FecMainMapVO;
import egovframework.com.sdtic.fecrs.service.FecPltwtrProcessVO;
import egovframework.com.sdtic.fecrs.service.FecSearchVO;
import egovframework.com.sdtic.fecrs.service.FecTunnelDetailVO;
import egovframework.com.sdtic.fecrs.service.fecMainFacDBService;
import egovframework.com.sdtic.fecrs.service.fecMainVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : fecMainServiceImpl.java
 * @Description : fecMainServiceImpl Class
 * @Modification Information
 * @
 * @ 수정일         수정자                        수정내용
 * @ -----------   ---------   -------------------------------
 * @ 2017. 07.18    nkh                        최초생성
 *
 * @author itforward
 * @since 2017. 07.18 
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */                                                   
@Service("fecMainFacDBService")
public class fecMainFacDBServiceImpl extends EgovAbstractServiceImpl implements fecMainFacDBService {

    private static final Logger LOGGER = LoggerFactory.getLogger(fecMainFacDBServiceImpl.class);

    /** CommonDAO */
    // TODO ibatis 사용
    @Resource(name="fecMainFacDBDAO") private fecMainFacDBDAO fecMainFacDBDAO;
    
    // 공통코드 리스트 조회
    @Override
    public List<fecMainVO> fecMainCodeListAjax(fecMainVO fecMainVO) throws Exception {
        return fecMainFacDBDAO.fecMainCodeListAjax(fecMainVO);
    }
    
    // MDT 운행현황 금일전일 비교
    @Override
    public FecMDTOperVO fecMdtoperLv1Ajax(FecSearchVO fecSearchVO) throws Exception{
    	return fecMainFacDBDAO.fecMdtoperLv1Ajax(fecSearchVO);
    }
    
    // MDT 운행현황 장애현황
    @Override
    public List<FecMDTOperVO> fecMdttroblLv1Ajax(FecSearchVO fecSearchVO) throws Exception{
        return fecMainFacDBDAO.fecMdttroblLv1Ajax(fecSearchVO);
    }
    
    // MDT 운행현황 맵차트
    @Override
    public List<FecMDTOperVO> fecMdtmapLv1Ajax(FecSearchVO fecSearchVO) throws Exception{
        return fecMainFacDBDAO.fecMdtmapLv1Ajax(fecSearchVO);
    }
    
    // MAP 현장설비 아이콘 표시
    @Override
    public List<FecMainMapVO> fecMainMapLv1Ajax(FecSearchVO fecSearchVO) throws Exception{
        return fecMainFacDBDAO.fecMainMapLv1Ajax(fecSearchVO);
    }
    
    // 터널상세LV2 현황 차트
    @Override
    public List<FecTunnelDetailVO> fecTunnelDetailLv2Ajax(FecSearchVO fecSearchVO) throws Exception{
        return fecMainFacDBDAO.fecTunnelDetailLv2Ajax(fecSearchVO);
    }
    
    // 전기 시설물LV2 차트
    @Override
    public List<FecElctyFcltsVO> fecElctyFcltsLv2Ajax(FecSearchVO fecSearchVO) throws Exception{
        return fecMainFacDBDAO.fecElctyFcltsLv2Ajax(fecSearchVO);
    }
    // 오수처리LV2 차트
    @Override
    public List<FecPltwtrProcessVO> fecPltwtrProcessLv2Ajax(FecSearchVO fecSearchVO) throws Exception{
        return fecMainFacDBDAO.fecPltwtrProcessLv2Ajax(fecSearchVO);
    }
}