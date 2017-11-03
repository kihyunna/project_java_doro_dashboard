package egovframework.application;

import java.sql.*;

import org.springframework.beans.factory.annotation.Autowired;

import egovframework.com.sdtic.fecrs.service.impl.fecTotlInsrDAO;

public class backgroundInstanceClass {
	private static backgroundInstanceClass instance = null;
	
	private static final String backDRIVER = "oracle.jdbc.driver.OracleDriver";
    private static final String backURL = "jdbc:oracle:thin:@172.16.166.28:1568:CSM";
    private static final String backUSER = "CSM_MAIN";
    private static final String backPW = "CSMMAINexdb#1";

    
	private boolean bExcute = false;
	
	@Autowired
	private fecTotlInsrDAO fecTotlInsr;
    
    public static backgroundInstanceClass getInstance()
    {
    	if (instance == null){
    		instance = new backgroundInstanceClass();
    		
    		//Driver Loading
            try {
				Class.forName(backDRIVER);
				//Connection            
	            Connection con = DriverManager.getConnection(backURL,backUSER,backPW);
	            String sql = "select stat from IOC_SDTIC_SCHEDULER_STATE";
	            
	            PreparedStatement pstmt = con.prepareStatement(sql);
	            ResultSet rs = pstmt.executeQuery();
	            
	            int nResult = 0;
	            while(rs.next()){         
	            	nResult =  rs.getInt("stat");
	            }
	            
	            
	          //Updating with using by PrepareStatement
	            String updateQuery = "update IOC_SDTIC_SCHEDULER_STATE set stat = ?";
	            pstmt = con.prepareStatement(updateQuery);
	            
	            int param = 0;
	            if (nResult == 1){
	            	instance.setExcute(true);
	            	param = 2;
	            	
	            	
	            }else{
	            	instance.setExcute(false);
	            	param = 1;
	            }
	            
	            pstmt.setInt(1, param);
	            pstmt.executeUpdate();
	            
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

    	}
    	
        return instance;
    }    

    public boolean getExcute()
    {
    	return this.bExcute ;
    } 
    
    public void setExcute(boolean bExcute)
    {
    	this.bExcute = bExcute;
    } 
    
   
}