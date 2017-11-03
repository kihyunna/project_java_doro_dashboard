package egovframework.com.sdtic.fecrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.sdtic.fecrs.service.FecElctyFcltsVO;
import egovframework.com.sdtic.fecrs.service.FecMDTOperVO;
import egovframework.com.sdtic.fecrs.service.FecMainMapVO;
import egovframework.com.sdtic.fecrs.service.FecPltwtrProcessVO;
import egovframework.com.sdtic.fecrs.service.FecSearchVO;
import egovframework.com.sdtic.fecrs.service.FecTunnelDetailVO;
import egovframework.com.sdtic.fecrs.service.fecMainVO;



/**
 * @Class Name : fecMainDAO.java
 * @Description : fecMainDAO DAO Class
 * @Modification Information
 * @
 * @ 수정일         수정자                        수정내용
 * @ -----------   ---------   -------------------------------
 * @ 2017. 07.18    jkeho                        최초생성
 *
 * @author itforward
 * @since 2017. 07.18
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
@Repository("fecMainFacDBDAO")
public class fecMainFacDBDAO extends FacDBAbstractDAO {

    // 공통코드 리스트 조회
    @SuppressWarnings("unchecked")
    public List<fecMainVO> fecMainCodeListAjax(fecMainVO fecMainVO) throws Exception {
        return (List<fecMainVO>) list("fecMainDAO.fecMainCodeListAjax" , fecMainVO);
    }
     
    // MDT 운행현황 금일전일 비교
    @SuppressWarnings("deprecation")
	public FecMDTOperVO fecMdtoperLv1Ajax(FecSearchVO fecSearchVO) throws Exception{
    	return (FecMDTOperVO) selectByPk("FecMdtoperDAO.fecMdtoperLv1Ajax", fecSearchVO);
    }
    
    // MDT 운행현황 장애현황
    @SuppressWarnings("unchecked")
    public List<FecMDTOperVO> fecMdttroblLv1Ajax(FecSearchVO fecSearchVO) throws Exception{
    	return (List<FecMDTOperVO>) list("FecMdtoperDAO.fecMdttroblLv1Ajax", fecSearchVO);
    }
    
    // MDT 운행현황 맵차트
    @SuppressWarnings("unchecked")
    public List<FecMDTOperVO> fecMdtmapLv1Ajax(FecSearchVO fecSearchVO) throws Exception{
    	return (List<FecMDTOperVO>) list("FecMdtoperDAO.fecMdtmapLv1Ajax", fecSearchVO);
    }
    
 // MDT 운행현황 맵차트
    @SuppressWarnings("unchecked")
    public List<FecMainMapVO> fecMainMapLv1Ajax(FecSearchVO fecSearchVO) throws Exception{
    	return (List<FecMainMapVO>) list("FecMainmapDAO.fecMainmapLv1Ajax", fecSearchVO);
    }
    
 // 터널상세LV2 현황 차트
    @SuppressWarnings("unchecked")
    public List<FecTunnelDetailVO> fecTunnelDetailLv2Ajax(FecSearchVO fecSearchVO) throws Exception{
    	return (List<FecTunnelDetailVO>) list("FecTunnelDetailDAO.fecTunnelDetailLv2Ajax", fecSearchVO);
    }
    
 // 전기 시설물LV2 차트
    @SuppressWarnings("unchecked")
    public List<FecElctyFcltsVO> fecElctyFcltsLv2Ajax(FecSearchVO fecSearchVO) throws Exception{
    	return (List<FecElctyFcltsVO>) list("FecElctyFcltsDAO.fecElctyFcltsLv2Ajax", fecSearchVO);
    }
 // 오수처리 차트
    @SuppressWarnings("unchecked")
    public List<FecPltwtrProcessVO> fecPltwtrProcessLv2Ajax(FecSearchVO fecSearchVO) throws Exception{
    	return (List<FecPltwtrProcessVO>) list("FecPltwtrProcessDAO.fecPltwtrProcessLv2Ajax", fecSearchVO);
    }
    

}
