package com.kh.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class StringToJson {
	public static String stringToJson(String code, String key) throws ParseException {
		String result = new String();
		JSONParser jsonParse = new JSONParser();
		JSONObject jsonObj = (JSONObject) jsonParse.parse(code); //code는 json형식을 가지고 있는 string타입
		result = (String)jsonObj.get(key);
		return result;
	}
	
	public static JSONObject stringToJsonByDouble(String code, String key) throws ParseException {
		JSONParser jsonParse = new JSONParser();
		JSONObject jsonObj = (JSONObject) jsonParse.parse(code); //code는 json형식을 가지고 있는 string타입
		return (JSONObject) jsonObj.get(key);
	}
	
	public static String[] stringToJson(String code, String key1, String key2) throws ParseException {
		String result[] = new String[2];
		JSONParser jsonParse = new JSONParser();
		JSONObject jsonObj = (JSONObject) jsonParse.parse(code); //code는 json형식을 가지고 있는 string타입
		result[0] = (String)jsonObj.get(key1);
		result[1] = (String)jsonObj.get(key2);
		return result;
	}
	
	public static String[] stringToJson(String code, String key1, String key2, String key3) throws ParseException {
		String result[] = new String[3];
		JSONParser jsonParse = new JSONParser();
		JSONObject jsonObj = (JSONObject) jsonParse.parse(code); //code는 json형식을 가지고 있는 string타입
		result[0] = (String)jsonObj.get(key1);
		result[1] = (String)jsonObj.get(key2);
		result[2] = (String)jsonObj.get(key3);
		return result;
	}

	public static String[] stringToJson(BufferedReader change, String key1, String key2) throws ParseException, IOException {
		String line = null;
	    String message = new String();
	    final StringBuffer buffer = new StringBuffer(2048);
	    while ((line = change.readLine()) != null) {
	        message += line;
	    }
	    
	    System.out.println(message);
	    
		return stringToJson(message, key1, key2);
	}

	public static String[] stringToJson(BufferedReader change, String key1, String key2, String key3) throws ParseException, IOException {
		String line = null;
	    String message = new String();
	    final StringBuffer buffer = new StringBuffer(2048);
	    while ((line = change.readLine()) != null) {
	        message += line;
	    }
	    
	    System.out.println(message);
	    
		return stringToJson(message, key1, key2, key3);
	}

	public static String[] stringToJsonForCancel(BufferedReader change) throws ParseException, IOException {
		String line = null;
		String message = new String();
	    final StringBuffer buffer = new StringBuffer(2048);
	    while ((line = change.readLine()) != null) {
	        message += line;
	    }
	    
	    System.out.println(message);
		
	    String element[] = new String[3];
	    element[0] = stringToJson(message, "status");
	    element[1] = getKeyToJson(message, "amount", "total");
	    element[2] = getKeyToJson(message, "cancel_available_amount", "total");
	    
		return element;
	}
	
	public static String[] stringToJsonForCancel2(BufferedReader change) throws ParseException, IOException {
		String line = null;
		String message = new String();
		final StringBuffer buffer = new StringBuffer(2048);
	    while ((line = change.readLine()) != null) {
	        message += line;
	    }
	    
	    System.out.println(message);
		
	    String element[] = new String[3];
	    element[0] = stringToJson(message, "aid");
	    element[1] = stringToJson(message, "status");
	    element[2] = getKeyToJson(message, "amount", "total");
	    
		return element;
	}

	private static String getKeyToJson(String code, String key1, String key2) throws ParseException {
		JSONObject newCode = stringToJsonByDouble(code, key1);
		return String.valueOf(newCode.get(key2));
	}
}