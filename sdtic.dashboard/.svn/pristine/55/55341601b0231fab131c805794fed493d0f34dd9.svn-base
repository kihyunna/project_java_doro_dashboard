package egovframework.com.sdtic.fecrs.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.sdtic.fecrs.service.FecMDTOperVO;
import egovframework.com.sdtic.fecrs.service.FecMainMapVO;
import egovframework.com.sdtic.fecrs.service.FecSearchVO;
import egovframework.com.sdtic.fecrs.service.FecSptMapVO;
import egovframework.com.sdtic.fecrs.service.fecCctvVO;
import egovframework.com.sdtic.fecrs.service.fecEventVO;
import egovframework.com.sdtic.fecrs.service.fecSlpVO;



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
@Repository("fecTotlInsrTotDAO")
public class fecTotlInsrTotDAO extends TOTAbstractDAO {
   
    
    
    // 사면 데이터 가져오기 (통합 DB)
    @SuppressWarnings("unchecked")
    public List<fecSlpVO> fecGetSlp() throws Exception{
    	return (List<fecSlpVO>) list("fecTotlInsrTotDAO.fecGetSlp" , null);
    }    
    
    // 사면 장애 데이터 가져오기 (통합 DB)
    @SuppressWarnings("unchecked")
    public List<fecSlpVO> fecGetTroblSlp() throws Exception{
    	return (List<fecSlpVO>) list("fecTotlInsrTotDAO.fecGetTroblSlp" , null);
    }
    
    // 사면 이벤트 데이터 가져오기 (통합 DB)
    @SuppressWarnings("unchecked")
    public List<fecSlpVO> fecGetEventSlp(String param) throws Exception{
    	return (List<fecSlpVO>) list("fecTotlInsrTotDAO.fecGetEventSlp" , param);
    }
    
    // 	Mdt 이벤트 내용 및 좌표 조회
    @SuppressWarnings("unchecked")
    public List<fecEventVO> fecGetEventMdtAjax(FecSearchVO fecSearchVO) throws Exception{
    	return (List<fecEventVO>) list("fecTotlInsrTotDAO.fecGetEventMdtAjax", fecSearchVO);
    }
    
    // CCTV 목록 가져오기
    @SuppressWarnings("unchecked")
    public List<fecCctvVO> checkCCTV(String parameter) throws Exception{
    	return (List<fecCctvVO>) list("fecTotlInsrTotDAO.checkCCTV" , parameter);
    }
    
    // 	메인 현장센서 mdt 조회
    @SuppressWarnings("unchecked")
    public List<HashMap<String, String>> mainSptSensorMdt() throws Exception{
    	return (List<HashMap<String, String>>) list("fecTotlInsrTotDAO.mainSptSensorMdt" , null);
    }
    
    // 메인 본부별 현황 - mdt
    @SuppressWarnings("unchecked")
    public List<FecSptMapVO> fecSptMapMdtAjax(FecSearchVO fecSearchVO) throws Exception{
    	return (List<FecSptMapVO>) list("fecTotlInsrTotDAO.fecSptMapMdtAjax" , fecSearchVO);
    }
    
    // MDT 운행현황 금일전일 비교
    @SuppressWarnings("deprecation")
	public FecMDTOperVO fecMdtoperLv1Ajax(FecSearchVO fecSearchVO) throws Exception{
    	return (FecMDTOperVO) selectByPk("fecTotlInsrTotDAO.fecMdtoperLv1Ajax", fecSearchVO);
    }
    
    // MDT 운행현황 장애현황
    @SuppressWarnings("unchecked")
    public List<FecMDTOperVO> fecMdttroblLv1Ajax(FecSearchVO fecSearchVO) throws Exception{
    	return (List<FecMDTOperVO>) list("fecTotlInsrTotDAO.fecMdttroblLv1Ajax", fecSearchVO);
    }
    
    // MDT 운행현황 맵차트
    @SuppressWarnings("unchecked")
    public List<FecMDTOperVO> fecMdtmapLv1Ajax(FecSearchVO fecSearchVO) throws Exception{
    	return (List<FecMDTOperVO>) list("fecTotlInsrTotDAO.fecMdtmapLv1Ajax", fecSearchVO);
    }
    
}
