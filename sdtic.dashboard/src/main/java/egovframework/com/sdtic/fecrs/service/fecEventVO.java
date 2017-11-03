package egovframework.com.sdtic.fecrs.service;

/**
 * @Class Name : fecEventVO.java
 * @Description : fecEventVO Class
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
public class fecEventVO {

    private static final long serialVersionUID = 1L;

    // 이벤트
    private String hdqr_nm; //본부명
    private String mtnof_nm; //지사명
    private String mtnof_cd;  //지사코드    
    private String xcord;// 좌표X
    private String ycord;// 좌표Y
    private String coord_type;// 좌표 구분
    private String recover;//복구 조치
    private String content;//이벤트 내용
    private String fclts_name;// 시설명
    private String event_time;// 이벤트 시간
    private String recover_time;// 복구 시간
    private String alarmtime;// 전기(알람)
    private String almlastdate;// 전기(복구알람)
    private String grade;// 등급 
    private String kubun;
    
	public String getHdqr_nm() {
		return hdqr_nm;
	}
	public void setHdqr_nm(String hdqr_nm) {
		this.hdqr_nm = hdqr_nm;
	}
	public String getMtnof_nm() {
		return mtnof_nm;
	}
	public void setMtnof_nm(String mtnof_nm) {
		this.mtnof_nm = mtnof_nm;
	}
	public String getMtnof_cd() {
		return mtnof_cd;
	}
	public void setMtnof_cd(String mtnof_cd) {
		this.mtnof_cd = mtnof_cd;
	}
	public String getXcord() {
		return xcord;
	}
	public void setXcord(String xcord) {
		this.xcord = xcord;
	}
	public String getYcord() {
		return ycord;
	}
	public void setYcord(String ycord) {
		this.ycord = ycord;
	}
	public String getCoord_type() {
		return coord_type;
	}
	public void setCoord_type(String coord_type) {
		this.coord_type = coord_type;
	}
	public String getRecover() {
		return recover;
	}
	public void setRecover(String recover) {
		this.recover = recover;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFclts_name() {
		return fclts_name;
	}
	public void setFclts_name(String fclts_name) {
		this.fclts_name = fclts_name;
	}
	public String getEvent_time() {
		return event_time;
	}
	public void setEvent_time(String event_time) {
		this.event_time = event_time;
	}
	public String getRecover_time() {
		return recover_time;
	}
	public void setRecover_time(String recover_time) {
		this.recover_time = recover_time;
	}
	public String getAlarmtime() {
		return alarmtime;
	}
	public void setAlarmtime(String alarmtime) {
		this.alarmtime = alarmtime;
	}
	public String getAlmlastdate() {
		return almlastdate;
	}
	public void setAlmlastdate(String almlastdate) {
		this.almlastdate = almlastdate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getKubun() {
		return kubun;
	}
	public void setKubun(String kubun) {
		this.kubun = kubun;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
       
    
}
