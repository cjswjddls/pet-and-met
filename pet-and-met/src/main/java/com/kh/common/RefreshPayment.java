package com.kh.common;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class RefreshPayment {
	public RefreshPayment() {}
	
	public Boolean check(String tid) {
		String adminKey = "e39607307b6b713e20a922160d23b7dd";
		String cid = "TC0ONETIME";
		
		try {
			URL address = new URL("https://kapi.kakao.com/v1/payment/order");
			HttpURLConnection connection = (HttpURLConnection) address.openConnection(); // 서버연결
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization", "KakaoAK " + adminKey); // 어드민 키
			connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			connection.setDoOutput(true); // 서버한테 전달할게 있는지 없는지
			
			String parameter = "cid=" + cid // 가맹점 코드
					+ "&tid=" + tid; // 결제 고유번호
			
			OutputStream send = connection.getOutputStream(); // 이제 뭔가를 를 줄 수 있다.
			DataOutputStream dataSend = new DataOutputStream(send); // 이제 데이터를 줄 수 있다.
			dataSend.writeBytes(parameter); // OutputStream은 데이터를 바이트 형식으로 주고 받기로 약속되어 있다. (형변환)
			dataSend.close(); // flush가 자동으로 호출이 되고 닫는다. (보내고 비우고 닫다)
			
			int result = connection.getResponseCode(); // 전송 잘 됐나 안됐나 번호를 받는다.
			InputStream receive; // 받다
			
			if(result == 200) {
				receive = connection.getInputStream();
			}else {
				receive = connection.getErrorStream(); 
			}
			// 읽는 부분
			InputStreamReader read = new InputStreamReader(receive); // 받은걸 읽는다.
			BufferedReader change = new BufferedReader(read); // 바이트를 읽기 위해 형변환 버퍼리더는 실제로 형변환을 위해 존제하는 클레스는 아니다.
			// 받는 부분
			System.out.println(change.readLine()); // 문자열로 형변환을 알아서 해주고 찍어낸다 그리고 본인은 비워진다.
			// System.out.println(change.readLine().getClass());
			// System.out.println(StringToJson.stringToJson(change, "next_redirect_pc_url").getClass());
			// String url = StringToJson.stringToJson(change, "next_redirect_pc_url");
		}
		catch (Exception e) { e.printStackTrace(); }
		
		// 안하면 READY
		// ? AUTH_PASSWORD
		return false;
	}
}