package egovframework.com.sdtic.ifcrs.service;

/**
 * @Class Name :  IfcUnitVo.java
 * @Description : IfcUnitVo Class
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
public class IfcUnitVO extends IfcDefaultSearchVO {

    private String unit;
    private String unit_name;
    private String unit_order;
    private String gubun;
    private String gubun_name;
    private String gubun_order;
    private String hostname;
    private String server_gubun;
    private String dual;
    private String disk;
    private String cpu;
    private String memory;
    private String con;
    private String con_yn;
    private String ori_gubun;
    private String ori_hostname;
    private String ori_server_gubun;
    private String rownum;
    private String inst_date;
    private String istoday;
    
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getUnit_name() {
		return unit_name;
	}
	public void setUnit_name(String unit_name) {
		this.unit_name = unit_name;
	}
	public String getUnit_order() {
		return unit_order;
	}
	public void setUnit_order(String unit_order) {
		this.unit_order = unit_order;
	}
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getGubun_name() {
		return gubun_name;
	}
	public void setGubun_name(String gubun_name) {
		this.gubun_name = gubun_name;
	}
	public String getGubun_order() {
		return gubun_order;
	}
	public void setGubun_order(String gubun_order) {
		this.gubun_order = gubun_order;
	}
	public String getHostname() {
		return hostname;
	}
	public void setHostname(String hostname) {
		this.hostname = hostname;
	}
	public String getServer_gubun() {
		return server_gubun;
	}
	public void setServer_gubun(String server_gubun) {
		this.server_gubun = server_gubun;
	}
	public String getDual() {
		return dual;
	}
	public void setDual(String dual) {
		this.dual = dual;
	}
	public String getDisk() {
		return disk;
	}
	public void setDisk(String disk) {
		this.disk = disk;
	}
	public String getCpu() {
		return cpu;
	}
	public void setCpu(String cpu) {
		this.cpu = cpu;
	}
	public String getMemory() {
		return memory;
	}
	public void setMemory(String memory) {
		this.memory = memory;
	}
	public String getCon() {
		return con;
	}
	public void setCon(String con) {
		this.con = con;
	}
	public String getCon_yn() {
		return con_yn;
	}
	public void setCon_yn(String con_yn) {
		this.con_yn = con_yn;
	}
	public String getOri_gubun() {
		return ori_gubun;
	}
	public void setOri_gubun(String ori_gubun) {
		this.ori_gubun = ori_gubun;
	}
	public String getOri_hostname() {
		return ori_hostname;
	}
	public void setOri_hostname(String ori_hostname) {
		this.ori_hostname = ori_hostname;
	}
	public String getOri_server_gubun() {
		return ori_server_gubun;
	}
	public void setOri_server_gubun(String ori_server_gubun) {
		this.ori_server_gubun = ori_server_gubun;
	}
	public String getRownum() {
		return rownum;
	}
	public void setRownum(String rownum) {
		this.rownum = rownum;
	}
	public String getInst_date() {
		return inst_date;
	}
	public void setInst_date(String inst_date) {
		this.inst_date = inst_date;
	}
	public String getIstoday() {
		return istoday;
	}
	public void setIstoday(String istoday) {
		this.istoday = istoday;
	}
}