package egovframework.application;

import java.io.IOException;

import net.sf.json.JSONObject;

import org.snmp4j.CommunityTarget;
import org.snmp4j.PDU;
import org.snmp4j.Snmp;
import org.snmp4j.Target;
import org.snmp4j.TransportMapping;
import org.snmp4j.event.ResponseEvent;
import org.snmp4j.mp.SnmpConstants;
import org.snmp4j.smi.Address;
import org.snmp4j.smi.GenericAddress;
import org.snmp4j.smi.OID;
import org.snmp4j.smi.OctetString;
import org.snmp4j.smi.VariableBinding;
import org.snmp4j.transport.DefaultUdpTransportMapping;


public class SNMPClient {

	static SNMPClient client = null;
	static Snmp snmp = null;
	String address = null;


	public SNMPClient(String hostname)
	{
		address = "udp:"+hostname+"/161";
	}


	public static JSONObject snmpInit(String hostname, int osType) throws IOException {  //osType 1: windows,  2: rinus
		client = new SNMPClient(hostname);

		client.start();
		
		String sysDescr = client.getAsString(new OID(".1.3.6.1.2.1.1.1.0"));
		if (sysDescr.equals("-1")) //connect error
		{
			JSONObject obj2 = new JSONObject();
			obj2.put("status", "0");
			return	obj2;
		}
	
		

		double oidCpuUsed = 0;		//사용 CPU 단위 %
		double oidMemoryUsed = 0;	//사용 메모리 단위 %
		double oidUseDisk = 0;		//사용 디스크 단위 %

		if (osType == 1) //Windows OS
		{
			String oidTotMemSize = client.getAsString(new OID(".1.3.6.1.2.1.25.2.2.0"));	//전체 메모리 용량 OID, 단위 KB 
			double totMemory = Double.parseDouble(oidTotMemSize) / 1000.0 / 1000.0; 		//전체 메모리 용량 단위 GB
			double useMemory = getWindowsUseMemory(); 										//실제사용 메모리 용량 단위 GB

			double TotDisk = getWindowsTotDisk(); //하드디스크 총용량 GB
			double useDisk = getWindowsUseDisk(); //하드디스크 사용용량 GB


			oidCpuUsed = getWindowsCpuUsed(); //사용 CPU 단위 %
			if (totMemory == 0.0)	oidMemoryUsed = 0;
			else
				oidMemoryUsed = useMemory / totMemory * 100.0;

			if (TotDisk == 0.0)	oidUseDisk = 0;
			else
				oidUseDisk = useDisk / TotDisk * 100.0;
		}
		else if (osType == 2) //리눅스 OS
		{
			//Memory
			String oidTotSwapSize = client.getAsString(new OID(".1.3.6.1.4.1.2021.4.3.0"));				// 단위 KB 
			String oidTotRamSize = client.getAsString(new OID(".1.3.6.1.4.1.2021.4.5.0"));				//단위 KB 
			double totMemory = Double.parseDouble(oidTotSwapSize) + Double.parseDouble(oidTotRamSize); 	//전체 메모리 용량 단위 KB
			String oidTotRamUsed = client.getAsString(new OID(".1.3.6.1.4.1.2021.4.6.0"));				//메모리 사용량 단위 KB 
			double totRamUsed = Double.parseDouble(oidTotRamUsed); 										//메모리 사용량 단위 KB
			if (totMemory == 0.0)	oidMemoryUsed = 0;
			else
				oidMemoryUsed = totRamUsed / totMemory * 100.0;

			//DISK
			String useDisk = client.getAsString(new OID(".1.3.6.1.4.1.2021.9.1.9.1"));	// 단위 %
			oidUseDisk = Double.parseDouble(useDisk);

			//CPU
			String idleCpuUsed = client.getAsString(new OID(".1.3.6.1.4.1.2021.11.11.0"));	// 단위 %
			oidCpuUsed = 100.0 - Double.parseDouble(idleCpuUsed); //사용 CPU 단위 %
		}
	
		JSONObject obj = new JSONObject();
		obj.put("status", "1");
		obj.put("cpu",Integer.toString((int)oidCpuUsed));
		obj.put("memory",Integer.toString((int)oidMemoryUsed));
		obj.put("disk",Integer.toString((int)oidUseDisk));

		return	obj;
	}

	private static double getWindowsCpuUsed() throws IOException
	{
		double useCpu = 0.0;
		double TempUseCpu = 0.0;
		int inx = 0;
		for (int i=1; i <= 32 ; i++ ) //CPU 갯수만큼 OID 생성 최대 1 ~32 
		{
			String realOid = client.getAsString(new OID(".1.3.6.1.2.1.25.3.3.1.2"+"."+i));
			if (realOid.equals("Null") || realOid.equals("noSuchObject"))
			{
				break;
			}
			else
			{
				inx++;
				TempUseCpu = TempUseCpu + Double.parseDouble(realOid);
			}
		}
		if (inx != 0)
		{
			useCpu = TempUseCpu / inx;
		}

		return  useCpu;
	}

	
	private static  double getWindowsUseMemory() throws IOException
	{
		double useMem = 0.0;
		int inx = 0;
		for (int i=1; i < 32 ; i++ )
		{
			String realOid = client.getAsString(new OID(".1.3.6.1.2.1.25.2.3.1.2"+"."+i));
			if (realOid.equals("1.3.6.1.2.1.25.2.1.2"))
			{
				inx = i;
				break;
			}
			else if (realOid.equals("Null")  || realOid.equals("noSuchObject") )
				break;
		}
		if (inx == 0)	return	useMem;
		
		String unitSize = client.getAsString(new OID(".1.3.6.1.2.1.25.2.3.1.4"+"."+inx));
		String useSize  = client.getAsString(new OID(".1.3.6.1.2.1.25.2.3.1.6"+"."+inx));
		useMem = Double.parseDouble(unitSize)* Double.parseDouble(useSize) / 1000.0/1000.0/1000.0; //단위 GB

		return useMem;
	}

	private static  double getWindowsTotDisk() throws IOException
	{
		double totDisk = 0.0;
		double retTotDisk = 0.0;
		int inx = 0;
		for (int i=1; i < 32 ; i++ )
		{
			String realOid = client.getAsString(new OID(".1.3.6.1.2.1.25.2.3.1.2"+"."+i));
			if (realOid.equals("1.3.6.1.2.1.25.2.1.4"))
			{
				inx++;
				String unitOid = client.getAsString(new OID(".1.3.6.1.2.1.25.2.3.1.4"+"."+i));
				String useOid = client.getAsString(new OID(".1.3.6.1.2.1.25.2.3.1.5"+"."+i));
				totDisk = totDisk + (Double.parseDouble(unitOid) * Double.parseDouble(useOid));
			}
			else if (realOid.equals("Null")  || realOid.equals("noSuchObject"))
				break;
		}
		if (inx == 0)	return	totDisk;
		
		retTotDisk = totDisk / 1000.0/1000.0/1000.0; //단위 GB

		return retTotDisk;
	}


	private static  double getWindowsUseDisk() throws IOException
	{
		double useDisk = 0.0;
		double retUseDisk = 0.0;
		int inx = 0;
		for (int i=1; i < 32 ; i++ )
		{
			String realOid = client.getAsString(new OID(".1.3.6.1.2.1.25.2.3.1.2"+"."+i));
			if (realOid.equals("1.3.6.1.2.1.25.2.1.4"))
			{
				inx++;
				String unitOid = client.getAsString(new OID(".1.3.6.1.2.1.25.2.3.1.4"+"."+i));
				String useOid = client.getAsString(new OID(".1.3.6.1.2.1.25.2.3.1.6"+"."+i));
				useDisk = useDisk + (Double.parseDouble(unitOid) * Double.parseDouble(useOid));
			}
			else if (realOid.equals("Null")  || realOid.equals("noSuchObject"))
				break;
		}
		if (inx == 0)	return	useDisk;
		
		retUseDisk = useDisk / 1000.0/1000.0/1000.0; //단위 GB

		return retUseDisk;
	}


	private void start() throws IOException {
		TransportMapping transport = new DefaultUdpTransportMapping();
		snmp = new Snmp(transport);
		transport.listen();
	}

	public static void stop() throws IOException
	{
		if(snmp!=null)snmp.close();
		snmp = null;
	}

	public String getAsString(OID oid) throws IOException {
		ResponseEvent event = get(new OID[] { oid });
		
		String retError = "-1";
		if (event.getResponse() == null)
			return retError;
	
		return event.getResponse().get(0).getVariable().toString();
	}

	public ResponseEvent get(OID oids[]) throws IOException {
		PDU pdu = new PDU();
		for (OID oid : oids) {
			pdu.add(new VariableBinding(oid));
		}
		pdu.setType(PDU.GET);
		ResponseEvent event = snmp.send(pdu, getTarget(), null);
		if(event != null) {
			//System.out.println("ResponseEvent get...: " + event.getResponse().get(0).getVariable().toString());	
			return event;
		}
		throw new RuntimeException("GET timed out");
	}

	private Target getTarget() {
		Address targetAddress = GenericAddress.parse(address);
		CommunityTarget target = new CommunityTarget();
		target.setCommunity(new OctetString("doros"));
		target.setAddress(targetAddress);
		target.setRetries(2);
		target.setTimeout(1500);
		target.setVersion(SnmpConstants.version2c); //버전 2
		return target;
	}

}
