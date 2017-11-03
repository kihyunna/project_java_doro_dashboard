package egovframework.com.sdtic.fecrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.sdtic.fecrs.service.FecPwrerUsgqtyVO;
import egovframework.com.sdtic.fecrs.service.FecBrineVO;
import egovframework.com.sdtic.fecrs.service.FecSearchVO;
import egovframework.com.sdtic.fecrs.service.mainSptIOTVO;



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
@Repository("fecIotMainDAO")
public class fecIotMainDAO extends IOTAbstractDAO {	
        
    // 전력사용량LV1
    @SuppressWarnings("unchecked")
    public List<FecPwrerUsgqtyVO> fecPwrerUsgqtyLv1Ajax(FecSearchVO fecSearchVO) throws Exception{
    	return (List<FecPwrerUsgqtyVO>) list("FecPwrerUsgqtyDAO.fecPwrerUsgqtyLv1Ajax", fecSearchVO);
    }
    
    // 염수분사 상세LV2
    @SuppressWarnings("unchecked")
    public List<FecBrineVO> fecBrineLv2Ajax(FecSearchVO fecSearchVO) throws Exception{
    	return (List<FecBrineVO>) list("FecBrineDAO.fecBrineLv2Ajax", fecSearchVO);
    }
    
    // 메인 대시보드 IOT
    @SuppressWarnings("unchecked")
    public List<mainSptIOTVO> mainSptIOTAjax(FecSearchVO fecSearchVO) throws Exception{
    	return (List<mainSptIOTVO>) list("mainSptIOTDAO.mainSptIOTAjax", fecSearchVO);
    }

}
