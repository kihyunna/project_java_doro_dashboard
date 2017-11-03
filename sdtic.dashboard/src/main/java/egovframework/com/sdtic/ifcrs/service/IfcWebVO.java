package egovframework.com.sdtic.ifcrs.service;

/**
 * @Class Name :  IfcWebVo.java
 * @Description : IfcWebVo Class
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
public class IfcWebVO extends IfcDefaultSearchVO {

    private String gubun;
    private String group1;
    private String group2;
    private String group3;
    private String cre_datetime;
    private String cpu;
    private String memory;
    private String disk;
    private String hh_00;
    private String hh_01;
    private String hh_02;
    private String hh_03;
    private String hh_04;
    private String hh_05;
    private String hh_06;
    private String hh_07;
    private String hh_08;
    private String hh_09;
    private String hh_10;
    private String hh_11;
    private String hh_12;
    private String hh_13;
    private String hh_14;
    private String hh_15;
    private String hh_16;
    private String hh_17;
    private String hh_18;
    private String hh_19;
    private String hh_20;
    private String hh_21;
    private String hh_22;
    private String hh_23;
    private String hh_24;
    private String group1_name;
    private String group2_name;
    private String group3_name;
    private String group1_order;
    private String group2_order;
    private String group3_order;
    
    private String yyyymmdd;
    private String hh;
    private String exec_cnt;
    private String concurrent_vs;
    private String avg_resp_time;
    private String cre_date;
    private String inst_date;
    
    private String cpu_limit;
    private String mem_limit;
    private String disk_limit;
    
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
	public String getGroup3() {
		return group3;
	}
	public void setGroup3(String group3) {
		this.group3 = group3;
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
	public String getHh_00() {
		return hh_00;
	}
	public void setHh_00(String hh_00) {
		this.hh_00 = hh_00;
	}
	public String getHh_01() {
		return hh_01;
	}
	public void setHh_01(String hh_01) {
		this.hh_01 = hh_01;
	}
	public String getHh_02() {
		return hh_02;
	}
	public void setHh_02(String hh_02) {
		this.hh_02 = hh_02;
	}
	public String getHh_03() {
		return hh_03;
	}
	public void setHh_03(String hh_03) {
		this.hh_03 = hh_03;
	}
	public String getHh_04() {
		return hh_04;
	}
	public void setHh_04(String hh_04) {
		this.hh_04 = hh_04;
	}
	public String getHh_05() {
		return hh_05;
	}
	public void setHh_05(String hh_05) {
		this.hh_05 = hh_05;
	}
	public String getHh_06() {
		return hh_06;
	}
	public void setHh_06(String hh_06) {
		this.hh_06 = hh_06;
	}
	public String getHh_07() {
		return hh_07;
	}
	public void setHh_07(String hh_07) {
		this.hh_07 = hh_07;
	}
	public String getHh_08() {
		return hh_08;
	}
	public void setHh_08(String hh_08) {
		this.hh_08 = hh_08;
	}
	public String getHh_09() {
		return hh_09;
	}
	public void setHh_09(String hh_09) {
		this.hh_09 = hh_09;
	}
	public String getHh_10() {
		return hh_10;
	}
	public void setHh_10(String hh_10) {
		this.hh_10 = hh_10;
	}
	public String getHh_11() {
		return hh_11;
	}
	public void setHh_11(String hh_11) {
		this.hh_11 = hh_11;
	}
	public String getHh_12() {
		return hh_12;
	}
	public void setHh_12(String hh_12) {
		this.hh_12 = hh_12;
	}
	public String getHh_13() {
		return hh_13;
	}
	public void setHh_13(String hh_13) {
		this.hh_13 = hh_13;
	}
	public String getHh_14() {
		return hh_14;
	}
	public void setHh_14(String hh_14) {
		this.hh_14 = hh_14;
	}
	public String getHh_15() {
		return hh_15;
	}
	public void setHh_15(String hh_15) {
		this.hh_15 = hh_15;
	}
	public String getHh_16() {
		return hh_16;
	}
	public void setHh_16(String hh_16) {
		this.hh_16 = hh_16;
	}
	public String getHh_17() {
		return hh_17;
	}
	public void setHh_17(String hh_17) {
		this.hh_17 = hh_17;
	}
	public String getHh_18() {
		return hh_18;
	}
	public void setHh_18(String hh_18) {
		this.hh_18 = hh_18;
	}
	public String getHh_19() {
		return hh_19;
	}
	public void setHh_19(String hh_19) {
		this.hh_19 = hh_19;
	}
	public String getHh_20() {
		return hh_20;
	}
	public void setHh_20(String hh_20) {
		this.hh_20 = hh_20;
	}
	public String getHh_21() {
		return hh_21;
	}
	public void setHh_21(String hh_21) {
		this.hh_21 = hh_21;
	}
	public String getHh_22() {
		return hh_22;
	}
	public void setHh_22(String hh_22) {
		this.hh_22 = hh_22;
	}
	public String getHh_23() {
		return hh_23;
	}
	public void setHh_23(String hh_23) {
		this.hh_23 = hh_23;
	}
	public String getHh_24() {
		return hh_24;
	}
	public void setHh_24(String hh_24) {
		this.hh_24 = hh_24;
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
	public String getGroup3_name() {
		return group3_name;
	}
	public void setGroup3_name(String group3_name) {
		this.group3_name = group3_name;
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
	public String getGroup3_order() {
		return group3_order;
	}
	public void setGroup3_order(String group3_order) {
		this.group3_order = group3_order;
	}
	public String getYyyymmdd() {
		return yyyymmdd;
	}
	public void setYyyymmdd(String yyyymmdd) {
		this.yyyymmdd = yyyymmdd;
	}
	public String getHh() {
		return hh;
	}
	public void setHh(String hh) {
		this.hh = hh;
	}
	public String getExec_cnt() {
		return exec_cnt;
	}
	public void setExec_cnt(String exec_cnt) {
		this.exec_cnt = exec_cnt;
	}
	public String getConcurrent_vs() {
		return concurrent_vs;
	}
	public void setConcurrent_vs(String concurrent_vs) {
		this.concurrent_vs = concurrent_vs;
	}
	public String getAvg_resp_time() {
		return avg_resp_time;
	}
	public void setAvg_resp_time(String avg_resp_time) {
		this.avg_resp_time = avg_resp_time;
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
    
}