package egovframework.application;


import java.io.UnsupportedEncodingException;
import java.net.SocketException;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.eseict.domain.GeneralMessage;
import com.eseict.socket.snd.SocketTempSendProcImpl;
import com.eseict.util.CommonUtil;
import com.eseict.util.header.HeaderUtil;
import com.google.common.collect.Maps;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class AppSendToUxp{
	private static final Logger logger = LoggerFactory.getLogger("com.eseict.ex");
	
	private static final String CHAR_SET = "UTF-8";	    
	

	@Autowired
	public void SendDatatoUXP( String value ){
		Map<String, Object> dataMap = Maps.newHashMap(); // 포멧의 정의
    	Map<String, Object> data = Maps.newHashMap(); // 실제 보내고 싶은 데이터가 들어가는 Map    	
       	
    	data.put("type", value);
    	dataMap.put("EX_EVET", data);		
		
		System.out.println ("데이터 바디생성");
    	Gson gson = new GsonBuilder().create();
    	String bodyData = gson.toJson(dataMap);
    	byte[] body = null;
		try {
			body = bodyData.getBytes(CHAR_SET);
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
    	
        String headerTypCd = "A1"; // MRS에 등록되어있는 헤더타입코드
        String sndSysCd = CommonUtil.setPad("SND", 9, " ", "L"); // MRS에 등록되어있는 송신 시스템의 시스템 코드. 자리수는 9자리이며 빈자리는 빈칸으로 채워줘야합니다.
        String mep = "3"; // 메시지 교환방식 (1 : One Way, 2 : One Way Ack, 3 : Ack)
    	int bodyLen = body.length; // 바디의 길이. String type의 바디를 byte배열로 변환한 후 길이를 넣어줘야 합니다.
    	String msgTypCd = "001"; // 3자리 이며 WFS에 등록된 메시지 타입 코드입니다.
    	System.out.println ("헤더생성");
    	try {
			byte[] headerSample = HeaderUtil.makeHeader(headerTypCd, sndSysCd, mep, bodyLen, msgTypCd);
			
			GeneralMessage gm = new GeneralMessage();
			gm.setHeaderTyp(headerTypCd.getBytes(CHAR_SET));
			gm.setHeader(headerSample); 
			gm.setBody(body);
			
			SocketTempSendProcImpl client1 = new SocketTempSendProcImpl("172.16.167.165", 9401);
			System.out.println ("소켓전송");
			try {
				String result = client1.send(gm) == true ? "SUCCESS" : "FAIL";
				logger.info("send result : {}", result);
			} catch (SocketException e) {
				e.printStackTrace();
			}
			
			SocketTempSendProcImpl client2 = new SocketTempSendProcImpl("172.16.167.166", 9401);
			System.out.println ("소켓전송");
			try {
				String result = client2.send(gm) == true ? "SUCCESS" : "FAIL";
				logger.info("send result : {}", result);
			} catch (SocketException e) {
				e.printStackTrace();
			}
//			
//			SocketTempSendProcImpl client3 = new SocketTempSendProcImpl("172.16.167.167", 5002);
//			System.out.println ("소켓전송");
//			try {
//				String result = client3.send(gm) == true ? "SUCCESS" : "FAIL";
//				logger.info("send result : {}", result);
//			} catch (SocketException e) {
//				e.printStackTrace();
//			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
        
    }    
	
	//data를 보낼 경우 사용
	@Autowired
	public void SendDatatoUXP( String value, String value_data ){
		Map<String, Object> dataMap = Maps.newHashMap(); // 포멧의 정의
    	Map<String, Object> data = Maps.newHashMap(); // 실제 보내고 싶은 데이터가 들어가는 Map    	
       	
    	data.put("type", value);
    	data.put("data", value_data);	//data추가
    	dataMap.put("EX_EVET", data);		
		
		System.out.println ("데이터 바디생성(2)");
    	Gson gson = new GsonBuilder().create();
    	String bodyData = gson.toJson(dataMap);
    	byte[] body = null;
		try {
			body = bodyData.getBytes(CHAR_SET);
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
    	
        String headerTypCd = "A1"; // MRS에 등록되어있는 헤더타입코드
        String sndSysCd = CommonUtil.setPad("SND", 9, " ", "L"); // MRS에 등록되어있는 송신 시스템의 시스템 코드. 자리수는 9자리이며 빈자리는 빈칸으로 채워줘야합니다.
        String mep = "3"; // 메시지 교환방식 (1 : One Way, 2 : One Way Ack, 3 : Ack)
    	int bodyLen = body.length; // 바디의 길이. String type의 바디를 byte배열로 변환한 후 길이를 넣어줘야 합니다.
    	String msgTypCd = "001"; // 3자리 이며 WFS에 등록된 메시지 타입 코드입니다.
    	System.out.println ("헤더생성(2)");
    	try {
			byte[] headerSample = HeaderUtil.makeHeader(headerTypCd, sndSysCd, mep, bodyLen, msgTypCd);
			
			GeneralMessage gm = new GeneralMessage();
			gm.setHeaderTyp(headerTypCd.getBytes(CHAR_SET));
			gm.setHeader(headerSample); 
			gm.setBody(body);
			
			SocketTempSendProcImpl client1 = new SocketTempSendProcImpl("172.16.167.165", 9401);
			System.out.println ("소켓전송(2)");
			try {
				String result = client1.send(gm) == true ? "SUCCESS" : "FAIL";
				logger.info("send result : {}", result);
			} catch (SocketException e) {
				e.printStackTrace();
			}
			
			SocketTempSendProcImpl client2 = new SocketTempSendProcImpl("172.16.167.166", 9401);
			System.out.println ("소켓전송(2)");
			try {
				String result = client2.send(gm) == true ? "SUCCESS" : "FAIL";
				logger.info("send result : {}", result);
			} catch (SocketException e) {
				e.printStackTrace();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
        
    }    
}



