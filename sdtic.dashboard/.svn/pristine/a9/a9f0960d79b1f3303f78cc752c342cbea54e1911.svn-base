package egovframework.com.sdtic.bucrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.sdtic.bucrs.service.BucFcltsVO;
import egovframework.com.sdtic.bucrs.service.bucMainVO;
import egovframework.com.sdtic.fecrs.service.impl.FacDBAbstractDAO;

 /**
 * @Class Name :  BucCmmnDAO.java
 * @Description : BucCmmnDAO Class
 * @Modification Information
 * @
 * @ 수정일          수정자                       수정내용
 * @ -----------   ---------   -------------------------------
 * @ 2017. 06. 01    jkheo                        최초생성
 *
 * @author
 * @since
 * @version 1.0
 * @see
 *
 */
@Repository("bucFercilityDAO")
public class BucFercilityDAO extends FacDBAbstractDAO {
    
    // 비즈니스 공통 전력량추이 및 한전전기요금 DB연동 화면
    @SuppressWarnings("unchecked")
    public List<bucMainVO> bucMainElctyUsedbAjax(bucMainVO bucMainVO) throws Exception {
        return (List<bucMainVO>) list("bucFercilityDAO.bucMainElctyUsedbAjax" , bucMainVO);
    }
    
    // 비즈니스 시설물 오수 유입방출 DB연동 화면
    @SuppressWarnings("unchecked")
    public List<BucFcltsVO> bucFcltsPollutedWaterdbAjax(BucFcltsVO bucFcltsVO) throws Exception {
        return (List<BucFcltsVO>) list("bucFercilityDAO.bucFcltsPollutedWaterdbAjax" , bucFcltsVO);
    }
}
