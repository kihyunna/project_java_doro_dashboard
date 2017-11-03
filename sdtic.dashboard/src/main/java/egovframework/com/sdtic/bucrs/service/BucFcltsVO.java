package egovframework.com.sdtic.bucrs.service;

/**
 * @Class Name :  BucFcltsVo.java
 * @Description : BucFcltsVo Class
 * @Modification Information
 * @
 * @ 수정일          수정자                       수정내용
 * @ -----------   ---------   -------------------------------
 * @ 2017. 06. 01    jkheo                       최초생성
 *
 * @author
 * @since
 * @version 1.0
 * @see
 *
 */
public class BucFcltsVO {

    private static final long serialVersionUID = 1L;

    private String temp1;
    private String temp2;
    private String temp3;
    private String temp4;
    private String buc_fclts;
    private String connnector;
    private String point;
    
    //구조물 점검현황(본부) 
    private String hdqr_cd;
    private String hdqr_nm;
    private String broken_count;
    private String avgdttm;
    private String avgdttm2;
    
    //구조물 점검현황(지사)
    private String mtnof_cd;
    private String mtnof_nm;
    private String use_cd;
    
    //시설물 고장건수 top20
    private String bonbu_nm;
    private String jisa_nm;
    private String insr_kor_nm;
    private String acpt;
    private String headquerter;
    private String branches;
    private String period;
    
    //시설물 상단
    private String rate;
    private String fcltscd;
    private String title;
    
    //오수처리
    private String svar_nm;
    private String flow_type;
    private String t01;
    private String t02;
    private String t03;
    private String t04;
    private String t05;
    private String t06;
    private String t07;
    private String t08;
    private String t09;
    private String t10;
    private String t11;
    private String t12;
    
    //데이터증가량
    private String collect_date;
    private String use_value;
    private String gubun;
    private int gubun_day;
    private String sys_gubun;
    
    //시설물 34종 이관율(히트맵)
    private String cmmn_cd_nm;
    private String bnstytrnsfer;
    
    //시설물 34종 입력율(막대)
    private String bnstyinputavg;
    
    
    public String getBnstyinputavg() {
		return bnstyinputavg;
	}
	public void setBnstyinputavg(String bnstyinputavg) {
		this.bnstyinputavg = bnstyinputavg;
	}
	public String getCmmn_cd_nm() {
		return cmmn_cd_nm;
	}
	public void setCmmn_cd_nm(String cmmn_cd_nm) {
		this.cmmn_cd_nm = cmmn_cd_nm;
	}
	public String getBnstytrnsfer() {
		return bnstytrnsfer;
	}
	public void setBnstytrnsfer(String bnstytrnsfer) {
		this.bnstytrnsfer = bnstytrnsfer;
	}
	public String getCollect_date() {
		return collect_date;
	}
	public void setCollect_date(String collect_date) {
		this.collect_date = collect_date;
	}
	public String getUse_value() {
		return use_value;
	}
	public void setUse_value(String use_value) {
		this.use_value = use_value;
	}
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	
	public int getGubun_day() {
		return gubun_day;
	}
	public void setGubun_day(int gubun_day) {
		this.gubun_day = gubun_day;
	}
	public String getSys_gubun() {
		return sys_gubun;
	}
	public void setSys_gubun(String sys_gubun) {
		this.sys_gubun = sys_gubun;
	}
    
    
	public String getSvar_nm() {
		return svar_nm;
	}
	public void setSvar_nm(String svar_nm) {
		this.svar_nm = svar_nm;
	}
	public String getFlow_type() {
		return flow_type;
	}
	public void setFlow_type(String flow_type) {
		this.flow_type = flow_type;
	}
	public String getT01() {
		return t01;
	}
	public void setT01(String t01) {
		this.t01 = t01;
	}
	public String getT02() {
		return t02;
	}
	public void setT02(String t02) {
		this.t02 = t02;
	}
	public String getT03() {
		return t03;
	}
	public void setT03(String t03) {
		this.t03 = t03;
	}
	public String getT04() {
		return t04;
	}
	public void setT04(String t04) {
		this.t04 = t04;
	}
	public String getT05() {
		return t05;
	}
	public void setT05(String t05) {
		this.t05 = t05;
	}
	public String getT06() {
		return t06;
	}
	public void setT06(String t06) {
		this.t06 = t06;
	}
	public String getT07() {
		return t07;
	}
	public void setT07(String t07) {
		this.t07 = t07;
	}
	public String getT08() {
		return t08;
	}
	public void setT08(String t08) {
		this.t08 = t08;
	}
	public String getT09() {
		return t09;
	}
	public void setT09(String t09) {
		this.t09 = t09;
	}
	public String getT10() {
		return t10;
	}
	public void setT10(String t10) {
		this.t10 = t10;
	}
	public String getT11() {
		return t11;
	}
	public void setT11(String t11) {
		this.t11 = t11;
	}
	public String getT12() {
		return t12;
	}
	public void setT12(String t12) {
		this.t12 = t12;
	}
	public String getFcltscd() {
		return fcltscd;
	}
	public void setFcltscd(String fcltscd) {
		this.fcltscd = fcltscd;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getHeadquerter() {
		return headquerter;
	}
	public void setHeadquerter(String headquerter) {
		this.headquerter = headquerter;
	}
	public String getBranches() {
		return branches;
	}
	public void setBranches(String branches) {
		this.branches = branches;
	}
	public String getBonbu_nm() {
		return bonbu_nm;
	}
	public void setBonbu_nm(String bonbu_nm) {
		this.bonbu_nm = bonbu_nm;
	}
	public String getJisa_nm() {
		return jisa_nm;
	}
	public void setJisa_nm(String jisa_nm) {
		this.jisa_nm = jisa_nm;
	}
	public String getInsr_kor_nm() {
		return insr_kor_nm;
	}
	public void setInsr_kor_nm(String insr_kor_nm) {
		this.insr_kor_nm = insr_kor_nm;
	}
	public String getAcpt() {
		return acpt;
	}
	public void setAcpt(String acpt) {
		this.acpt = acpt;
	}
	public String getUse_cd() {
		return use_cd;
	}
	public void setUse_cd(String use_cd) {
		this.use_cd = use_cd;
	}
	public String getMtnof_cd() {
		return mtnof_cd;
	}
	public void setMtnof_cd(String mtnof_cd) {
		this.mtnof_cd = mtnof_cd;
	}
	public String getMtnof_nm() {
		return mtnof_nm;
	}
	public void setMtnof_nm(String mtnof_nm) {
		this.mtnof_nm = mtnof_nm;
	}
	public String getConnnector() {
		return connnector;
	}
	public void setConnnector(String connnector) {
		this.connnector = connnector;
	}
	public String getHdqr_cd() {
		return hdqr_cd;
	}
	public void setHdqr_cd(String hdqr_cd) {
		this.hdqr_cd = hdqr_cd;
	}
	public String getHdqr_nm() {
		return hdqr_nm;
	}
	public void setHdqr_nm(String hdqr_nm) {
		this.hdqr_nm = hdqr_nm;
	}
	public String getBroken_count() {
		return broken_count;
	}
	public void setBroken_count(String broken_count) {
		this.broken_count = broken_count;
	}
	public String getAvgdttm() {
		return avgdttm;
	}
	public void setAvgdttm(String avgdttm) {
		this.avgdttm = avgdttm;
	}
	public String getAvgdttm2() {
		return avgdttm2;
	}
	public void setAvgdttm2(String avgdttm2) {
		this.avgdttm2 = avgdttm2;
	}
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	public String getConnector() {
		return connnector;
	}
	public void setConnector(String connector) {
		this.connnector = connector;
	}
	public String getBuc_fclts() {
		return buc_fclts;
	}
	public void setBuc_fclts(String buc_fclts) {
		this.buc_fclts = buc_fclts;
	}
	public String getTemp1() {
        return temp1;
    }
    public void setTemp1(String temp1) {
        this.temp1 = temp1;
    }
    public String getTemp2() {
        return temp2;
    }
    public void setTemp2(String temp2) {
        this.temp2 = temp2;
    }
    public String getTemp3() {
        return temp3;
    }
    public void setTemp3(String temp3) {
        this.temp3 = temp3;
    }
    public String getTemp4() {
        return temp4;
    }
    public void setTemp4(String temp4) {
        this.temp4 = temp4;
    }


}