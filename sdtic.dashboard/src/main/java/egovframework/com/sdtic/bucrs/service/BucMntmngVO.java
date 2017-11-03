package egovframework.com.sdtic.bucrs.service;

/**
 * @Class Name :  BucMntmngVo.java
 * @Description : BucMntmngVo Class
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
public class BucMntmngVO {

    private static final long serialVersionUID = 1L;

    private String temp1;
    private String temp2;
    private String temp3;
    private String temp4;
    private String buc_mntmng;
    private String bonbu;
    private String bonbucode;
    private String jisacode;
    private String jisa;
    private String ts_data;
    private String tp_data;
    private String gs_data;
    private String gp_data;
    private String as_data;
    private String ap_data;
    private String bonbu_gubun;
    private String bonbuMax;
    
    //비즈니스 유지관리 상단위젯
    private String cnt;
    private String plan_km;
    private String c_km;
    private String complete_p;
    
    //유지관리 주간 인력,거리,장비 위젯
    private String bonbu_cd;
    private String plan_worker_cnt;
    private String plan_eqp_cnt;
    private String worker_cnt;
    private String eqp_cnt;
    private String gubun_date;
    
    //유지관리 점검계획대비 점검완료율 db연동 화면
    private String kor_dptnm;
    private String acpt;
    private String rcvr;
    private String use_cd;
    private String c_percent;
    
    //차량관제현황
    private String hgrn_dptcd;
    private String vhclcnt;
    private String distance;
    
    
	public String getHgrn_dptcd() {
		return hgrn_dptcd;
	}
	public void setHgrn_dptcd(String hgrn_dptcd) {
		this.hgrn_dptcd = hgrn_dptcd;
	}
	public String getVhclcnt() {
		return vhclcnt;
	}
	public void setVhclcnt(String vhclcnt) {
		this.vhclcnt = vhclcnt;
	}
	public String getDistance() {
		return distance;
	}
	public void setDistance(String distance) {
		this.distance = distance;
	}
	public String getC_percent() {
		return c_percent;
	}
	public void setC_percent(String c_percent) {
		this.c_percent = c_percent;
	}
	public String getUse_cd() {
		return use_cd;
	}
	public void setUse_cd(String use_cd) {
		this.use_cd = use_cd;
	}
	public String getKor_dptnm() {
		return kor_dptnm;
	}
	public void setKor_dptnm(String kor_dptnm) {
		this.kor_dptnm = kor_dptnm;
	}
	public String getAcpt() {
		return acpt;
	}
	public void setAcpt(String acpt) {
		this.acpt = acpt;
	}
	public String getRcvr() {
		return rcvr;
	}
	public void setRcvr(String rcvr) {
		this.rcvr = rcvr;
	}
	public String getGubun_date() {
		return gubun_date;
	}
	public void setGubun_date(String gubun_date) {
		this.gubun_date = gubun_date;
	}
	public String getBonbu_cd() {
		return bonbu_cd;
	}
	public void setBonbu_cd(String bonbu_cd) {
		this.bonbu_cd = bonbu_cd;
	}
	public String getPlan_worker_cnt() {
		return plan_worker_cnt;
	}
	public void setPlan_worker_cnt(String plan_worker_cnt) {
		this.plan_worker_cnt = plan_worker_cnt;
	}
	public String getPlan_eqp_cnt() {
		return plan_eqp_cnt;
	}
	public void setPlan_eqp_cnt(String plan_eqp_cnt) {
		this.plan_eqp_cnt = plan_eqp_cnt;
	}
	public String getWorker_cnt() {
		return worker_cnt;
	}
	public void setWorker_cnt(String worker_cnt) {
		this.worker_cnt = worker_cnt;
	}
	public String getEqp_cnt() {
		return eqp_cnt;
	}
	public void setEqp_cnt(String eqp_cnt) {
		this.eqp_cnt = eqp_cnt;
	}
	public String getPlan_km() {
		return plan_km;
	}
	public void setPlan_km(String plan_km) {
		this.plan_km = plan_km;
	}
	public String getC_km() {
		return c_km;
	}
	public void setC_km(String c_km) {
		this.c_km = c_km;
	}
	public String getComplete_p() {
		return complete_p;
	}
	public void setComplete_p(String complete_p) {
		this.complete_p = complete_p;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public String getBonbuMax() {
		return bonbuMax;
	}
	public void setBonbuMax(String bonbuMax) {
		this.bonbuMax = bonbuMax;
	}
	public String getBonbu_gubun() {
		return bonbu_gubun;
	}
	public void setBonbu_gubun(String bonbu_gubun) {
		this.bonbu_gubun = bonbu_gubun;
	}
	public String getBonbu() {
		return bonbu;
	}
	public void setBonbu(String bonbu) {
		this.bonbu = bonbu;
	}
	public String getBonbucode() {
		return bonbucode;
	}
	public void setBonbucode(String bonbucode) {
		this.bonbucode = bonbucode;
	}
	public String getJisacode() {
		return jisacode;
	}
	public void setJisacode(String jisacode) {
		this.jisacode = jisacode;
	}
	public String getJisa() {
		return jisa;
	}
	public void setJisa(String jisa) {
		this.jisa = jisa;
	}
	public String getTs_data() {
		return ts_data;
	}
	public void setTs_data(String ts_data) {
		this.ts_data = ts_data;
	}
	public String getTp_data() {
		return tp_data;
	}
	public void setTp_data(String tp_data) {
		this.tp_data = tp_data;
	}
	public String getGs_data() {
		return gs_data;
	}
	public void setGs_data(String gs_data) {
		this.gs_data = gs_data;
	}
	public String getGp_data() {
		return gp_data;
	}
	public void setGp_data(String gp_data) {
		this.gp_data = gp_data;
	}
	public String getAs_data() {
		return as_data;
	}
	public void setAs_data(String as_data) {
		this.as_data = as_data;
	}
	public String getAp_data() {
		return ap_data;
	}
	public void setAp_data(String ap_data) {
		this.ap_data = ap_data;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getBuc_mntmng() {
		return buc_mntmng;
	}
	public void setBuc_mntmng(String buc_mntmng) {
		this.buc_mntmng = buc_mntmng;
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