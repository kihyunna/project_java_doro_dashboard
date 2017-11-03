package egovframework.com.sdtic.fecrs.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.sdtic.fecrs.service.FecElctyFcltsVO;
import egovframework.com.sdtic.fecrs.service.FecElctyLampVO;
import egovframework.com.sdtic.fecrs.service.FecElctyTollgateVO;
import egovframework.com.sdtic.fecrs.service.FecElctyTunnelVO;
import egovframework.com.sdtic.fecrs.service.FecMDTOperVO;
import egovframework.com.sdtic.fecrs.service.FecMainMapVO;
import egovframework.com.sdtic.fecrs.service.FecPltwtrProcessVO;
import egovframework.com.sdtic.fecrs.service.FecSearchVO;
import egovframework.com.sdtic.fecrs.service.FecTunnelDetailVO;
import egovframework.com.sdtic.fecrs.service.FecSptMapVO;
import egovframework.com.sdtic.fecrs.service.FecSlopeVO;
import egovframework.com.sdtic.fecrs.service.fecEventVO;
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
@Repository("fecMainDAO")
public class fecMainDAO extends EgovComAbstractDAO {

    // 공통코드 리스트 조회
    @SuppressWarnings("unchecked")
    public List<fecMainVO> fecMainCodeListAjax(fecMainVO fecMainVO) throws Exception {
        return (List<fecMainVO>) list("fecMainDAO.fecMainCodeListAjax" , fecMainVO);
    }
    
    // MDT 운행현황 맵차트
    @SuppressWarnings("unchecked")
    public List<FecMainMapVO> fecMainMapLv1Ajax(FecSearchVO fecSearchVO) throws Exception{
    	return (List<FecMainMapVO>) list("FecMainmapDAO.fecMainmapLv1Ajax", fecSearchVO);
    }
    
    // 터널상세LV2 현황 차트
    @SuppressWarnings("unchecked")
    public List<FecTunnelDetailVO> fecTunnelDetailLv2Ajax(FecSearchVO fecSearchVO) throws Exception{
    	List<FecTunnelDetailVO> list = (List<FecTunnelDetailVO>) list("FecTunnelDetailDAO.fecTunnelDetailLv2Ajax", fecSearchVO);
    	                                                                
        return list;
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
    // 전기(터널)상세LV2
    @SuppressWarnings("unchecked")
    public List<FecElctyTunnelVO> fecElctyTunnelLv2Ajax(FecSearchVO fecSearchVO) throws Exception{
    	return (List<FecElctyTunnelVO>) list("FecElctyTunnelDAO.fecElctyTunnelLv2Ajax", fecSearchVO);
    }
    
    // 전기(영업소)상세LV2
    @SuppressWarnings("unchecked")
    public List<FecElctyTollgateVO> fecElctyTollgateLv2Ajax(FecSearchVO fecSearchVO) throws Exception{
    	return (List<FecElctyTollgateVO>) list("FecElctyTollgateDAO.fecElctyTollgateLv2Ajax", fecSearchVO);
    }
    
    // 전기(가로등/조명탑)상세LV2
    @SuppressWarnings("unchecked")
    public List<FecElctyLampVO> fecElctyLampLv2Ajax(FecSearchVO fecSearchVO) throws Exception{
    	return (List<FecElctyLampVO>) list("FecElctyLampDAO.fecElctyLampLv2Ajax", fecSearchVO);
    }
    
    // 사면 상세LV2
    @SuppressWarnings("unchecked")
    public List<FecSlopeVO> fecSlopeLv2Ajax(FecSearchVO fecSearchVO) throws Exception{
    	return (List<FecSlopeVO>) list("FecSlopeDAO.fecSlopeLv2Ajax", fecSearchVO);
    }
    
    // 메인 본부별 현황
    @SuppressWarnings("unchecked")
    public List<FecSptMapVO> fecSptMapAjax(FecSearchVO fecSearchVO) throws Exception{
    	return (List<FecSptMapVO>) list("FecSptMapVO.fecSptMapAjax", fecSearchVO);
    }
    
    // 부서 좌표 가져오기
    @SuppressWarnings("unchecked")
	public List<FecSearchVO> fecGetDeptAjax(FecSearchVO fecSearchVO) throws Exception{
    	return (List<FecSearchVO>) list("FecMainmapDAO.fecGetDeptAjax", fecSearchVO);
    }    
    
    // 	터널 이벤트 내용 및 좌표 조회
    @SuppressWarnings("unchecked")
    public List<fecEventVO> fecGetEventTunnelAjax(FecSearchVO fecSearchVO) throws Exception{
    	return (List<fecEventVO>) list("FecMainmapDAO.fecGetEventTunnelAjax", fecSearchVO);
    }
    
    // 	전기 이벤트 내용 및 좌표 조회
    @SuppressWarnings("unchecked")
    public List<fecEventVO> fecGetEventElctsAjax(FecSearchVO fecSearchVO) throws Exception{
    	return (List<fecEventVO>) list("FecMainmapDAO.fecGetEventElctsAjax", fecSearchVO);
    }
    
    // 	오수 이벤트 내용 및 좌표 조회
    @SuppressWarnings("unchecked")
    public List<fecEventVO> fecGetEventSvarAjax(FecSearchVO fecSearchVO) throws Exception{
    	return (List<fecEventVO>) list("FecMainmapDAO.fecGetEventSvarAjax", fecSearchVO);
    }
    
    // 	사면 이벤트 내용 및 좌표 조회
    @SuppressWarnings("unchecked")
    public List<fecEventVO> fecGetEventSlopeAjax(FecSearchVO fecSearchVO) throws Exception{
    	return (List<fecEventVO>) list("FecMainmapDAO.fecGetEventSlopeAjax", fecSearchVO);
    }
    
    // 	Cctv 이벤트 내용 및 좌표 조회
    @SuppressWarnings("unchecked")
    public List<fecEventVO> fecGetEventCctvAjax(FecSearchVO fecSearchVO) throws Exception{
    	return (List<fecEventVO>) list("FecMainmapDAO.fecGetEventCctvAjax", fecSearchVO);
    }
    
    // 	지도 본부 선택 지사 코드 가져오기
    @SuppressWarnings("unchecked")
    public List<HashMap<String, String>> fecJisaCodeAjax(FecSearchVO fecSearchVO) throws Exception{
    	return (List<HashMap<String, String>>) list("FecMainmapDAO.fecJisaCodeAjax", fecSearchVO);
    }
    
    // 	이벤트 리스트 조회
    @SuppressWarnings("unchecked")
    public List<fecEventVO> FecEventListLv2(FecSearchVO fecSearchVO) throws Exception{
    	return (List<fecEventVO>) list("FecMainmapDAO.FecEventListLv2", fecSearchVO);
    }
    
    // 	메인 현장센서 시설물 리스트 조회
    @SuppressWarnings("unchecked")
    public List<HashMap<String, String>> mainSptSensor() throws Exception{
    	return (List<HashMap<String, String>>) list("FecMainmapDAO.mainSptSensor", null);
    }
    
    // 가동현황 1레벨
    @SuppressWarnings("unchecked")
    public List<HashMap<String, String>> fecSptEqpOprCstsLv1(FecSearchVO fecSearchVO) throws Exception{
    	return (List<HashMap<String, String>>) list("FecMainmapDAO.fecSptEqpOprCstsLv1", fecSearchVO);
    }
    
    // 장애/조치 1레벨
    @SuppressWarnings("unchecked")
    public List<HashMap<String, String>> fecAreclTroblOccrrncManagtLv1(FecSearchVO fecSearchVO) throws Exception{
    	return (List<HashMap<String, String>>) list("FecMainmapDAO.fecAreclTroblOccrrncManagtLv1", fecSearchVO);
    }
    
    // 장애/조치 2레벨
    @SuppressWarnings("unchecked")
    public List<HashMap<String, String>> fecPsctnTroblOccrrncManagtLv2(FecSearchVO fecSearchVO) throws Exception{
    	return (List<HashMap<String, String>>) list("FecMainmapDAO.fecPsctnTroblOccrrncManagtLv2", fecSearchVO);
    }
    
}
