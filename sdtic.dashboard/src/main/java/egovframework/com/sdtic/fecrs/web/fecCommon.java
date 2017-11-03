package egovframework.com.sdtic.fecrs.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import egovframework.com.sdtic.main.service.MainFecService;

@Controller
public class fecCommon{
	
	@Resource(name = "MainFecService")      private     MainFecService          mainFecService;
	
	public String getHdqrTextWithHdqrCd(String code) throws Exception { 
		List<HashMap<String, String>> List  = mainFecService.getHdqrTextWithHdqrCd(code);
		String HdqrText = "";
		String Selected = "";
		for(int i = 0 ; i < List.size() ; i ++){
			Selected = "";
			if (List.get(i).get("SEL") != null){
				Selected = List.get(i).get("SEL").toString();
			}
			HdqrText += "<option value='"+List.get(i).get("KEY").toString()+"' "+Selected+">"+List.get(i).get("VALUE").toString()+"</option>";
		}
		
		return HdqrText;
	}
	
	public HashMap<String, String> getMtnofTextWithHdqrCd(String code) throws Exception { 
		HashMap<String, String> result = new HashMap<String, String>();
		List<HashMap<String, String>> List = mainFecService.getMtnofTextWithHdqrCd(code);
		
		String MtnofText = "";
		String MtnofCd = "";
		String Selected ="";
		for(int i = 0 ; i < List.size() ; i ++){
			Selected = "";
			if (List.get(i).get("SEL") != null){
				MtnofCd = List.get(i).get("KEY").toString();
				Selected = List.get(i).get("SEL").toString();
			}
			MtnofText += "<option value='"+List.get(i).get("KEY").toString()+"' "+Selected+">"+List.get(i).get("VALUE").toString()+"</option>";
			
		}
		
		result.put("MtnofText", MtnofText);
		result.put("MtnofCd", MtnofCd);
		
		return result;
	}
	
	public String getHdqrTextWithMtnofCd(String code) throws Exception { 
		List<HashMap<String, String>> List  = mainFecService.getHdqrTextWithMtnofCd(code);
		String HdqrText = "";
		String Selected = "";
		for(int i = 0 ; i < List.size() ; i ++){
			Selected = "";
			if (List.get(i).get("SEL") != null){
				Selected = List.get(i).get("SEL").toString();
			}
			HdqrText += "<option value='"+List.get(i).get("KEY").toString()+"' "+Selected+">"+List.get(i).get("VALUE").toString()+"</option>";
		}
		
		return HdqrText;
	}
	
	public HashMap<String, String> getMtnofTextWithMtnofCd(String code) throws Exception { 
		HashMap<String, String> result = new HashMap<String, String>();
		List<HashMap<String, String>> List = mainFecService.getMtnofTextWithMtnofCd(code);
		
		String MtnofText = "";
		String MtnofCd = "";
		String HdqrCd = "";
		String Selected = "";
		for(int i = 0 ; i < List.size() ; i ++){
			Selected = "";
			if (List.get(i).get("SEL") != null){
				MtnofCd = List.get(i).get("KEY").toString();
				HdqrCd = List.get(i).get("HDQR_CD").toString();
				Selected = List.get(i).get("SEL").toString();
			}
				
			MtnofText += "<option value='"+List.get(i).get("KEY").toString()+"' "+Selected+">"+List.get(i).get("VALUE").toString()+"</option>";
			
		}
		
		result.put("MtnofText", MtnofText);
		result.put("MtnofCd", MtnofCd);
		result.put("HdqrCd", HdqrCd);

		return result;
	}
}



