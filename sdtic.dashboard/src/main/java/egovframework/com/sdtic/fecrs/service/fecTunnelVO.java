package egovframework.com.sdtic.fecrs.service;

/**
 * @Class Name : fecMainVO.java
 * @Description : fecMainVO Class
 * @Modification Information
 * @
 * @ 수정일        수정자                        수정내용
 * @ -----------   ---------   -------------------------------
 * @ 2017.06.01    jkheo                         최초생성
 *
 * @author itforward
 * @since 2017. 06.01
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public class fecTunnelVO {

    private static final long serialVersionUID = 1L;

    private String insr_seq;//기기일련번호
    private String tunl_cd; //터널코드
    private String route_cd; //노선코드
    private String mtnof_cd; //지사코드
    private String tunl_nm; //터널명  
    
    private String tunnel_seq; //순번 
    private String tnrm_eqpmt_clss_cd; //터널원격설비구분코드  
    private String tnrm_mchn_clss_cd; //터널원격기계구분코드  
    private String modl_nm; //모델명  
    private String log_time; //로그시간 
    
    private String event_log_seq; //로그일련번호
    private String event_time; //경보시간
    private String event_division; //경보구분
    private String event_stat; //경보상태값
    private String event_value; //경보설정값
    private String event_type; //경보분류
    private String event_level; //경보레벨
    private String recover; //복구상태
    private String evnt_nm; //이벤트명
    private String tnrm_evnt_levls_cd; //터널원격이벤트수준코드
    private String dsbl_ocrn_stat_val; //장애발생상태값
    private String recover_time;//복구시간
    private String insert_time;//입력시간
    
	public String getInsr_seq() {
		return insr_seq;
	}
	public void setInsr_seq(String insr_seq) {
		this.insr_seq = insr_seq;
	}
	public String getTunl_cd() {
		return tunl_cd;
	}
	public void setTunl_cd(String tunl_cd) {
		this.tunl_cd = tunl_cd;
	}
	public String getRoute_cd() {
		return route_cd;
	}
	public void setRoute_cd(String route_cd) {
		this.route_cd = route_cd;
	}
	public String getMtnof_cd() {
		return mtnof_cd;
	}
	public void setMtnof_cd(String mtnof_cd) {
		this.mtnof_cd = mtnof_cd;
	}
	public String getTunl_nm() {
		return tunl_nm;
	}
	public void setTunl_nm(String tunl_nm) {
		this.tunl_nm = tunl_nm;
	}
	public String getTunnel_seq() {
		return tunnel_seq;
	}
	public void setTunnel_seq(String tunnel_seq) {
		this.tunnel_seq = tunnel_seq;
	}
	public String getTnrm_eqpmt_clss_cd() {
		return tnrm_eqpmt_clss_cd;
	}
	public void setTnrm_eqpmt_clss_cd(String tnrm_eqpmt_clss_cd) {
		this.tnrm_eqpmt_clss_cd = tnrm_eqpmt_clss_cd;
	}
	public String getTnrm_mchn_clss_cd() {
		return tnrm_mchn_clss_cd;
	}
	public void setTnrm_mchn_clss_cd(String tnrm_mchn_clss_cd) {
		this.tnrm_mchn_clss_cd = tnrm_mchn_clss_cd;
	}
	public String getModl_nm() {
		return modl_nm;
	}
	public void setModl_nm(String modl_nm) {
		this.modl_nm = modl_nm;
	}
	public String getLog_time() {
		return log_time;
	}
	public void setLog_time(String log_time) {
		this.log_time = log_time;
	}
	public String getEvent_log_seq() {
		return event_log_seq;
	}
	public void setEvent_log_seq(String event_log_seq) {
		this.event_log_seq = event_log_seq;
	}
	public String getEvent_time() {
		return event_time;
	}
	public void setEvent_time(String event_time) {
		this.event_time = event_time;
	}
	public String getEvent_division() {
		return event_division;
	}
	public void setEvent_division(String event_division) {
		this.event_division = event_division;
	}
	public String getEvent_stat() {
		return event_stat;
	}
	public void setEvent_stat(String event_stat) {
		this.event_stat = event_stat;
	}
	public String getEvent_value() {
		return event_value;
	}
	public void setEvent_value(String event_value) {
		this.event_value = event_value;
	}
	public String getEvent_type() {
		return event_type;
	}
	public void setEvent_type(String event_type) {
		this.event_type = event_type;
	}
	public String getEvent_level() {
		return event_level;
	}
	public void setEvent_level(String event_level) {
		this.event_level = event_level;
	}
	public String getRecover() {
		return recover;
	}
	public void setRecover(String recover) {
		this.recover = recover;
	}
	public String getEvnt_nm() {
		return evnt_nm;
	}
	public void setEvnt_nm(String evnt_nm) {
		this.evnt_nm = evnt_nm;
	}
	public String getTnrm_evnt_levls_cd() {
		return tnrm_evnt_levls_cd;
	}
	public void setTnrm_evnt_levls_cd(String tnrm_evnt_levls_cd) {
		this.tnrm_evnt_levls_cd = tnrm_evnt_levls_cd;
	}
	public String getDsbl_ocrn_stat_val() {
		return dsbl_ocrn_stat_val;
	}
	public void setDsbl_ocrn_stat_val(String dsbl_ocrn_stat_val) {
		this.dsbl_ocrn_stat_val = dsbl_ocrn_stat_val;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getRecover_time() {
		return recover_time;
	}
	public void setRecover_time(String recover_time) {
		this.recover_time = recover_time;
	}
	public String getInsert_time() {
		return insert_time;
	}
	public void setInsert_time(String insert_time) {
		this.insert_time = insert_time;
	}
    
}
