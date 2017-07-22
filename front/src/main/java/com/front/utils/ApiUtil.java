package com.front.utils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

public class ApiUtil {

	public static String GetApiUrl(HttpServletRequest request, String url)
	{
		String returnUrl;
		
		if ( isLocalHost(request) )
		{
			returnUrl = "http://127.0.0.1:8081/" + url;
		}
		else
		{
			returnUrl = "http://127.0.0.1:8081/" + url;
		}	
		
		return returnUrl;
	}
	
	public static boolean isLocalHost(HttpServletRequest request)
	{
		if ( request.getServerName().equals("localhost") || request.getServerName().equals("127.0.0.1") || request.getServerName().equals("192.168.0.83") )
			return true;

		return false;
	}

	/**
	 * Get 방식 호출
	 * @param method
	 * @param url
	 */
	public static String CallApi(String method, String url)
	{
		BufferedReader in = null;
		String retValue = "";

		try
		{
			URL obj = new URL(url); // 호출할 url
			HttpURLConnection con = (HttpURLConnection)obj.openConnection();
			con.setRequestMethod(method);

			in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));

			String line = "";
			while((line = in.readLine()) != null)
			{
				retValue += line;
			}
		} catch(Exception e) {
			e.printStackTrace();
	 	} finally {
	 		if(in != null)
 			{
 				try
 				{
 					in.close();
 				} catch(Exception e) {
 					e.printStackTrace();
 				}
 			}
	 	}

		return retValue;
	}

	/**
	 * Post, Put, Delete 방식 호출
	 * 파라미터 하나일 경우
	 * @param method : seq_member=8
	 * @param url
	 */
	public static String CallApi(String method, String url, String param)
	{
		BufferedReader in = null;
		String retValue = "";

		try
		{
			URL obj = new URL(url); // 호출할 url
			HttpURLConnection con = (HttpURLConnection)obj.openConnection();
			con.setRequestMethod(method);
			con.setDoOutput(true);

			OutputStream out_stream = con.getOutputStream();

			out_stream.write( param.getBytes("UTF-8") );
		    out_stream.flush();
		    out_stream.close();

			in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));

			String line;
			while((line = in.readLine()) != null)
			{
				retValue += line;
			}
		} catch(Exception e) {
			e.printStackTrace();
	 	} finally {
	 		if(in != null)
 			{
 				try
 				{
 					in.close();
 				} catch(Exception e) {
 					e.printStackTrace();
 				}
 			}
	 	}
		
		return retValue;
	}
}	
