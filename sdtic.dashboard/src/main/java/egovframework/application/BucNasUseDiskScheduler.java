package egovframework.application;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import egovframework.com.sdtic.bucrs.service.BucCollectEsmVO;
import egovframework.com.sdtic.bucrs.service.BucCollectVO;
import egovframework.com.sdtic.bucrs.service.BucParamEsmVO;
import egovframework.com.sdtic.bucrs.service.impl.BucEsm241NasUseDiskDAO;
import egovframework.com.sdtic.bucrs.service.impl.BucEsm246NasUseDiskDAO;
import egovframework.com.sdtic.bucrs.service.impl.BucInstNasUseDiskDAO;
import egovframework.com.sdtic.bucrs.service.impl.BucNasUseDiskDAO;
import egovframework.com.sdtic.ifcrs.service.IfcColctVO;
import egovframework.com.sdtic.ifcrs.service.impl.IfcColctDAO;

@Component
public class BucNasUseDiskScheduler {
	
	@Autowired
	private BucNasUseDiskDAO bucNasUseDisk;
	
	@Autowired
	private BucInstNasUseDiskDAO bucInstNasUseDisk;
	
	@Autowired
	private BucEsm241NasUseDiskDAO bucEsm241NasUseDisk;
	
	@Autowired
	private BucEsm246NasUseDiskDAO bucEsm246NasUseDisk;
	
	@Autowired
	private IfcColctDAO ifcColct;
	
	@SuppressWarnings("deprecation")
	public void Execute() {
		
		backgroundInstanceClass appinstance = (backgroundInstanceClass)backgroundInstanceClass.getInstance();
	      if (appinstance.getExcute() == false)
	         return; 
		
		String realHostname = "";
		
		IfcColctVO ifcColctVO = new IfcColctVO();
		
		BucParamEsmVO bucParamEsmVO =  new BucParamEsmVO();
		
		try { 
			bucInstNasUseDisk.getSqlMapClient().startTransaction();
			bucInstNasUseDisk.getSqlMapClient().startBatch(); 
			
			int sqlInsertSuccess = 0;
			//int sqlUpdateSuccess = 0;
			
			System.out.println ("비즈니스 NAS 수집 시작");
			
			List<BucCollectVO> bucCollectVOList = null;
			try {
				bucCollectVOList = bucNasUseDisk.bucCollectNasUseDiskAjax();

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("SMS NAS DATA 데이터 조회 실패");
			}
			
			
			try {
				
				sqlInsertSuccess = bucInstNasUseDisk.bucInsertCollectDataAjax(bucCollectVOList);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("SMS NAS DATA 데이터 추가 실패");
			}
			
			
			List<BucCollectEsmVO> bucEsm241ColctList = null;
			try {
				
				ifcColctVO.setGubun("EMS_241");
				List<IfcColctVO> ifcRealHostList = ifcColct.ifcRealHostnameAjax(ifcColctVO);
				realHostname = "";
				
				for(int i=0;i<ifcRealHostList.size();i++){
					ifcColctVO = ifcRealHostList.get(i);
					if(i == 0){
						realHostname = realHostname + "'" + ifcColctVO.getReal_hostname() + "'";
					}else{
						realHostname = realHostname + ",'" + ifcColctVO.getReal_hostname() + "'";
					}
				}
				
				Calendar cal = Calendar.getInstance();
				SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
				String yyyymmddhh24miss = df.format(cal.getTime());
				cal.add(Calendar.DATE, -1);
				String yyyymmddhh24missBefore = df.format(cal.getTime());
				String yyyymmdd = yyyymmddhh24missBefore.substring(0,8);
				
				//System.out.println("cal.add(Calendar.DATE, -2) = " + yyyymmdd);
				//System.out.println ("ifcEsmVO.getReal_hostname(241)  : "+ifcEsmVO.getReal_hostname());

				bucParamEsmVO.setYyyymmdd(yyyymmdd);
				bucParamEsmVO.setRealhostname(realHostname);
				
				//List<IfcEsmVO> ifcEsm241ColctList = ifcEsm241.ifcEsm241ColctAjax(ifcEsmVO);
				
				bucEsm241ColctList = bucEsm241NasUseDisk.bucCollectEsm241NasUseDiskAjax(bucParamEsmVO);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("ESM241 NAS DATA 데이터 조회 실패");
			}
			
			try {
				
				sqlInsertSuccess = bucInstNasUseDisk.bucEsm241InsertCollectDataAjax(bucEsm241ColctList);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("ESM241 NAS DATA 데이터 추가 실패");
			}
			
			List<BucCollectEsmVO> bucEsm246ColctList = null;
			try {
				
				ifcColctVO.setGubun("EMS_246");
				List<IfcColctVO> ifcRealHostList = ifcColct.ifcRealHostnameAjax(ifcColctVO);
				realHostname = "";
				
				for(int i=0;i<ifcRealHostList.size();i++){
					ifcColctVO = ifcRealHostList.get(i);
					if(i == 0){
						realHostname = realHostname + "'" + ifcColctVO.getReal_hostname() + "'";
					}else{
						realHostname = realHostname + ",'" + ifcColctVO.getReal_hostname() + "'";
					}
				}
				
				Calendar cal = Calendar.getInstance();
				SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
				String yyyymmddhh24miss = df.format(cal.getTime());
				cal.add(Calendar.DATE, -1);
				String yyyymmddhh24missBefore = df.format(cal.getTime());
				String yyyymmdd = yyyymmddhh24missBefore.substring(0,8);
				
				//System.out.println("cal.add(Calendar.DATE, -2) = " + yyyymmdd);
				//System.out.println ("ifcEsmVO.getReal_hostname(241)  : "+ifcEsmVO.getReal_hostname());

				bucParamEsmVO.setYyyymmdd(yyyymmdd);
				bucParamEsmVO.setRealhostname(realHostname);
				
				//List<IfcEsmVO> ifcEsm241ColctList = ifcEsm241.ifcEsm241ColctAjax(ifcEsmVO);
				
				bucEsm246ColctList = bucEsm246NasUseDisk.BucCollectEsm246NasUseDiskAjax(bucParamEsmVO);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("ESM246 NAS DATA 데이터 조회 실패");
			}
			
			try {
				
				sqlInsertSuccess = bucInstNasUseDisk.bucEsm246InsertCollectDataAjax(bucEsm246ColctList);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println ("ESM246 NAS DATA 데이터 추가 실패");
			}


			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally { 
			
		}
		
		try {
			bucInstNasUseDisk.getSqlMapClient().executeBatch();
			bucInstNasUseDisk.getSqlMapClient().commitTransaction(); 
			bucInstNasUseDisk.getSqlMapClient().endTransaction();
		}
		catch(SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally{
		
			
		}
		
		System.out.println ("비즈니스 NAS 수집 끝");
		
	}
}