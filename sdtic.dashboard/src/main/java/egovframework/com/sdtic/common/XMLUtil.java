package egovframework.com.sdtic.common;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.codec.Base64;



public class XMLUtil
{
	public static Logger logger = LoggerFactory.getLogger(XMLUtil.class);
	
	@SuppressWarnings("unchecked")
	public static String mapToXmlString(Map<String,Object> dataMap, Map<String,Object> listMap){		
		
		StringBuffer returnString = new StringBuffer();
		returnString.append("<root>");
		if(dataMap != null && dataMap.size() > 0){
			Set<String> dataSet = dataMap.keySet();
			Iterator<String> dataIter = dataSet.iterator();
			int i=1;
			while(dataIter.hasNext())
			{
				if(i == 1){
					returnString.append("<dataset>");
				}
				String key = dataIter.next();
				String value = "";
				if (dataMap.get(key) != null)
					value = dataMap.get(key).toString();
				returnString.append("<"+key+"><![CDATA["+value+"]]></"+key+">");
				i++;
			}
			if( i > 1){
				returnString.append("</dataset>");
			}	
		}
			
		
		if(listMap != null && listMap.size() > 0){
			returnString.append("<listset>");
			Set<String> dataSet = listMap.keySet();
			Iterator<String> dataIter = dataSet.iterator();
			
			while(dataIter.hasNext())
			{
				returnString.append("<list>");
				String key = dataIter.next();
				ArrayList<Map<String,Object>> values = (ArrayList<Map<String,Object>>)listMap.get(key);
				for(Map<String,Object> m : values){
					returnString.append("<"+key+">");
					Set<String> mSet = m.keySet();
					Iterator<String> mIter = mSet.iterator();
					while(mIter.hasNext())
					{
						String mKey = mIter.next();
						String mVal = "";
						if (m.get(mKey) != null)
							mVal = m.get(mKey).toString();
						returnString.append("<"+mKey+"><![CDATA["+mVal+"]]></"+mKey+">");
					}				
					returnString.append("</"+key+">");
				}			
				returnString.append("</list>");
			}		
			returnString.append("</listset>");
		}
		returnString.append("</root>");
		
		return encXml(returnString.toString());
	}
	
	public static String stringToBase64(String str){	
		try{
	        str = URLDecoder.decode(str, "UTF-8");
        }catch(UnsupportedEncodingException e){
        	logger.info("UnsupportedEncoding ERROR");
        }
		return encXml(str);
	}	

	public static String encXml(String param){
		//logger.info(param);
		try{
	        return new String(Base64.encode(param.getBytes("UTF-8")));
        }catch(UnsupportedEncodingException e){
        	logger.info("UnsupportedEncoding ERROR");
        }
		return null;
	}
	
	
}