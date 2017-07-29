package com.front.utils;

import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

public class Util {

	@SuppressWarnings("unchecked")
	public static Map<String,Object> ConvertJsonToMap(String json)
	{
		Gson gson = new Gson(); 
		Map<String,Object> map = new HashMap<String,Object>();
		map = (Map<String,Object>) gson.fromJson(json, map.getClass());	
		
		return map;
	}
}
