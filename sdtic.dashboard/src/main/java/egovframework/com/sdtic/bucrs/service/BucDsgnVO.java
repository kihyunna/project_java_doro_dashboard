package egovframework.com.sdtic.bucrs.service;

/**
 * @Class Name :  BucDsgnVo.java
 * @Description : BucDsgnVo Class
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
public class BucDsgnVO {

    private static final long serialVersionUID = 1L;

    private String temp1;
    private String temp2;
    private String temp3;
    private String temp4;
    private String buc_dsgn;
    private String data1;
    private String count;
    private String deliverydata;
    private String connnector;
    
    
    //설계도서 납품현황 db
    private String category;
    private String percentage;
    
    
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPercentage() {
		return percentage;
	}
	public void setPercentage(String percentage) {
		this.percentage = percentage;
	}
	public String getConnnector() {
		return connnector;
	}
	public void setConnnector(String connnector) {
		this.connnector = connnector;
	}
	public String getDeliverydata() {
		return deliverydata;
	}
	public void setDeliverydata(String deliverydata) {
		this.deliverydata = deliverydata;
	}
	public String getData1() {
		return data1;
	}
	public void setData1(String data1) {
		this.data1 = data1;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getBuc_dsgn() {
		return buc_dsgn;
	}
	public void setBuc_dsgn(String buc_dsgn) {
		this.buc_dsgn = buc_dsgn;
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