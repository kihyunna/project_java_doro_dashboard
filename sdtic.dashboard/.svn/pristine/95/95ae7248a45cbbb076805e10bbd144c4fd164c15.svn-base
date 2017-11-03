package egovframework.com.sdtic.fecrs.RTSP;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.StringTokenizer;


public class RTSPcctvCheck {

	private boolean isReal = false;
	private final static String TEST_SERVER_IP = "172.18.9.202";
	private final static String REAL_SERVER_IP = "10.108.88.84";
	private final static int SERVER_PORT = 4000;
	
	private String server_ip = REAL_SERVER_IP;
	

	private final static int HEAD_SIZE = 24;
 
	private int size = 0;
	private int command = 37;
	private int result = 0;
	private int reserved1 = 0;
	private int reserved2 = 0;
	private int checkCode = 268570626;
	
	private String[] requestInfoKey = { "Model" , "User" , "CameraId" , "Resolution" , "RequestId" };
	private String[] requestInfoValue = new String[requestInfoKey.length];

	//==================================
	// byte array
	byte[] bCommand		= new byte[4];
	byte[] bSize		= new byte[4];
	byte[] bResult		= new byte[4];
	byte[] bReserved1	= new byte[4];
	byte[] bReserved2	= new byte[4];
	byte[] bCheckCode	= new byte[4];
	byte[] bRequestInfo	= new byte[100];
	
	private String serviceUrl = "";
		
	
	public RTSPcctvCheck(){
		init();
	}
	
	public RTSPcctvCheck( boolean isReal ){
		this.isReal = isReal;
		init();
	}
	
	public void init(){
		if ( !isReal )	server_ip = TEST_SERVER_IP;
		
//		System.out.println("*************server_ip"+server_ip);
		size = bCommand.length;
		size += bSize.length;
		size += bResult.length;
		size += bReserved1.length;
		size += bReserved2.length;
		size += bCheckCode.length;
		size += bRequestInfo.length;
		
		this.setCommand( command );
		this.setSize( size );
		this.setResult( result );
		this.setReserved1( reserved1 );
		this.setReserved2( reserved2 );
		this.setCheckCode( checkCode );

		requestInfoValue[0] = "Kex";	// Model "Kex" 
	}
	
	public int start(){

		int resultNo = 0;

		Socket socket = null;
		DataOutputStream dos = null;
		DataInputStream dis = null; 
				
		resultNo = this.makeRequestInfo();
		if ( resultNo > 0 ){
//			System.out.println( "=========== RequestInfo ["+this.requestInfoKey[(resultNo-1)]+"] Empty value =========");
			this.serviceUrl = "RequestInfo ["+this.requestInfoKey[(resultNo-1)]+"] Empty value";
			return resultNo;
		}

		int idx = 0;
		byte[] sendData = new byte[this.size];
		System.arraycopy( bCommand, 0, sendData, idx, bCommand.length );
		idx += bCommand.length;
		System.arraycopy( bSize, 0, sendData, idx, bSize.length );
		idx += bSize.length;
		System.arraycopy( bResult, 0, sendData, idx, bResult.length );
		idx += bResult.length;
		System.arraycopy( bReserved1, 0, sendData, idx, bReserved1.length );
		idx += bReserved1.length;
		System.arraycopy( bReserved2, 0, sendData, idx, bReserved2.length );
		idx += bReserved2.length;
		System.arraycopy( bCheckCode, 0, sendData, idx, bCheckCode.length );
		idx += bCheckCode.length;
		System.arraycopy( bRequestInfo, 0, sendData, idx, bRequestInfo.length );
		idx += bRequestInfo.length;
		
		try{

			socket = new Socket( server_ip , SERVER_PORT );
			//===================================================
			dos = new DataOutputStream(new BufferedOutputStream(socket.getOutputStream()));			
			dos.write( sendData, 0, sendData.length );
			dos.flush();

			//===================================================
			dis = new DataInputStream(new BufferedInputStream(socket.getInputStream()));
			byte header[] = new byte[HEAD_SIZE];
		
			dis.read( header , 0 , header.length );
			
			size = 0;
			idx = 0;
			// 0 command / 1 size / 2 result / 3 reserved1 / 4 reserved2 / 5 checkcode
			int headerInfo[] = new int [HEAD_SIZE/4];
			for ( int i = 0 ; i < headerInfo.length ; i++ ){
				byte[] temp = new byte[4];
				System.arraycopy(header, idx, temp, 0, temp.length);
				idx += temp.length;
				headerInfo[i] = this.byteArrayToint(temp);
			}
			
			byte byteBody[] = new byte[headerInfo[1]];
			dis.read( byteBody , 0 , byteBody.length );
			
			String receiveData = new String( byteBody ).trim();
//			System.out.println( "Receive data : " + receiveData );

			String key = "";
			StringTokenizer st = new StringTokenizer(receiveData, "&");
			while( st.hasMoreTokens() ){
				StringTokenizer st2 = new StringTokenizer(st.nextToken(), "=");
				while( st2.hasMoreTokens() ){
					key = st2.nextToken();
					
					// 4096/ 4097
					if ( headerInfo[2] == 4097 ){		
						if ( key.toLowerCase().equals("serviceurl") ){
							serviceUrl = st2.nextToken();
							return 0;
						}
					}else{
						if ( key.toLowerCase().equals("error") ){
							serviceUrl = st2.nextToken();
							return -1;
						}
					}
				}
			}
			
			
		}catch (Exception e){

//			("========System.out.println======== send Exception ===========\n" + e.toString());
			serviceUrl = e.toString();
			return -1;
			
		}finally{
			try{
				dos.close();
				dis.close();
				socket.close();
			}catch( Exception e){
			}
		}
		
		return resultNo;
	}
	

	public String getServiceUrl(){
		return this.serviceUrl;
	}
	
	public void setCommand(int command) {
		this.bCommand = this.intToByteArray(command);
	}

	public void setSize(int size) {
		this.bSize = intToByteArray(size);
	}

	public void setResult(int result) {
		this.bResult = intToByteArray( result );
	}

	public void setReserved1(int reserved1) {
		this.bReserved1 = intToByteArray( reserved1 );
	}

	public void setReserved2(int reserved2) {
		this.bReserved2 = intToByteArray( reserved2 );
	}

	public void setCheckCode(int checkCode) {
		this.bCheckCode = intToByteArray( checkCode , false  );
	}
	
	public void setRequestInfo( String model , String user , String camerId ,String resolution ,String requestId ){
		this.setModel(model);
		this.setUser(user);
		this.setCameraId(camerId);
		this.setResolution(resolution);
		this.setRequestId(requestId);
	}

	public void setModel(String model) {
		requestInfoValue[0] = model;
	}
	
	public void setUser(String user) {
		requestInfoValue[1] = user;
	}
	
	public void setCameraId(String cameraId) {
		requestInfoValue[2] = cameraId;
	}
	
	public void setResolution(String resolution) {
		requestInfoValue[3] = resolution;
	}
	
	
	public void setRequestId(String requestId) {
		requestInfoValue[4] = requestId;
	}

	public int makeRequestInfo() {

		StringBuffer sb = new StringBuffer();
		
		for ( int i = 0 ; i < requestInfoKey.length ; i ++ ){
			if ( this.requestInfoValue[i] == null || this.requestInfoValue[i].length() == 0 ){
				return (i+1);
			}
			
			if ( i > 0 )sb.append( "&" );
			sb.append(this.requestInfoKey[i]+"=");
			sb.append(this.requestInfoValue[i]);
		}
		
//		System.out.println( "RequestInfo : " + sb.toString());

		byte[] temp = sb.toString().getBytes();
		int len = temp.length;
		if ( len > bRequestInfo.length )	len = bRequestInfo.length;
		System.arraycopy(temp, 0, bRequestInfo, 0, len);
		
		return 0;
	}


	public  int byteArrayToint(byte b[]){
		printByteArray( b );
		int result = ((b[3]&0xff)<<24) |((b[2]&0xff)<<16) | ((b[1]&0xff)<<8) | ((b[0]&0xff));
//		System.out.println( "======================= int : " + result );
		return result;
	}
	
	public byte[] intToByteArray( int target ){
		return intToByteArray( target , false );
	}
	
	public byte[] intToByteArray( int target , boolean isBig ){
		ByteBuffer buffer = ByteBuffer.allocate( 4 );
		if ( isBig ){
			buffer.order(ByteOrder.BIG_ENDIAN);
		}else{
			buffer.order(ByteOrder.LITTLE_ENDIAN);
		}
		buffer.putInt( target );
		byte[] bytes = buffer.array();
		printByteArray( bytes );
		return bytes;
	}

	public void printByteArray( byte[] bytes ){
		if ( isReal )	return;
//		System.out.println( "================================================");
		for ( int i = 0 ; i < bytes.length ; i ++ ){
			if ( i > 0 )	System.out.print( " " );
			System.out.format("%2d",(i+1));
		}
//		System.out.println( "" );
		for ( int i = 0 ; i < bytes.length ; i ++ ){
			if ( i > 0 )	System.out.print( " " );
			System.out.format( "%02x" , bytes[i] );
		}
//		System.out.println( "");
	}
}
