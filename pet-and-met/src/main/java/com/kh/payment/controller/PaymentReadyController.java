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

import com.kh.common.StringToJson;
import com.kh.payment.model.service.PaymentService;

/**
 * Servlet implementation class PaymentReadyController
 */
@WebServlet("/payment.ready")
public class PaymentReadyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentReadyController() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		String adminKey = "e39607307b6b713e20a922160d23b7dd";
		String apiKey = "456c01f67377389b8aa979082c5c3662";
		
		String totalAmount = request.getParameter("total_amount");
		String payUserName = request.getParameter("payUserName");
		String sumPrice = request.getParameter("sumPrice");
		String discountPrice = request.getParameter("discountPrice");
		String totalPrice = request.getParameter("totalPrice");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		
		String itemName = "Pet&Met 예약"; // request.getParameter();
		int amount = 8000; // request.getParameter();
		String cid = "TC0ONETIME";
		int reservationNo = 10;
		int memberNo = 30;
		
		String parameter = "cid=" + cid // 가맹점 코드
				+ "&partner_order_id=" + reservationNo // 가맹점 주문번호
				+ "&partner_user_id=" + memberNo // 가맹점 회원 id
				+ "&item_name=" + itemName // 상품명
				+ "&quantity=1" // 상품 수량
				+ "&total_amount=" + amount // 총 금액
				+ "&vat_amount=" + (int)(amount * (10 / 100)) // 부가세
				+ "&tax_free_amount=0" // 상품 비과세 금액
				+ "&approval_url=http://localhost:8888/order/pay/completed" // 결제 성공 시
				+ "&cancel_url=http://localhost:8888/order/pay/cancel" // 결제 취소 시
				+ "&fail_url=http://localhost:8888/order/pay/fail"; // 결제 실패 시
		
		
		URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
		HttpURLConnection connection = (HttpURLConnection) address.openConnection(); // 서버연결
		connection.setRequestMethod("POST");
		connection.setRequestProperty("Authorization", "KakaoAK " + adminKey); // 어드민 키
		connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		connection.setDoOutput(true); // 서버한테 전달할게 있는지 없는지
		
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
		
		InputStreamReader read = new InputStreamReader(receive); // 받은걸 읽는다.
		BufferedReader change = new BufferedReader(read); // 바이트를 읽기 위해 형변환 버퍼리더는 실제로 형변환을 위해 존제하는 클레스는 아니다.
		
		String responseData = change.readLine();
		

		System.out.println(responseData); // 문자열로 형변환을 알아서 해주고 찍어낸다 그리고 본인은 비워진다.
		

		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(responseData);
		*/
		
		/////////////////////
		
		// 받는 부분
		// System.out.println(change.readLine()); // 문자열로 형변환을 알아서 해주고 찍어낸다 그리고 본인은 비워진다.
		// System.out.println(change.readLine().getClass());
		// System.out.println(StringToJson.stringToJson(change, "next_redirect_pc_url").getClass());
		// System.out.println(change);
		
		String adminKey = "e39607307b6b713e20a922160d23b7dd";
		String apiKey = "456c01f67377389b8aa979082c5c3662";
		
		// String domain = "http://192.168.40.19:8888";
		String domain = "http://" + InetAddress.getLocalHost().getHostAddress() + ":8888";
		String redirectSuccess = domain + request.getContextPath() + "/payment.done";
		String redirectHome = domain + request.getContextPath();
		
		String itemName = "Pet&Met 예약"; // request.getParameter();
		int amount = 8000; // request.getParameter();
		String cid = "TC0ONETIME";
		int reservationNo = 10;
		int memberNo = 30;
		int days = 4;
		
		HttpSession session = request.getSession();
		
		// https://blog.naver.com/PostView.naver?blogId=dudghks2814&logNo=222470808715
		try {
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection connection = (HttpURLConnection) address.openConnection(); // 서버연결
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization", "KakaoAK " + adminKey); // 어드민 키
			connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			connection.setDoOutput(true); // 서버한테 전달할게 있는지 없는지
			
			String parameter = "cid=" + cid // 가맹점 코드
					+ "&partner_order_id=" + reservationNo // 가맹점 주문번호
					+ "&partner_user_id=" + memberNo // 가맹점 회원 id
					+ "&item_name=" + itemName // 상품명
					+ "&quantity=" + days // 상품 수량
					+ "&total_amount=" + amount // 총 금액
					+ "&vat_amount=" + (int)(amount * (10 / 100)) // 부가세
					+ "&tax_free_amount=0" // 상품 비과세 금액
					+ "&approval_url=" + redirectSuccess // 결제 성공 시
					+ "&fail_url=" + redirectHome // 결제 실패 시
					+ "&cancel_url=" + redirectHome; // 결제 취소 시
			
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
			String ele[] = StringToJson.stringToJson(change, "next_redirect_pc_url", "tid");
			String url = ele[0];
			String tid = ele[1];
			
			int paymentNo = 10;
			
			request.setAttribute("kakaoUrl", url);
			
			int ins = new PaymentService().insertPayment(tid, paymentNo);
			
			if(ins > 0) { request.getRequestDispatcher("/views/payment/paymentReady.jsp").forward(request, response); }
			else { session.setAttribute("alertMsg", "결제정보 등록중 문제가 발생하였습니다."); response.sendRedirect(request.getContextPath()); }
		}
		catch (Exception e) { 
			e.printStackTrace();
			
			session.setAttribute("alertMsg", "결제중 문제가 발생하였습니다.");
			
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