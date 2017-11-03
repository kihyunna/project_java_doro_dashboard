package egovframework.com.sdtic.bucrs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.sdtic.bucrs.service.BucCollectEsmVO;
import egovframework.com.sdtic.bucrs.service.BucCollectVO;
import egovframework.com.sdtic.fecrs.service.fecTunnelVO;

 /**
 * @Class Name :  ifcMainDAO.java
 * @Description : ifcMainDAO Class
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
@Repository("bucInstNasUseDiskDAO")
public class BucInstNasUseDiskDAO extends EgovComAbstractDAO {

    //수집 SMS insert
    public int bucInsertCollectDataAjax(List<BucCollectVO> param) throws Exception {
    	
    	try { 
			for ( int i =0;i<param.size();i++){
				BucCollectVO vo = param.get(i);
	    		this.getSqlMapClient().insert("bucInstNasUseDiskDAO.bucInsertCollectDataAjax", vo);
	    	}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println ("SMS NAS 데이터 추가 실패");
			return 0;
		}     	
    	return 1;
    	
    }
    
    //수집 ESM241 insert
    public int bucEsm241InsertCollectDataAjax(List<BucCollectEsmVO> param) throws Exception {
    	
    	try { 
			for ( int i =0;i<param.size();i++){
				BucCollectEsmVO vo = param.get(i);
	    		this.getSqlMapClient().insert("bucInstNasUseDiskDAO.bucEsm241InsertCollectDataAjax", vo);
	    	}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println ("ESM241 NAS 데이터 추가 실패");
			return 0;
		}     	
    	return 1;
    	
    }
    
  //수집 ESM246 insert
    public int bucEsm246InsertCollectDataAjax(List<BucCollectEsmVO> param) throws Exception {
    	
    	try { 
			for ( int i =0;i<param.size();i++){
				BucCollectEsmVO vo = param.get(i);
	    		this.getSqlMapClient().insert("bucInstNasUseDiskDAO.bucEsm246InsertCollectDataAjax", vo);
	    	}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println ("ESM246 NAS 데이터 추가 실패");
			return 0;
		}     	
    	return 1;
    	
    }
}


