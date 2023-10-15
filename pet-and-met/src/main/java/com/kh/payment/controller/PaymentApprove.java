package com.kh.payment.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.common.Keys;
import com.kh.common.StringToJson;
import com.kh.payment.model.service.PaymentService;

/**
 * Servlet implementation class PaymentApprove
 */
@WebServlet("/payment.approve")
public class PaymentApprove extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentApprove() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		int memberNo = 30;
		
		String adminKey = "";
		String apiKey = "";
		String cid = "";
		int oid = Integer.parseInt(request.getParameter("oid"));
		String token = request.getParameter("pg_token");
		
		String tid = new PaymentService().selectPaymentForTID(oid);
		if((tid==null) || (tid.equals(""))) { session.setAttribute("alertMsg", "결제 번호가 결손됨."); response.sendRedirect(request.getContextPath()); }
		else {
			try { cid = Keys.read(this.getClass().getResource("").getPath() + "..\\..\\common\\keys\\kakaoPay.json", "cid"); }
			catch (IOException e) { e.printStackTrace(); }
			catch (org.json.simple.parser.ParseException e) { e.printStackTrace(); }
			try { adminKey = Keys.read(this.getClass().getResource("").getPath() + "..\\..\\common\\keys\\kakaoPay.json", "adminKey"); }
			catch (IOException e) { e.printStackTrace(); } 
			catch (org.json.simple.parser.ParseException e) { e.printStackTrace(); }
			try { apiKey = Keys.read(this.getClass().getResource("").getPath() + "..\\..\\common\\keys\\kakaoPay.json", "apiKey"); }
			catch (IOException e) { e.printStackTrace(); }
			catch (org.json.simple.parser.ParseException e) { e.printStackTrace(); }
			
			String domain = "http://" + InetAddress.getLocalHost().getHostAddress() + ":8888";
			
			try {
				URL address = new URL("https://kapi.kakao.com/v1/payment/approve");
				HttpURLConnection connection = (HttpURLConnection) address.openConnection(); // 서버연결
				connection.setRequestMethod("POST");
				connection.setRequestProperty("Authorization", "KakaoAK " + adminKey); // 어드민 키
				connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
				connection.setDoOutput(true); // 서버한테 전달할게 있는지 없는지
				
				String parameter = "cid=" + cid // 가맹점 코드
						+ "&tid=" + tid
						+ "&partner_order_id=" + oid
						+ "&partner_user_id=" + memberNo
						+ "&pg_token=" + token;
				
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
				// System.out.println(change.readLine()); // 문자열로 형변환을 알아서 해주고 찍어낸다 그리고 본인은 비워진다.
				// System.out.println(change.readLine().getClass());
				// System.out.println(StringToJson.stringToJson(change, "next_redirect_pc_url").getClass());
				// System.out.println(change);
				
				String ele[] = StringToJson.stringToJson(change, "aid", "payment_method_type", "approved_at");
				String aid = ele[0];
				String method = ele[1];
				String appTime = ele[2];
				
				int updateResult = new PaymentService().updatePaymentDone(tid, aid, method, appTime, oid, memberNo, 1);
				
				if(updateResult > 0) { request.getRequestDispatcher("/views/payment/paymentDone.jsp").forward(request, response); }
				else { session.setAttribute("alertMsg", "결제는 완료되었으나 DB연동에 실패하였습니다. 문의를 진행해주세요."); response.sendRedirect(request.getContextPath()); }
			}
			catch (Exception e) { 
				e.printStackTrace();
				
				session.setAttribute("alertMsg", "결제중 문제가 발생하였습니다.");
				response.sendRedirect(request.getContextPath());
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}