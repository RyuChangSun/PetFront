package com.front.board.dao;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.front.board.domain.Board;
import com.front.utils.ApiUtil;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@Service("boardDao")
public class BoardDaoImpl implements BoardDao{
    
	@Override
	public Map<String, Object> boardList(String method, String url, String params)
	{
		ObjectMapper mapper = new ObjectMapper();
		Gson gson = new Gson(); 
		String json = ApiUtil.CallApi(method, url, params);
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map = mapper.readValue(json, new TypeReference<Map<String, String>>(){});
		
		map = (Map<String,Object>) gson.fromJson(json, map.getClass());
		System.out.println("xxxxxxxx///"+map);
		
		
		/*Gson gson = new Gson(); 
		String jsonString = "[{'id':'jekalmin','name':'Min','age':26,'address':'Seoul'},{'id':'park','name':'park','age':27,'address':'Seoul'},{'id':'kim','name':'kim','age':28,'address':'Incheon'}]"; 
		// 방법1 
		Board[] array = gson.fromJson(jsonString, Board[].class); 
		List<Board> list = Arrays.asList(array); 
		// 방법2 
		List<Board> list2 = gson.fromJson(jsonString, new TypeToken<List<Board>>(){}.getType()); 
		
		System.out.println(list); System.out.println(list2);*/


		return map;
	}
}
