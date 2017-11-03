package egovframework.com.sdtic.ifcrs.service;

/**
 * @Class Name :  IfcRlayVo.java
 * @Description : IfcRlayVo Class
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
public class IfcRlayVO extends IfcDefaultSearchVO {

	private String gubun;
    private String group1;
    private String group2;
    private String cre_datetime;
    private String cpu;
    private String memory;
    private String disk;
    private String group1_name;
    private String group2_name;
    private String group1_order;
    private String group2_order;
    private String cre_date;
    private String inst_date;
    
    private String cpu_limit;
    private String mem_limit;
    private String disk_limit;
    
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getGroup1() {
		return group1;
	}
	public void setGroup1(String group1) {
		this.group1 = group1;
	}
	public String getGroup2() {
		return group2;
	}
	public void setGroup2(String group2) {
		this.group2 = group2;
	}
	public String getCre_datetime() {
		return cre_datetime;
	}
	public void setCre_datetime(String cre_datetime) {
		this.cre_datetime = cre_datetime;
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
	public String getDisk() {
		return disk;
	}
	public void setDisk(String disk) {
		this.disk = disk;
	}
	public String getGroup1_name() {
		return group1_name;
	}
	public void setGroup1_name(String group1_name) {
		this.group1_name = group1_name;
	}
	public String getGroup2_name() {
		return group2_name;
	}
	public void setGroup2_name(String group2_name) {
		this.group2_name = group2_name;
	}
	public String getGroup1_order() {
		return group1_order;
	}
	public void setGroup1_order(String group1_order) {
		this.group1_order = group1_order;
	}
	public String getGroup2_order() {
		return group2_order;
	}
	public void setGroup2_order(String group2_order) {
		this.group2_order = group2_order;
	}
	public String getCre_date() {
		return cre_date;
	}
	public void setCre_date(String cre_date) {
		this.cre_date = cre_date;
	}
	public String getInst_date() {
		return inst_date;
	}
	public void setInst_date(String inst_date) {
		this.inst_date = inst_date;
	}
	public String getCpu_limit() {
		return cpu_limit;
	}
	public void setCpu_limit(String cpu_limit) {
		this.cpu_limit = cpu_limit;
	}
	public String getMem_limit() {
		return mem_limit;
	}
	public void setMem_limit(String mem_limit) {
		this.mem_limit = mem_limit;
	}
	public String getDisk_limit() {
		return disk_limit;
	}
	public void setDisk_limit(String disk_limit) {
		this.disk_limit = disk_limit;
	}
	
}