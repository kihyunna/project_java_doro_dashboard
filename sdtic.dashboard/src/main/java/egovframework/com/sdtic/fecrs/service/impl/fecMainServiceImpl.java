package egovframework.com.sdtic.fecrs.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.com.sdtic.fecrs.service.FecBrineVO;
import egovframework.com.sdtic.fecrs.service.FecElctyFcltsVO;
import egovframework.com.sdtic.fecrs.service.FecElctyLampVO;
import egovframework.com.sdtic.fecrs.service.FecElctyTollgateVO;
import egovframework.com.sdtic.fecrs.service.FecElctyTunnelVO;
import egovframework.com.sdtic.fecrs.service.FecMDTOperVO;
import egovframework.com.sdtic.fecrs.service.FecMainMapVO;
import egovframework.com.sdtic.fecrs.service.FecPltwtrProcessVO;
import egovframework.com.sdtic.fecrs.service.FecPwrerUsgqtyVO;
import egovframework.com.sdtic.fecrs.service.FecSearchVO;
import egovframework.com.sdtic.fecrs.service.FecSlopeVO;
import egovframework.com.sdtic.fecrs.service.FecTunnelDetailVO;
import egovframework.com.sdtic.fecrs.service.FecSptMapVO;
import egovframework.com.sdtic.fecrs.service.fecEventVO;
import egovframework.com.sdtic.fecrs.service.fecMainService;
import egovframework.com.sdtic.fecrs.service.fecMainVO;
import egovframework.com.sdtic.fecrs.service.mainSptIOTVO;
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
@Service("fecMainService")
public class fecMainServiceImpl extends EgovAbstractServiceImpl implements fecMainService {

    private static final Logger LOGGER = LoggerFactory.getLogger(fecMainServiceImpl.class);

    /** CommonDAO */
    // TODO ibatis 사용
    @Resource(name="fecMainDAO") private fecMainDAO fecMainDAO;
    @Resource(name="fecTotlInsrDAO") private fecTotlInsrDAO fecTotlInsr;
    @Resource(name="fecIotMainDAO") private fecIotMainDAO fecIotMain;
    @Resource(name="fecTotlInsrTotDAO") private fecTotlInsrTotDAO fecTotlInsrTot;
    
    // 공통코드 리스트 조회
    @Override
    public List<fecMainVO> fecMainCodeListAjax(fecMainVO fecMainVO) throws Exception {
        return fecMainDAO.fecMainCodeListAjax(fecMainVO);
    }
    
    // MDT 운행현황 금일전일 비교
    @Override
    public FecMDTOperVO fecMdtoperLv1Ajax(FecSearchVO fecSearchVO) throws Exception{
        //return fecMainMariaDAO.fecMdtoperLv1Ajax(fecSearchVO);
    	return fecTotlInsrTot.fecMdtoperLv1Ajax(fecSearchVO);
    }
    
    // MDT 운행현황 장애현황
    @Override
    public List<FecMDTOperVO> fecMdttroblLv1Ajax(FecSearchVO fecSearchVO) throws Exception{
        return fecTotlInsrTot.fecMdttroblLv1Ajax(fecSearchVO);
    }
    
    // MDT 운행현황 맵차트
    @Override
    public List<FecMDTOperVO> fecMdtmapLv1Ajax(FecSearchVO fecSearchVO) throws Exception{
        return fecTotlInsrTot.fecMdtmapLv1Ajax(fecSearchVO);
    }
    
    // MAP 현장설비 아이콘 표시
    @Override
    public List<FecMainMapVO> fecMainMapLv1Ajax(FecSearchVO fecSearchVO) throws Exception{
        return fecMainDAO.fecMainMapLv1Ajax(fecSearchVO);
    }
    
    // 터널상세LV2 장애 max seq 가져오기(관제DB)
    public String fecGetTunnelDetailLv2Seq() throws Exception{
    	String max_Dstbxseq = "0";
        try {
        	max_Dstbxseq = fecTotlInsr.fecGetTroblTunnelMaxSeq();
        	if (max_Dstbxseq == null)
        		max_Dstbxseq = "1";
    	} catch (Exception e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();    		  	
    	}
        String.valueOf(Integer.parseInt(max_Dstbxseq) - 1);
        
        return String.valueOf(Integer.parseInt(max_Dstbxseq) - 1);
    }
    
    // 터널상세LV2 현황 차트
    @Override
    public List<FecTunnelDetailVO> fecTunnelDetailLv2Ajax(FecSearchVO fecSearchVO) throws Exception{
    	List<FecTunnelDetailVO> list = fecMainDAO.fecTunnelDetailLv2Ajax(fecSearchVO); 
        return list;
    }
    
    // 전기 시설물LV2 차트
    @Override
    public List<FecElctyFcltsVO> fecElctyFcltsLv2Ajax(FecSearchVO fecSearchVO) throws Exception{
        return fecMainDAO.fecElctyFcltsLv2Ajax(fecSearchVO);
    }
    
    // 오수처리상세LV2 장애 max seq 가져오기(관제DB)
    public String fecGetPltwtrProcessLv2Seq() throws Exception{
    	String max_Dstbxseq = "0";
        try {
        	max_Dstbxseq = fecTotlInsr.fecGetTroblMaxSeq();
        	if (max_Dstbxseq == null)
        		max_Dstbxseq = "1";
    	} catch (Exception e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();    		  	
    	}
        String.valueOf(Integer.parseInt(max_Dstbxseq) - 1);
        
        return String.valueOf(Integer.parseInt(max_Dstbxseq) - 1);
    }
    
    // 오수처리상세LV2
    @Override
    public List<FecPltwtrProcessVO> fecPltwtrProcessLv2Ajax(FecSearchVO fecSearchVO) throws Exception{
        return fecMainDAO.fecPltwtrProcessLv2Ajax(fecSearchVO);
    }
    
    // 전기(영업소) 장애 max seq 가져오기(관제DB)
    public String fecGetElctyTunnelLv2Seq() throws Exception{
    	String max_Dstbxseq = "0";
        try {
        	max_Dstbxseq = fecTotlInsr.fecGetTroblElrmMaxSeq();
        	if (max_Dstbxseq == null)
        		max_Dstbxseq = "1";
    	} catch (Exception e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();    		  	
    	}
        String.valueOf(Integer.parseInt(max_Dstbxseq) - 1);
        
        return String.valueOf(Integer.parseInt(max_Dstbxseq) - 1);
    }
    
    // 전기(터널)상세LV2
    @Override
    public List<FecElctyTunnelVO> fecElctyTunnelLv2Ajax(FecSearchVO fecSearchVO) throws Exception{
        return fecMainDAO.fecElctyTunnelLv2Ajax(fecSearchVO);
    }
    
    // 전기(터널) 장애 max seq 가져오기(관제DB)
    public String fecGetElctyTollgateLv2Seq() throws Exception{
    	String max_Dstbxseq = "0";
        try {
        	max_Dstbxseq = fecTotlInsr.fecGetTroblElrmMaxSeq();
        	if (max_Dstbxseq == null)
        		max_Dstbxseq = "1";
    	} catch (Exception e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();    		  	
    	}
        String.valueOf(Integer.parseInt(max_Dstbxseq) - 1);
        
        return String.valueOf(Integer.parseInt(max_Dstbxseq) - 1);
    }
    
    // 전기(영업소)상세LV2
    @Override
    public List<FecElctyTollgateVO> fecElctyTollgateLv2Ajax(FecSearchVO fecSearchVO) throws Exception{
        return fecMainDAO.fecElctyTollgateLv2Ajax(fecSearchVO);
    }
    
    // 전기(가로등/조명탑) 장애 max seq 가져오기(관제DB)
    public String fecGetElctyLampLv2Seq() throws Exception{
    	String max_Dstbxseq = "0";
        try {
        	max_Dstbxseq = fecTotlInsr.fecGetTroblDstbxMaxSeq();
        	if (max_Dstbxseq == null)
        		max_Dstbxseq = "1";
    	} catch (Exception e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();    		  	
    	}
        String.valueOf(Integer.parseInt(max_Dstbxseq) - 1);
        
        return String.valueOf(Integer.parseInt(max_Dstbxseq) - 1);
    }
    
    // 전기(가로등/조명탑)상세LV2
    @Override
    public List<FecElctyLampVO> fecElctyLampLv2Ajax(FecSearchVO fecSearchVO) throws Exception{
        return fecMainDAO.fecElctyLampLv2Ajax(fecSearchVO);
    }
    
    // 전력사용량LV1
    @Override
    public List<FecPwrerUsgqtyVO> fecPwrerUsgqtyLv1Ajax(FecSearchVO fecSearchVO) throws Exception{
        return fecIotMain.fecPwrerUsgqtyLv1Ajax(fecSearchVO);
    }
    
    // 메인 대시보드 IOT
    @Override
    public List<mainSptIOTVO> mainSptIOTAjax(FecSearchVO fecSearchVO) throws Exception{
        return fecIotMain.mainSptIOTAjax(fecSearchVO);
    }
    
    // 부서 좌표 가져오기
    @Override
    public List<FecSearchVO> fecGetDeptAjax(FecSearchVO fecSearchVO) throws Exception{
        return fecMainDAO.fecGetDeptAjax(fecSearchVO);
    }
    
    // 	터널 이벤트 내용 및 좌표 조회
    @Override
    public List<fecEventVO> fecGetEventTunnelAjax(FecSearchVO fecSearchVO) throws Exception{
        return fecMainDAO.fecGetEventTunnelAjax(fecSearchVO);
    }
    
    // 	전기 이벤트 내용 및 좌표 조회
    @Override
    public List<fecEventVO> fecGetEventElctsAjax(FecSearchVO fecSearchVO) throws Exception{
        return fecMainDAO.fecGetEventElctsAjax(fecSearchVO);
    }
    
    // 	오수 이벤트 내용 및 좌표 조회
    @Override
    public List<fecEventVO> fecGetEventSvarAjax(FecSearchVO fecSearchVO) throws Exception{
        return fecMainDAO.fecGetEventSvarAjax(fecSearchVO);
    }
    
    // 	사면 이벤트 내용 및 좌표 조회
    @Override
    public List<fecEventVO> fecGetEventSlopeAjax(FecSearchVO fecSearchVO) throws Exception{
        return fecMainDAO.fecGetEventSlopeAjax(fecSearchVO);
    }
    
    // 	Cctv 이벤트 내용 및 좌표 조회
    @Override
    public List<fecEventVO> fecGetEventCctvAjax(FecSearchVO fecSearchVO) throws Exception{
        return fecMainDAO.fecGetEventCctvAjax(fecSearchVO);
    }
    
    // 	Mdt 이벤트 내용 및 좌표 조회
    @Override
    public List<fecEventVO> fecGetEventMdtAjax(FecSearchVO fecSearchVO) throws Exception{
        return fecTotlInsrTot.fecGetEventMdtAjax(fecSearchVO);
    }
    
    // 	지도 본부 선택 지사 코드 가져오기
    @Override
    public List<HashMap<String, String>> fecJisaCodeAjax(FecSearchVO fecSearchVO) throws Exception{
        return fecMainDAO.fecJisaCodeAjax(fecSearchVO);
    }
    
    // 	이벤트 리스트 조회
    @Override
    public List<fecEventVO> FecEventListLv2(FecSearchVO fecSearchVO) throws Exception{
        return fecMainDAO.FecEventListLv2(fecSearchVO);
    }
    
    // 	메인 현장센서 시설물 리스트 조회
    @Override
    public List<HashMap<String, String>> mainSptSensor() throws Exception{
        return fecMainDAO.mainSptSensor();
    }
   
    
    // 염수상세LV2
    @Override
    public List<FecBrineVO> fecBrineLv2Ajax(FecSearchVO fecSearchVO) throws Exception{
        return fecIotMain.fecBrineLv2Ajax(fecSearchVO);
    }
    
    // 사면상세 max seq 가져오기(관제DB)
    public String fecGetSlopeLv2Seq() throws Exception{
    	String max_Dstbxseq = "0";
        try {
        	max_Dstbxseq = fecTotlInsr.fecGetTroblSlpMaxSeq();
        	if (max_Dstbxseq == null)
        		max_Dstbxseq = "1";
    	} catch (Exception e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();    		  	
    	}
        String.valueOf(Integer.parseInt(max_Dstbxseq) - 1);
        
        return String.valueOf(Integer.parseInt(max_Dstbxseq) - 1);
    }
    
    // 사면상세LV2
    @Override
    public List<FecSlopeVO> fecSlopeLv2Ajax(FecSearchVO fecSearchVO) throws Exception{
        return fecMainDAO.fecSlopeLv2Ajax(fecSearchVO);
    }

    // 가동현황 1레벨
    @Override
    public List<HashMap<String, String>> fecSptEqpOprCstsLv1(FecSearchVO fecSearchVO) throws Exception{
        return fecMainDAO.fecSptEqpOprCstsLv1(fecSearchVO);
    }
    
    // 장애/조치 1레벨
    @Override
    public List<HashMap<String, String>> fecAreclTroblOccrrncManagtLv1(FecSearchVO fecSearchVO) throws Exception{
        return fecMainDAO.fecAreclTroblOccrrncManagtLv1(fecSearchVO);
    }   
    
    // 장애/조치 2레벨
    @Override
    public List<HashMap<String, String>> fecPsctnTroblOccrrncManagtLv2(FecSearchVO fecSearchVO) throws Exception{
        return fecMainDAO.fecPsctnTroblOccrrncManagtLv2(fecSearchVO);
    }  
    
    // 메인 본부별 현황
    @Override
    public List<FecSptMapVO> fecSptMapAjax(FecSearchVO fecSearchVO) throws Exception{
        return fecMainDAO.fecSptMapAjax(fecSearchVO);
    }
    
    // 	메인 현장센서 mdt 조회
    @Override
    public List<HashMap<String, String>> mainSptSensorMdt() throws Exception{
        return fecTotlInsrTot.mainSptSensorMdt();
    }
    
    // 메인 본부별 현황 - mdt
    @Override
    public List<FecSptMapVO> fecSptMapMdtAjax(FecSearchVO fecSearchVO) throws Exception{
        return fecTotlInsrTot.fecSptMapMdtAjax(fecSearchVO);
    }
}