package egovframework.application;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import egovframework.com.sdtic.ifcrs.service.IfcColctVO;
import egovframework.com.sdtic.ifcrs.service.IfcSptColctVO;
import egovframework.com.sdtic.ifcrs.service.IfcSptVO;
import egovframework.com.sdtic.ifcrs.service.impl.IfcSptColctDAO;
import egovframework.com.sdtic.ifcrs.service.impl.IfcSptDAO;

@Component
public class IfcSptColctScheduler{
	
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
		System.out.println ("현장중계 수집 시작");		
		
		int sqlInsertSuccess = 0;
		int sqlUpdateSuccess = 0;
		
		//=================================수집==========================================
		IfcSptVO ifcSptVO = new IfcSptVO();
		IfcSptColctVO ifcSptColctVO = new IfcSptColctVO();
		
		String realHostname = "";
		
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
		
		//전기 현장중계 수집
		//TEST
		/*
		try {
			System.out.println("전기 현장중계 수집 시작");
			
			/////////////////////////////////////////////////////////
			//Server Info -> Disk, Memory, CPU
			//Test   ip = "127.0.0.1"   osType = 1 windows 2:리눅스
			////////////////////////////////////////////////////////
			
			String cpu = "";
			String memory = "";
			String disk = "";
			String status = "";
			
			JSONObject obj = SNMPClient.snmpInit("10.25.122.167", 1);
			SNMPClient.stop();
			
			status = (String)obj.get("status");
			if("0".equals(status)) //0: connect error  1: success
			{
				System.out.println("ResponseEvent get error [Not connect] ");	
			}
			else
			{
				cpu = (String)obj.get("cpu");
				memory = (String)obj.get("memory");
				disk = (String)obj.get("disk");
			}
			
			System.out.println("cpu : "+cpu);
			System.out.println("memory : "+memory);
			System.out.println("disk : "+disk);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println ("전기 현장중계 수집 에러발생");	
		} finally{
			
		}
		*/
		
		//운영
		/*
		try {
			System.out.println("전기 현장중계 수집 시작");
			
			List<IfcSptVO> ifcSptElcServerList = ifcSpt.ifcSptElcServerAjax(ifcSptVO);
			
			/////////////////////////////////////////////////////////
			//Server Info -> Disk, Memory, CPU
			//Test   ip = "127.0.0.1"   osType = 1 windows 2:리눅스
			////////////////////////////////////////////////////////
			
			String cpu = "";
			String memory = "";
			String disk = "";
			String status = "";
			
			for(int i=0;i<ifcSptElcServerList.size();i++){
				ifcSptVO = ifcSptElcServerList.get(i);
				
				//윈도우만 수행
				if("1".equals(ifcSptVO.getOs())){
					cpu = "";
					memory = "";
					disk = "";
					
					JSONObject obj = SNMPClient.snmpInit(ifcSptVO.getIp(), Integer.parseInt(ifcSptVO.getOs()));
					SNMPClient.stop();
					
					status = (String)obj.get("status");
					if("0".equals(status)) //0: connect error  1: success
					{
						System.out.println("ResponseEvent get error [Not connect] ");	
					}
					else
					{
						cpu = (String)obj.get("cpu");
						memory = (String)obj.get("memory");
						disk = (String)obj.get("disk");
					}
					
					//수집테이블에 저장
					ifcSptVO.setGubun("ELC");
					ifcSptVO.setCpu(cpu);
					ifcSptVO.setMemory(memory);
					ifcSptVO.setDisk(disk);
					ifcSptVO.setProcess("");
					Calendar cal = Calendar.getInstance();
					SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
					String yyyymmddhh24miss = df.format(cal.getTime());
					ifcSptVO.setInst_date(yyyymmddhh24miss);
					
					ifcSpt.ifcAddSptColctAjax(ifcSptVO);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println ("전기 현장중계 수집 에러발생");	
		} finally{
			
		}
		*/
 	    
 	    System.out.println ("현장중계 수집 끝");
	}
}