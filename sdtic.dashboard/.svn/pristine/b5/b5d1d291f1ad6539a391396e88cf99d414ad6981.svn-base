package egovframework.com.eseict.ex;

import java.io.UnsupportedEncodingException;
import java.net.SocketException;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.eseict.domain.GeneralMessage;
import com.eseict.socket.snd.SocketTempSendProcImpl;
import com.eseict.util.CommonUtil;
import com.eseict.util.header.HeaderUtil;
import com.google.common.collect.Maps;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Header 생성 샘플
 *
 */
public class App {
	private static final Logger logger = LoggerFactory.getLogger("com.eseict.ex");
	
	private static final String CHAR_SET = "UTF-8";
	
    public static void main( String[] args ){
    	Map<String, Object> dataMap = Maps.newHashMap(); // 포멧의 정의
    	Map<String, Object> data1 = Maps.newHashMap(); // 실제 보내고 싶은 데이터가 들어가는 Map
    	Map<String, Object> data2 = Maps.newHashMap(); // 실제 보내고 싶은 데이터가 들어가는 Map
    	
    	data2.put("key_b", "value_b");
    	data2.put("key_c", "value_c");
    	data1.put("data", data2);
    	
    	data1.put("type", "A");
    	dataMap.put("EX_EVET", data1);
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
    	
    	try {
			byte[] headerSample = HeaderUtil.makeHeader(headerTypCd, sndSysCd, mep, bodyLen, msgTypCd);
			
			GeneralMessage gm = new GeneralMessage();
			gm.setHeaderTyp(headerTypCd.getBytes(CHAR_SET));
			gm.setHeader(headerSample); 
			gm.setBody(body);
			
			SocketTempSendProcImpl client = new SocketTempSendProcImpl("192.168.218.8", 9401);
			try {
				String result = client.send(gm) == true ? "SUCCESS" : "FAIL";
				logger.info("send result : {}", result);
			} catch (SocketException e) {
				e.printStackTrace();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
        
    }
}
