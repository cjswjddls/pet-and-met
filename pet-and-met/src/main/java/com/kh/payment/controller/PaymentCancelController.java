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
 * Servlet implementation class PaymentCancelController
 */
@WebServlet("/payment.cancel")
public class PaymentCancelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentCancelController() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String adminKey = "";
		String apiKey = "";
		String cid = "";
		String tid = new PaymentService().cancelPaymentPrepare(9);
		try { adminKey = Keys.read(this.getClass().getResource("").getPath() + "..\\..\\common\\keys\\kakaoPay.json", "adminKey"); }
		catch (IOException e) { e.printStackTrace(); } 
		catch (org.json.simple.parser.ParseException e) { e.printStackTrace(); }
		try { apiKey = Keys.read(this.getClass().getResource("").getPath() + "..\\..\\common\\keys\\kakaoPay.json", "apiKey"); }
		catch (IOException e) { e.printStackTrace(); }
		catch (org.json.simple.parser.ParseException e) { e.printStackTrace(); }
		try { cid = Keys.read(this.getClass().getResource("").getPath() + "..\\..\\common\\keys\\kakaoPay.json", "cid"); }
		catch (IOException e) { e.printStackTrace(); }
		catch (org.json.simple.parser.ParseException e) { e.printStackTrace(); }
		
		String domain = "http://" + InetAddress.getLocalHost().getHostAddress() + ":8888";
		
		HttpSession session = request.getSession();
		
		URL address = null;
		HttpURLConnection connection = null;
		String parameter = "";
		
		OutputStream send = null;
		DataOutputStream dataSend = null;
		
		int result = 0;
		InputStream receive = null;
		
		InputStreamReader read = null;
		BufferedReader change = null;
		
		String ele[] = new String[3];
		try {
			address = new URL("https://kapi.kakao.com/v1/payment/order");
			connection = (HttpURLConnection) address.openConnection(); // 서버연결
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization", "KakaoAK " + adminKey); // 어드민 키
			connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			connection.setDoOutput(true); // 서버한테 전달할게 있는지 없는지
			
			parameter = "cid=" + cid // 가맹점 코드
					// + "&tid=" + (String)(request.getAttribute("tid")); // 결제 취소 시
					+ "&tid=" + tid;
			
			send = connection.getOutputStream(); // 이제 뭔가를 를 줄 수 있다.
			dataSend = new DataOutputStream(send); // 이제 데이터를 줄 수 있다.
			dataSend.writeBytes(parameter); // OutputStream은 데이터를 바이트 형식으로 주고 받기로 약속되어 있다. (형변환)
			dataSend.close(); // flush가 자동으로 호출이 되고 닫는다. (보내고 비우고 닫다)
			
			result = connection.getResponseCode(); // 전송 잘 됐나 안됐나 번호를 받는다.
			
			if(result == 200) {
				receive = connection.getInputStream();
			}else {
				receive = connection.getErrorStream(); 
			}
			// 읽는 부분
			read = new InputStreamReader(receive); // 받은걸 읽는다.
			change = new BufferedReader(read); // 바이트를 읽기 위해 형변환 버퍼리더는 실제로 형변환을 위해 존제하는 클레스는 아니다.
			// 받는 부분
			// System.out.println(change.readLine()); // 문자열로 형변환을 알아서 해주고 찍어낸다 그리고 본인은 비워진다.
			// System.out.println(change.readLine().getClass());
			// System.out.println(StringToJson.stringToJson(change, "next_redirect_pc_url").getClass());
			// System.out.println(change);
			ele = StringToJson.stringToJsonForCancel(change);
			String status = ele[0];
			int amount = Integer.parseInt(ele[1]);
			int amountAble = Integer.parseInt(ele[2]);
			
			if(!(status.equals("SUCCESS_PAYMENT"))) {
				session.setAttribute("alertMsg", "결제중 취소된 결제건입니다.");
				response.sendRedirect(request.getContextPath());
			}
			else {
				try {
					address = new URL("https://kapi.kakao.com/v1/payment/cancel");
					connection = (HttpURLConnection) address.openConnection(); // 서버연결
					connection.setRequestMethod("POST");
					connection.setRequestProperty("Authorization", "KakaoAK " + adminKey); // 어드민 키
					connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
					connection.setDoOutput(true); // 서버한테 전달할게 있는지 없는지
					
					parameter = "cid=" + cid // 가맹점 코드
							// + "&tid=" + (String)(request.getAttribute("tid")); // 결제 취소 시
							+ "&tid=" + tid
							+ "&cancel_amount=" + amountAble
							+ "&cancel_tax_free_amount=" + "0";
					
					send = connection.getOutputStream(); // 이제 뭔가를 를 줄 수 있다.
					dataSend = new DataOutputStream(send); // 이제 데이터를 줄 수 있다.
					dataSend.writeBytes(parameter); // OutputStream은 데이터를 바이트 형식으로 주고 받기로 약속되어 있다. (형변환)
					dataSend.close(); // flush가 자동으로 호출이 되고 닫는다. (보내고 비우고 닫다)
					
					result = connection.getResponseCode(); // 전송 잘 됐나 안됐나 번호를 받는다.
					
					if(result == 200) {
						receive = connection.getInputStream();
					}else {
						receive = connection.getErrorStream(); 
					}
					// 읽는 부분
					read = new InputStreamReader(receive); // 받은걸 읽는다.
					change = new BufferedReader(read); // 바이트를 읽기 위해 형변환 버퍼리더는 실제로 형변환을 위해 존제하는 클레스는 아니다.
					// 받는 부분
					// System.out.println(change.readLine()); // 문자열로 형변환을 알아서 해주고 찍어낸다 그리고 본인은 비워진다.
					// System.out.println(change.readLine().getClass());
					// System.out.println(StringToJson.stringToJson(change, "next_redirect_pc_url").getClass());
					// System.out.println(change);
					ele = StringToJson.stringToJsonForCancel2(change);
					String aid = ele[0];
					String statusAfter = ele[1];
					int amountAfter = Integer.parseInt(ele[2]);
					
					int ins = new PaymentService().cancelPayment(tid, aid);
					if((ins > 0) && (statusAfter.equals("CANCEL_PAYMENT"))) { 
						request.setAttribute("tid", tid);
						request.setAttribute("aid", aid);
						request.setAttribute("amount", amount);
						request.setAttribute("amountAfter", amountAfter);
						
						request.getRequestDispatcher("/views/payment/paymentCancel.jsp").forward(request, response);
					}
					else { session.setAttribute("alertMsg", "결제 취소 도중 실패하였습니다."); response.sendRedirect(request.getContextPath()); }
				}
				catch (Exception e) { 
					session.setAttribute("alertMsg", "결제 취소중 문제가 발생하였습니다.");
					response.sendRedirect(request.getContextPath());
				}
			}
		}
		catch (Exception e) { 
			e.printStackTrace();
			
			session.setAttribute("alertMsg", "결제 확인중 문제가 발생하였습니다.");
			response.sendRedirect(request.getContextPath());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}