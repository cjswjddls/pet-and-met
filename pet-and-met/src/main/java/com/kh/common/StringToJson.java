package com.kh.common;

import java.io.BufferedReader;
import java.io.IOException;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class StringToJson {
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
	    
		return stringToJson(message, key1, key2);
	}

	public static String[] stringToJson(BufferedReader change, String key1, String key2, String key3) throws ParseException, IOException {
		String line = null;
	    String message = new String();
	    final StringBuffer buffer = new StringBuffer(2048);
	    while ((line = change.readLine()) != null) {
	        message += line;
	    }
	    
		return stringToJson(message, key1, key2, key3);
	}
}