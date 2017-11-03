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
public class fecSvarVO {

    private static final long serialVersionUID = 1L;    
    //오수
    private String mtnof_cd; //지사코드
    private String svar_cd;//휴게소코드
    private String svar_nm;//휴게소명
    private String equip_code;//설비코드
    private String device_code;//기기코드
    private String dwrm_insr_nm;//기기명
    
    //장애 오수
    private String pltwtr_seq;//순번
    private String office_code;//휴게소코드
    private String dev_time;//관리 시간
    private String phdo;//phdo
    private String type_name;//테이블 타입명
    private String insert_time;//입력시간
    
    //이벤트
    private String event_index;//이벤트일련번호
    private String event_stat;//이벤트 상태	
    private String re;//조치상태
    private String event_time;//이벤트시간
    private String event_division;//고장구분
    private String event_division_nm;//고장구분명칭
    private String point_code;//포인트코드
    private String pont_detl_istc;//포인트 상세설명	
    private String recover_time;//복구시간
    
    
	public String getMtnof_cd() {
		return mtnof_cd;
	}
	public void setMtnof_cd(String mtnof_cd) {
		this.mtnof_cd = mtnof_cd;
	}
	public String getSvar_cd() {
		return svar_cd;
	}
	public void setSvar_cd(String svar_cd) {
		this.svar_cd = svar_cd;
	}
	public String getSvar_nm() {
		return svar_nm;
	}
	public void setSvar_nm(String svar_nm) {
		this.svar_nm = svar_nm;
	}
	public String getEquip_code() {
		return equip_code;
	}
	public void setEquip_code(String equip_code) {
		this.equip_code = equip_code;
	}
	public String getDevice_code() {
		return device_code;
	}
	public void setDevice_code(String device_code) {
		this.device_code = device_code;
	}
	public String getDwrm_insr_nm() {
		return dwrm_insr_nm;
	}
	public void setDwrm_insr_nm(String dwrm_insr_nm) {
		this.dwrm_insr_nm = dwrm_insr_nm;
	}
	public String getPltwtr_seq() {
		return pltwtr_seq;
	}
	public void setPltwtr_seq(String pltwtr_seq) {
		this.pltwtr_seq = pltwtr_seq;
	}
	public String getOffice_code() {
		return office_code;
	}
	public void setOffice_code(String office_code) {
		this.office_code = office_code;
	}
	public String getDev_time() {
		return dev_time;
	}
	public void setDev_time(String dev_time) {
		this.dev_time = dev_time;
	}
	public String getPhdo() {
		return phdo;
	}
	public void setPhdo(String phdo) {
		this.phdo = phdo;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public String getEvent_index() {
		return event_index;
	}
	public void setEvent_index(String event_index) {
		this.event_index = event_index;
	}
	public String getEvent_stat() {
		return event_stat;
	}
	public void setEvent_stat(String event_stat) {
		this.event_stat = event_stat;
	}
	public String getRe() {
		return re;
	}
	public void setRe(String re) {
		this.re = re;
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
	public String getEvent_division_nm() {
		return event_division_nm;
	}
	public void setEvent_division_nm(String event_division_nm) {
		this.event_division_nm = event_division_nm;
	}
	public String getPoint_code() {
		return point_code;
	}
	public void setPoint_code(String point_code) {
		this.point_code = point_code;
	}
	public String getPont_detl_istc() {
		return pont_detl_istc;
	}
	public void setPont_detl_istc(String pont_detl_istc) {
		this.pont_detl_istc = pont_detl_istc;
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
