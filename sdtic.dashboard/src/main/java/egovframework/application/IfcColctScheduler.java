package egovframework.application;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import egovframework.com.sdtic.ifcrs.service.IfcColctVO;
import egovframework.com.sdtic.ifcrs.service.IfcEsmVO;
import egovframework.com.sdtic.ifcrs.service.IfcSmsVO;
import egovframework.com.sdtic.ifcrs.service.IfcSptColctVO;
import egovframework.com.sdtic.ifcrs.service.IfcSptVO;
import egovframework.com.sdtic.ifcrs.service.IfcTofacVO;
import egovframework.com.sdtic.ifcrs.service.IfcTroblVO;
import egovframework.com.sdtic.ifcrs.service.impl.IfcColctDAO;
import egovframework.com.sdtic.ifcrs.service.impl.IfcEsm241DAO;
import egovframework.com.sdtic.ifcrs.service.impl.IfcEsm246DAO;
import egovframework.com.sdtic.ifcrs.service.impl.IfcSmsDAO;
import egovframework.com.sdtic.ifcrs.service.impl.IfcSptColctDAO;
import egovframework.com.sdtic.ifcrs.service.impl.IfcSptDAO;
import egovframework.com.sdtic.ifcrs.service.impl.IfcTofacDAO;
import egovframework.com.sdtic.ifcrs.service.impl.IfcTroblDAO;
import egovframework.com.sdtic.main.service.MainCmmnVO;
import egovframework.com.sdtic.main.service.impl.MainCmmnDAO;
import egovframework.com.sdtic.main.service.impl.MainCmmnMysqlDAO;

@Component
public class IfcColctScheduler{
	
	@Autowired
	private IfcColctDAO ifcColct;
	
	@Autowired
	private IfcSmsDAO ifcSms;
	
	@Autowired
	private IfcEsm241DAO ifcEsm241;
	
	@Autowired
	private IfcEsm246DAO ifcEsm246;
	
	@Autowired
	private IfcTofacDAO ifcTofac;
	
	@Autowired
	private IfcTroblDAO ifcTrobl;
	
	@Autowired
	private MainCmmnDAO mainCmmn;
	
	@Autowired
	private MainCmmnMysqlDAO mainCmmnMysql;
	
	@Autowired
	private IfcSptDAO ifcSpt;
	
	@Autowired
	private IfcSptColctDAO ifcSptColct;
	
	@SuppressWarnings("deprecation")
	public void Execute()  {
		backgroundInstanceClass appinstance = (backgroundInstanceClass)backgroundInstanceClass.getInstance();
	    if(appinstance.getExcute() == false){
	    	return; 
	    }
	      
		System.out.println ("인프라 수집 시작");		
		
		int sqlInsertSuccess = 0;
		int sqlUpdateSuccess = 0;
		
		boolean isSMS = true;	//SMS발송 여부 - 개발용(운영시 true로 변경)
		
		//=================================수집==========================================
		IfcColctVO ifcColctVO = new IfcColctVO();
		IfcSmsVO ifcSmsVO = new IfcSmsVO();
		IfcEsmVO ifcEsmVO = new IfcEsmVO();
		IfcTofacVO ifcTofacVO = new IfcTofacVO();
		IfcTroblVO ifcTroblVO = new IfcTroblVO();
		MainCmmnVO mainVO = new MainCmmnVO();
		MainCmmnVO mainCmmnVO = new MainCmmnVO();
		MainCmmnVO mainSmsVO = new MainCmmnVO();
		IfcSptVO ifcSptVO = new IfcSptVO();
		IfcSptColctVO ifcSptColctVO = new IfcSptColctVO();
		
		String realHostname = "";
		
		//SMS 수집
		try {
			ifcColctVO.setGubun("SMS");
			List<IfcColctVO> ifcRealHostList = ifcColct.ifcRealHostnameAjax(ifcColctVO);
			
			for(int i=0;i<ifcRealHostList.size();i++){
				ifcColctVO = ifcRealHostList.get(i);
				if(i == 0){
					realHostname = realHostname + "'" + ifcColctVO.getReal_hostname() + "'";
				}else{
					realHostname = realHostname + ",'" + ifcColctVO.getReal_hostname() + "'";
				}
			}
			
			ifcSmsVO.setReal_hostname(realHostname);
			System.out.println ("ifcSmsVO.getReal_hostname  : "+ifcSmsVO.getReal_hostname());
			
			List<IfcSmsVO> ifcSmsColctList = ifcSms.ifcSmsColctAjax(ifcSmsVO);
			
			for(int i=0;i<ifcSmsColctList.size();i++){
				ifcSmsVO = ifcSmsColctList.get(i);
				
				ifcColctVO = new IfcColctVO();
				ifcColctVO.setHostname(ifcSmsVO.getHostname());
				ifcColctVO.setCpu(ifcSmsVO.getCpu());
				ifcColctVO.setDisk(ifcSmsVO.getDisk());
				ifcColctVO.setMem(ifcSmsVO.getMem());
				ifcColctVO.setNetio(ifcSmsVO.getNetio());
				ifcColctVO.setNeterr(ifcSmsVO.getNeterr());
				ifcColctVO.setEtc1(ifcSmsVO.getEtc1());
				ifcColctVO.setEtc2(ifcSmsVO.getEtc2());
				ifcColctVO.setEtc3(ifcSmsVO.getEtc3());
				ifcColctVO.setInst_date(ifcSmsVO.getInst_date());
				
				ifcColct.ifcAddColctAjax(ifcColctVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println ("인프라 SMS 가져오기 에러발생");	
		} finally{
			
		} 
		
		//ESM 수집(241)
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
			cal.add(Calendar.MINUTE, -2);
			String yyyymmddhh24missBefore =df.format(cal.getTime());
			String yyyymmdd = yyyymmddhh24miss.substring(0,8);
			
			ifcEsmVO.setReal_hostname(realHostname);
			ifcEsmVO.setYyyymmdd(yyyymmdd);
			ifcEsmVO.setYyyymmddhh24missBefore(yyyymmddhh24missBefore);
			ifcEsmVO.setYyyymmddhh24miss(yyyymmddhh24miss);
			System.out.println ("ifcEsmVO.getReal_hostname(241)  : "+ifcEsmVO.getReal_hostname());
			
			List<IfcEsmVO> ifcEsm241ColctList = ifcEsm241.ifcEsm241ColctAjax(ifcEsmVO);
			
			for(int i=0;i<ifcEsm241ColctList.size();i++){
				ifcEsmVO = ifcEsm241ColctList.get(i);
				
				ifcColctVO = new IfcColctVO();
				ifcColctVO.setHostname(ifcEsmVO.getHostname());
				ifcColctVO.setCpu(ifcEsmVO.getCpu());
				ifcColctVO.setDisk(ifcEsmVO.getDisk());
				ifcColctVO.setMem(ifcEsmVO.getMem());
				ifcColctVO.setNetio(ifcEsmVO.getNetio());
				ifcColctVO.setNeterr(ifcEsmVO.getNeterr());
				ifcColctVO.setEtc1(ifcEsmVO.getEtc1());
				ifcColctVO.setEtc2(ifcEsmVO.getEtc2());
				ifcColctVO.setEtc3(ifcEsmVO.getEtc3());
				ifcColctVO.setInst_date(ifcEsmVO.getInst_date());
				
				ifcColct.ifcAddColctAjax(ifcColctVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println ("인프라 ESM(241) 가져오기 에러발생");	
		} finally{
			
		}
		
		//ESM 수집(246)
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
			cal.add(Calendar.MINUTE, -2);
			String yyyymmddhh24missBefore =df.format(cal.getTime());
			String yyyymmdd = yyyymmddhh24miss.substring(0,8);
			
			ifcEsmVO.setReal_hostname(realHostname);
			ifcEsmVO.setYyyymmdd(yyyymmdd);
			ifcEsmVO.setYyyymmddhh24missBefore(yyyymmddhh24missBefore);
			ifcEsmVO.setYyyymmddhh24miss(yyyymmddhh24miss);
			System.out.println ("ifcEsmVO.getReal_hostname(246)  : "+ifcEsmVO.getReal_hostname());
			
			List<IfcEsmVO> ifcEsm246ColctList = ifcEsm246.ifcEsm246ColctAjax(ifcEsmVO);
			
			for(int i=0;i<ifcEsm246ColctList.size();i++){
				ifcEsmVO = ifcEsm246ColctList.get(i);
				
				ifcColctVO = new IfcColctVO();
				ifcColctVO.setHostname(ifcEsmVO.getHostname());
				ifcColctVO.setCpu(ifcEsmVO.getCpu());
				ifcColctVO.setDisk(ifcEsmVO.getDisk());
				ifcColctVO.setMem(ifcEsmVO.getMem());
				ifcColctVO.setNetio(ifcEsmVO.getNetio());
				ifcColctVO.setNeterr(ifcEsmVO.getNeterr());
				ifcColctVO.setEtc1(ifcEsmVO.getEtc1());
				ifcColctVO.setEtc2(ifcEsmVO.getEtc2());
				ifcColctVO.setEtc3(ifcEsmVO.getEtc3());
				ifcColctVO.setInst_date(ifcEsmVO.getInst_date());
				
				ifcColct.ifcAddColctAjax(ifcColctVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println ("인프라 ESM(246) 가져오기 에러발생");	
		} finally{
			
		}
		
		//컨테이너 에러 로그 수집
		try {
			List<IfcTofacVO> ifcConErrLogColctList = ifcTofac.ifcConErrLogColctAjax(ifcTofacVO);
			
			for(int i=0;i<ifcConErrLogColctList.size();i++){
				ifcTofacVO = ifcConErrLogColctList.get(i);
				
				ifcColctVO = new IfcColctVO();
				ifcColctVO.setHostname(ifcTofacVO.getHostname());
				ifcColctVO.setCon(ifcTofacVO.getCon());
				ifcColctVO.setErr_log_cnt(ifcTofacVO.getErr_log_cnt());
				ifcColctVO.setInst_date(ifcTofacVO.getInst_date());
				
				ifcColct.ifcAddConColctAjax(ifcColctVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println ("컨테이너 에러 로그 가져오기 에러발생");	
		} finally{
			
		}
		
		//터널 현장중계 수집
		try {
			List<IfcSptColctVO> ifcSptTnlServerList = ifcSptColct.ifcSptTnlServerAjax(ifcSptColctVO);
			
			for(int i=0;i<ifcSptTnlServerList.size();i++){
				ifcSptColctVO = ifcSptTnlServerList.get(i);
				
				//수집테이블에 저장
				ifcSptVO = new IfcSptVO();
				ifcSptVO.setGubun(ifcSptColctVO.getGubun());
				ifcSptVO.setGroup1(ifcSptColctVO.getGroup1());
				ifcSptVO.setGroup2(ifcSptColctVO.getGroup2());
				ifcSptVO.setCpu(ifcSptColctVO.getCpu());
				ifcSptVO.setMemory(ifcSptColctVO.getMemory());
				ifcSptVO.setDisk(ifcSptColctVO.getDisk());
				ifcSptVO.setProcess(ifcSptColctVO.getProcess());
				ifcSptVO.setGroup1_name(ifcSptColctVO.getGroup1_name());
				ifcSptVO.setGroup2_name(ifcSptColctVO.getGroup2_name());
				ifcSptVO.setInst_date(ifcSptColctVO.getInst_date());
				
				ifcSpt.ifcAddSptColctAjax(ifcSptVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println ("터널 현장중계 수집 에러발생");	
		} finally{
			
		} 

 	    System.out.println ("인프라 수집 끝");	
 	    
		
 	    //장애 수집
 	    
 	    //장애수집등급 가져오기
		List<MainCmmnVO> mainCmmnUseCycleManageList = null;
		
		try {
			mainCmmnUseCycleManageList = mainCmmn.mainCmmnUseCycleManageAjax(mainVO);
		} catch (Exception e) {
 			e.printStackTrace();
 			System.out.println ("장애수집등급 가져오기 에러발생");	
 		} finally{
			
		}
		
 	    //장애수집등급별로 장애수집
		
		//위젯에러상태 초기화
		/* 감독관 요청으로 제거 */
 	    /*
    	AppSendToUxp appSendToUxpInit = new AppSendToUxp();
		appSendToUxpInit.SendDatatoUXP("ifcAllClear");
		*/
		
 	    for(int i=0;i<mainCmmnUseCycleManageList.size();i++){
 	    	mainVO = mainCmmnUseCycleManageList.get(i);
 	    	
 	    	//DISK
 	    	if("DISK".equals(mainVO.getDetailclse())){
 	    		try {
 	    			ifcTroblVO = new IfcTroblVO();
 	    			ifcTroblVO.setTroblcolctse(mainVO.getTroblcolctse());
 	    			ifcTroblVO.setDetailclse(mainVO.getDetailclse());
 	    			ifcTroblVO.setTroblgradse(mainVO.getTroblgradse());
 	    			ifcTroblVO.setThrhld(mainVO.getThrhld());
 	    			
 	    			List<IfcTroblVO> ifcTroblDiskList = ifcTrobl.ifcTroblDiskAjax(ifcTroblVO);
 	    			
 	    			String troblSeq = "0";
 	    			String subject = "[통합관제]장애발생";
 	    			
 	    			for(int j=0;j<ifcTroblDiskList.size();j++){
 	    				ifcTroblVO = ifcTroblDiskList.get(j);
 	    				
 	    				//중복확인
 	    				List<IfcTroblVO> ifcTroblChkDataList = ifcTrobl.ifcTroblChkDataAjax(ifcTroblVO);
 	    				
 	    				if(ifcTroblChkDataList.size() == 0){
 	    				
	 	    				//장애 추가
	 	    				troblSeq = ifcTrobl.ifcAddTroblAjax(ifcTroblVO);
	 	    				
	 	    				//장애 로그 추가
	 	    				ifcTroblVO.setTroblseq(troblSeq);
	 	    				ifcTroblVO.setActioncn(ifcTroblVO.getTroblcn());
	 	    				ifcTrobl.ifcAddTroblLogAjax(ifcTroblVO);
	 	    				
	 	    				//SMS발송
	 	    				//리스트
	 	    				List<MainCmmnVO> mainCmmnSmsUserList = mainCmmn.mainCmmnSmsUserAjax(mainVO);
	 	    				
	 	    				//발송
	 	    				for(int k=0;k<mainCmmnSmsUserList.size();k++){
	 	    					mainSmsVO = mainCmmnSmsUserList.get(k);
	 	    					
	 	    					mainCmmnVO = new MainCmmnVO();
	 	    					mainCmmnVO.setSubject(subject);
	 	    					mainCmmnVO.setMsg(subject + " " + ifcTroblVO.getHostname() + " " + ifcTroblVO.getTroblcn());
	 	    					mainCmmnVO.setCallname(mainSmsVO.getUser_nm());
	 	    					mainCmmnVO.setCallphone(mainSmsVO.getUser_mbl_num());
	 	    					
	 	    					mainCmmn.insertMainCmmnSms(mainCmmnVO);	//SMS발송(통합관제) 	
	 	    					if(isSMS){
	 	    						mainCmmnMysql.insertMainCmmnMysqlSms(mainCmmnVO);	//SMS발송(SMS서버)
	 	    					}
	 	    					
	 	    					//발송완료시 상태 업데이트
	 	    					ifcTroblVO.setTroblprocesssttus("1");	//SMS발송 상태
	 	    				}
	 	    				
	 	    				//SMS 발송시 업데이트 및 로그 추가
	 	    				if("1".equals(ifcTroblVO.getTroblprocesssttus())){
	 	    					//장애 상태 업데이트
	 	    					//ifcTroblVO.setTroblcn("SMS 발송");
	 	    					ifcTrobl.ifcModTroblAjax(ifcTroblVO);
	 	    					
	 	    					//장애 로그 추가
	 	    					ifcTroblVO.setActioncn("SMS 발송");
	 	    					ifcTrobl.ifcAddTroblLogAjax(ifcTroblVO);
	 	    				}
 	    				}
 	    			}
 	    		} catch (Exception e) {
 	    			e.printStackTrace();
 	    			System.out.println ("DISK 장애 수집 에러발생");	
 	    		} finally{
 	   			
 	    		}
 	    	}
 	    	
 	    	//NET ERR
 	    	if("NETIO".equals(mainVO.getDetailclse())){
 	    		try {
 	    			ifcTroblVO = new IfcTroblVO();
 	    			ifcTroblVO.setTroblcolctse(mainVO.getTroblcolctse());
 	    			ifcTroblVO.setDetailclse(mainVO.getDetailclse());
 	    			ifcTroblVO.setTroblgradse(mainVO.getTroblgradse());
 	    			ifcTroblVO.setThrhld(mainVO.getThrhld());
 	    			
 	    			List<IfcTroblVO> ifcTroblNetioList = ifcTrobl.ifcTroblNetioAjax(ifcTroblVO);
 	    			
 	    			String troblSeq = "0";
 	    			String subject = "[통합관제]장애발생";
 	    			
 	    			for(int j=0;j<ifcTroblNetioList.size();j++){
 	    				ifcTroblVO = ifcTroblNetioList.get(j);
 	    				
 	    				//중복확인
 	    				List<IfcTroblVO> ifcTroblChkDataList = ifcTrobl.ifcTroblChkDataAjax(ifcTroblVO);
 	    				
 	    				if(ifcTroblChkDataList.size() == 0){
 	    				
	 	    				//장애 추가
	 	    				troblSeq = ifcTrobl.ifcAddTroblAjax(ifcTroblVO);
	 	    				
	 	    				//장애 로그 추가
	 	    				ifcTroblVO.setTroblseq(troblSeq);
	 	    				ifcTroblVO.setActioncn(ifcTroblVO.getTroblcn());
	 	    				ifcTrobl.ifcAddTroblLogAjax(ifcTroblVO);
	 	    				
	 	    				//SMS발송
	 	    				//리스트
	 	    				List<MainCmmnVO> mainCmmnSmsUserList = mainCmmn.mainCmmnSmsUserAjax(mainVO);
	 	    				
	 	    				//발송
	 	    				for(int k=0;k<mainCmmnSmsUserList.size();k++){
	 	    					mainSmsVO = mainCmmnSmsUserList.get(k);
	 	    					
	 	    					mainCmmnVO = new MainCmmnVO();
	 	    					mainCmmnVO.setSubject(subject);
	 	    					mainCmmnVO.setMsg(subject + " " + ifcTroblVO.getHostname() + " " + ifcTroblVO.getTroblcn());
	 	    					mainCmmnVO.setCallname(mainSmsVO.getUser_nm());
	 	    					mainCmmnVO.setCallphone(mainSmsVO.getUser_mbl_num());
	 	    					
	 	    					mainCmmn.insertMainCmmnSms(mainCmmnVO);	//SMS발송(통합관제)
	 	    					if(isSMS){
	 	    						mainCmmnMysql.insertMainCmmnMysqlSms(mainCmmnVO);	//SMS발송(SMS서버)
	 	    					}
	 	    					
	 	    					//발송완료시 상태 업데이트
	 	    					ifcTroblVO.setTroblprocesssttus("1");	//SMS발송 상태
	 	    				}
	 	    				
	 	    				//SMS 발송시 업데이트 및 로그 추가
	 	    				if("1".equals(ifcTroblVO.getTroblprocesssttus())){
	 	    					//장애 상태 업데이트
	 	    					//ifcTroblVO.setTroblcn("SMS 발송");
	 	    					ifcTrobl.ifcModTroblAjax(ifcTroblVO);
	 	    					
	 	    					//장애 로그 추가
	 	    					ifcTroblVO.setActioncn("SMS 발송");
	 	    					ifcTrobl.ifcAddTroblLogAjax(ifcTroblVO);
	 	    				}
 	    				}
 	    			}
 	    		} catch (Exception e) {
 	    			e.printStackTrace();
 	    			System.out.println ("NETIO 장애 수집 에러발생");	
 	    		} finally{
 	   			
 	    		}
 	    	}
 	    	
 	    	//CON LOG ERR
 	    	if("CON_ERR".equals(mainVO.getDetailclse())){
 	    		try {
 	    			ifcTroblVO = new IfcTroblVO();
 	    			ifcTroblVO.setTroblcolctse(mainVO.getTroblcolctse());
 	    			ifcTroblVO.setDetailclse(mainVO.getDetailclse());
 	    			ifcTroblVO.setTroblgradse(mainVO.getTroblgradse());
 	    			ifcTroblVO.setThrhld(mainVO.getThrhld());
 	    			
 	    			List<IfcTroblVO> ifcTroblConlogList = ifcTrobl.ifcTroblConlogAjax(ifcTroblVO);
 	    			
 	    			String troblSeq = "0";
 	    			String subject = "[통합관제]장애발생";
 	    			
 	    			for(int j=0;j<ifcTroblConlogList.size();j++){
 	    				ifcTroblVO = ifcTroblConlogList.get(j);
 	    				
 	    				//중복확인
 	    				List<IfcTroblVO> ifcTroblChkDataList = ifcTrobl.ifcTroblChkDataAjax(ifcTroblVO);
 	    				
	 	    				if(ifcTroblChkDataList.size() == 0){
	 	    				
	 	    				//장애 추가
	 	    				troblSeq = ifcTrobl.ifcAddTroblAjax(ifcTroblVO);
	 	    				
	 	    				//장애 로그 추가
	 	    				ifcTroblVO.setTroblseq(troblSeq);
	 	    				ifcTroblVO.setActioncn(ifcTroblVO.getTroblcn());
	 	    				ifcTrobl.ifcAddTroblLogAjax(ifcTroblVO);
	 	    				
	 	    				//SMS발송
	 	    				//리스트
	 	    				List<MainCmmnVO> mainCmmnSmsUserList = mainCmmn.mainCmmnSmsUserAjax(mainVO);
	 	    				
	 	    				//발송
	 	    				for(int k=0;k<mainCmmnSmsUserList.size();k++){
	 	    					mainSmsVO = mainCmmnSmsUserList.get(k);
	 	    					
	 	    					mainCmmnVO = new MainCmmnVO();
	 	    					mainCmmnVO.setSubject(subject);
	 	    					mainCmmnVO.setMsg(subject + " " + ifcTroblVO.getHostname() + " " + ifcTroblVO.getTroblcn());
	 	    					mainCmmnVO.setCallname(mainSmsVO.getUser_nm());
	 	    					mainCmmnVO.setCallphone(mainSmsVO.getUser_mbl_num());
	 	    					
	 	    					mainCmmn.insertMainCmmnSms(mainCmmnVO);	//SMS발송(통합관제)
	 	    					if(isSMS){
	 	    						mainCmmnMysql.insertMainCmmnMysqlSms(mainCmmnVO);	//SMS발송(SMS서버)
	 	    					}
	 	    					
	 	    					//발송완료시 상태 업데이트
	 	    					ifcTroblVO.setTroblprocesssttus("1");	//SMS발송 상태
	 	    				}
	 	    				
	 	    				//SMS 발송시 업데이트 및 로그 추가
	 	    				if("1".equals(ifcTroblVO.getTroblprocesssttus())){
	 	    					//장애 상태 업데이트
	 	    					//ifcTroblVO.setTroblcn("SMS 발송");
	 	    					ifcTrobl.ifcModTroblAjax(ifcTroblVO);
	 	    					
	 	    					//장애 로그 추가
	 	    					ifcTroblVO.setActioncn("SMS 발송");
	 	    					ifcTrobl.ifcAddTroblLogAjax(ifcTroblVO);
	 	    				}
	 	    			}
 	    			}
 	    		} catch (Exception e) {
 	    			e.printStackTrace();
 	    			System.out.println ("CON LOG 장애 수집 에러발생");	
 	    		} finally{
 	   			
 	    		}
 	    	}
 	    }
 	    
 	    /* 감독관 요청으로 제거 */
 	    /*
 	    try {
	 	    //모든 위젯에 메세지 뿌리기
 		   	String error_gubun = "";
			List<IfcTroblVO> ifcTroblServerGubunList = ifcTrobl.ifcTroblServerGubunAjax(ifcTroblVO);
			
			for(int i=0;i<ifcTroblServerGubunList.size();i++){
				ifcTroblVO = ifcTroblServerGubunList.get(i);
				
				if("DISK".equals(ifcTroblVO.getDetailclse())){
					error_gubun = "ifcDiskError";
				}else if("NETIO".equals(ifcTroblVO.getDetailclse())){
					error_gubun = "ifcNetError";
				}else if("CON_ERR".equals(ifcTroblVO.getDetailclse())){
					error_gubun = "ifcConError";
				}
				if(!"".equals(error_gubun)){
					AppSendToUxp appSendToUxp = new AppSendToUxp();
					appSendToUxp.SendDatatoUXP(error_gubun, ifcTroblVO.getGubun()+","+ifcTroblVO.getGroup1()+","+ifcTroblVO.getGroup2()+","+ifcTroblVO.getHostname());
				}
			}
 	   	} catch (Exception e) {
			e.printStackTrace();
			System.out.println ("모든 위젯에 메세지 뿌리기 에러발생");	
		} finally{
			
		}
		*/
 	    
 	    System.out.println ("장애 수집 끝");
	}
}