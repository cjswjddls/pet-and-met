package com.kh.common;

import javax.servlet.http.HttpServletRequest;

public class IP {
	/**
	 * 단순히 IP.getClientIP(request)하면 됩니다.
	 * @param request
	 * @return
	 */
	public static String getClientIP(HttpServletRequest request) {
	    String ip = request.getHeader("X-Forwarded-For");

	    if (ip == null) { ip = request.getHeader("Proxy-Client-IP"); }
	    if (ip == null) { ip = request.getHeader("WL-Proxy-Client-IP"); }
	    if (ip == null) { ip = request.getHeader("HTTP_CLIENT_IP"); }
	    if (ip == null) { ip = request.getHeader("HTTP_X_FORWARDED_FOR"); }
	    if (ip == null) { ip = request.getRemoteAddr(); }
	    
	    return ip;
	}
}