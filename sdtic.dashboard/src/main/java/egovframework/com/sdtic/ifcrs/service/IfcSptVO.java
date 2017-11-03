package egovframework.com.sdtic.ifcrs.service;

/**
 * @Class Name :  IfcSptVo.java
 * @Description : IfcSptVo Class
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
public class IfcSptVO extends IfcDefaultSearchVO {

	private String gubun;
	private String group1;
	private String group2;
	private String cre_datetime;
	private String cpu_total_cnt;
	private String cpu_caution_cnt;
	private String cpu_danger_cnt;
	private String memory_total_cnt;
	private String memory_caution_cnt;
	private String memory_danger_cnt;
	private String disk_total_cnt;
	private String disk_caution_cnt;
	private String disk_danger_cnt;
	private String process_total_cnt;
	private String process_caution_cnt;
	private String process_danger_cnt;
	private String code_name;
	private String cpu;
	private String memory;
	private String disk;
	private String process;
	private String total_cnt;
	private String normal_cnt;
	private String danger_cnt;
	private String group1_name;
	private String group1_order;
	private String group2_name;
	private String group2_order;
	
	private String cpu_limit;
	private String mem_limit;
	private String disk_limit;
	
	private String ip;
	private String os;
	private String inst_date;
	private String cre_date;
	
	private String etc;
	
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
	public String getCpu_total_cnt() {
		return cpu_total_cnt;
	}
	public void setCpu_total_cnt(String cpu_total_cnt) {
		this.cpu_total_cnt = cpu_total_cnt;
	}
	public String getCpu_caution_cnt() {
		return cpu_caution_cnt;
	}
	public void setCpu_caution_cnt(String cpu_caution_cnt) {
		this.cpu_caution_cnt = cpu_caution_cnt;
	}
	public String getCpu_danger_cnt() {
		return cpu_danger_cnt;
	}
	public void setCpu_danger_cnt(String cpu_danger_cnt) {
		this.cpu_danger_cnt = cpu_danger_cnt;
	}
	public String getMemory_total_cnt() {
		return memory_total_cnt;
	}
	public void setMemory_total_cnt(String memory_total_cnt) {
		this.memory_total_cnt = memory_total_cnt;
	}
	public String getMemory_caution_cnt() {
		return memory_caution_cnt;
	}
	public void setMemory_caution_cnt(String memory_caution_cnt) {
		this.memory_caution_cnt = memory_caution_cnt;
	}
	public String getMemory_danger_cnt() {
		return memory_danger_cnt;
	}
	public void setMemory_danger_cnt(String memory_danger_cnt) {
		this.memory_danger_cnt = memory_danger_cnt;
	}
	public String getDisk_total_cnt() {
		return disk_total_cnt;
	}
	public void setDisk_total_cnt(String disk_total_cnt) {
		this.disk_total_cnt = disk_total_cnt;
	}
	public String getDisk_caution_cnt() {
		return disk_caution_cnt;
	}
	public void setDisk_caution_cnt(String disk_caution_cnt) {
		this.disk_caution_cnt = disk_caution_cnt;
	}
	public String getDisk_danger_cnt() {
		return disk_danger_cnt;
	}
	public void setDisk_danger_cnt(String disk_danger_cnt) {
		this.disk_danger_cnt = disk_danger_cnt;
	}
	public String getProcess_total_cnt() {
		return process_total_cnt;
	}
	public void setProcess_total_cnt(String process_total_cnt) {
		this.process_total_cnt = process_total_cnt;
	}
	public String getProcess_caution_cnt() {
		return process_caution_cnt;
	}
	public void setProcess_caution_cnt(String process_caution_cnt) {
		this.process_caution_cnt = process_caution_cnt;
	}
	public String getProcess_danger_cnt() {
		return process_danger_cnt;
	}
	public void setProcess_danger_cnt(String process_danger_cnt) {
		this.process_danger_cnt = process_danger_cnt;
	}
	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
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
	public String getTotal_cnt() {
		return total_cnt;
	}
	public void setTotal_cnt(String total_cnt) {
		this.total_cnt = total_cnt;
	}
	public String getNormal_cnt() {
		return normal_cnt;
	}
	public void setNormal_cnt(String normal_cnt) {
		this.normal_cnt = normal_cnt;
	}
	public String getDanger_cnt() {
		return danger_cnt;
	}
	public void setDanger_cnt(String danger_cnt) {
		this.danger_cnt = danger_cnt;
	}
	public String getGroup1_name() {
		return group1_name;
	}
	public void setGroup1_name(String group1_name) {
		this.group1_name = group1_name;
	}
	public String getGroup1_order() {
		return group1_order;
	}
	public void setGroup1_order(String group1_order) {
		this.group1_order = group1_order;
	}
	public String getGroup2_name() {
		return group2_name;
	}
	public void setGroup2_name(String group2_name) {
		this.group2_name = group2_name;
	}
	public String getGroup2_order() {
		return group2_order;
	}
	public void setGroup2_order(String group2_order) {
		this.group2_order = group2_order;
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
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getOs() {
		return os;
	}
	public void setOs(String os) {
		this.os = os;
	}
	public String getProcess() {
		return process;
	}
	public void setProcess(String process) {
		this.process = process;
	}
	public String getInst_date() {
		return inst_date;
	}
	public void setInst_date(String inst_date) {
		this.inst_date = inst_date;
	}
	public String getCre_date() {
		return cre_date;
	}
	public void setCre_date(String cre_date) {
		this.cre_date = cre_date;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
}