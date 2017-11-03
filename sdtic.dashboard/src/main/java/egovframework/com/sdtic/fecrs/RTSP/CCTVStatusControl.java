package egovframework.com.sdtic.fecrs.RTSP;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;

import egovframework.com.sdtic.fecrs.service.fecCctvVO;
import egovframework.com.sdtic.fecrs.service.impl.fecTotlInsrTotDAO;

public class CCTVStatusControl{   
	@Autowired
	@Resource(name="fecTotlInsrTotDAO") private fecTotlInsrTotDAO fecTotlInsrTotDAO;
	
//	CCTVStatusControl comCCTV = new CCTVStatusControl();
	@SuppressWarnings({ "null", "unused" })
	public void checkCCTV() { 
		try{
			String searchTableSQL = "";

			List<fecCctvVO> list = fecTotlInsrTotDAO.checkCCTV("");
			List<fecCctvVO> Insertlist = null;
			
			for(int i = 0;i < list.size();i++){
				
				fecCctvVO Vo = list.get(i);
				
				String spin_intg_id = Vo.getSpin_intg_id();	
				String cctvUrl = "";//취득할 cctv url 초기화
				

				//CCTV 체크
				RTSPcctvCheck cctvUrlChk = new RTSPcctvCheck(true); //CCTV체크 자바 -> true:실서버, false:테스트				
				String cctvIp = "10.108.88.84"; //현재 운영 중인 ip
				cctvUrlChk.setUser("hima");
				cctvUrlChk.setCameraId(spin_intg_id);
				cctvUrlChk.setRequestId("D1");
				cctvUrlChk.setResolution(" ");

				if ( cctvUrlChk.start() == 0) {
					String ccc = cctvUrlChk.getServiceUrl();
					System.out.println( "ccc = " + ccc );
					cctvUrl = replaceStr (ccc, cctvIp);
					System.out.println( "Change ServiceUrl <<<> :  " + cctvUrl );
					System.out.println( "ServiceUrl  :  " + cctvUrlChk.getServiceUrl() );
					System.out.println( "cctvUrl  :  " + cctvUrl );
				}
				else {
					System.out.println( "Error Msg  :  " + cctvUrlChk.getServiceUrl() );
				}
				
				Vo.setCctvurl(cctvUrl);
				Insertlist.add(Vo);
				
			}
			
			if (Insertlist != null)
			{
				//fecTotlInsrTotDAO.InsertCCTV();
			}

		}
		catch(Exception e){    
			e.printStackTrace();
		}
		finally{    

		}
	
		
	}

	public String replaceStr(String ori, String chg) {   
		String s2 = "";
		s2 = ori.replace("10.108.88.84", chg);
		return	s2;

	}

}
