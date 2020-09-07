package kosmo62.spomatch.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class ReadJson {
	
	public static String readJsonUrl(String url) {
		BufferedReader br = null;
		String resultSet = null;
		
		try {
			URL urls = new URL(url);
			URLConnection conn = urls.openConnection();
			br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			resultSet = parseJSONData(br);
			
		}catch(Exception e) {
			System.out.println("error >>> "+e.getMessage());
		}finally {
			try {
				br.close();
			}catch(Exception e) {
				System.out.println("error >>> "+e.getMessage());
			}
		}
	
		return resultSet;
	}
	
	public static String parseJSONData(BufferedReader br) {
		
		String resultSet = null;
		
		try {
			JSONParser jp = new JSONParser();
			JSONObject jo = (JSONObject)jp.parse(br);
			
			resultSet = jo.toJSONString();
		}catch(Exception e) {
			System.out.println("error >>> "+e.getMessage());
		}
		return resultSet;
	}
}
