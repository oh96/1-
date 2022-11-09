package kr.co.gudi.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gudi.service.RouteService;


@Controller
public class RouteController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired RouteService routeService;
	
	@RequestMapping(value="/routeWrite")
	public String main() {
		return "routeWrite";
	}
	
	@RequestMapping(value="/routeSearchPopup1")
	public String routeInfoList1() {
		return "routeSearchPopup1";
	}
	@RequestMapping(value="/routeSearchPopup2")
	public String routeInfoList2() {
		return "routeSearchPopup2";
	}
	@RequestMapping(value="/routeSearchPopup3")
	public String routeInfoList3() {
		return "routeSearchPopup3";
	}
	@RequestMapping(value="/routeSearchPopup4")
	public String routeInfoList4() {
		return "routeSearchPopup4";
	}
	@RequestMapping(value="/routeSearchPopup5")
	public String routeInfoList5() {
		return "routeSearchPopup5";
	}
	@RequestMapping(value="/routeSearchPopup6")
	public String routeInfoList6() {
		return "routeSearchPopup6";
	}
	@RequestMapping(value="/routeSearchPopup7")
	public String routeInfoList7() {
		return "routeSearchPopup7";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/trans")
	@ResponseBody
	public HashMap<String, Object> trans(@RequestParam(value="sight[]") List<String> sight, @RequestParam(value="locIdx[]") List<Integer> locIdx
			, @RequestParam String content, @RequestParam String loginId, @RequestParam String title) {
		logger.info(sight+"");
		logger.info(locIdx+"");
		logger.info(content);
		logger.info(loginId);
		logger.info(title);
		
		routeService.routeWrite(loginId, title, content);
		
		Object[] sightName = sight.toArray();
		Object[] locationIdx = locIdx.toArray();
		
		logger.info(sightName.length+"");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for(int i=0; i<sightName.length; i++) {
			
			Object sight1 = sightName[i];
					String doro = routeService.getDoro(sight1);
			logger.info(doro);
			
			String clientId = "i4kv2usz7y";
			String clientSecret = "nZi7a71uL5f2KAgfqK0EJp2xFOfAFuTXpBizhjph";
			//HashMap<String, Object> map = new HashMap<String, Object>();
			
			try {
				String address1 = doro;
				String addr = URLEncoder.encode(address1, "UTF-8");
				String apiURL = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=" + addr;	
				URL url = new URL(apiURL);
				HttpURLConnection con = (HttpURLConnection) url.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
				con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
				int responseCode = con.getResponseCode();
				BufferedReader br;
				if(responseCode == 200) {
					br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
				} else {
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
				String inputLine;
				StringBuffer response = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					response.append(inputLine);
				}
				br.close();
				
				
				JSONTokener tokener = new JSONTokener(response.toString());
				JSONObject object = new JSONObject(tokener);
				
				JSONArray arr = object.getJSONArray("addresses");
				for(int i1=0; i1<arr.length(); i1++) {
					JSONObject temp = (JSONObject) arr.get(i1);
					//map.put("roadAdd", (String)temp.get("roadAddress"));				
					//map.put("jibunAdd", (String)temp.get("jibunAddress"));				
					map.put("X"+(i+1), (String)temp.get("x"));				
					map.put("Y"+(i+1), (String)temp.get("y"));
				}
			} catch (Exception e) {			
			}
		}

		return map;
	}
	@RequestMapping(value="/routeShit")
	@ResponseBody
	public HashMap<String, Object> routeShit(@RequestParam HashMap<String, String> data) {
		logger.info(""+data);
		logger.info(data.size()+"");
		
		String clientId = "i4kv2usz7y";
		String clientSecret = "nZi7a71uL5f2KAgfqK0EJp2xFOfAFuTXpBizhjph";
		HashMap<String, Object> map = new HashMap<String, Object>();
		

		
		String[] dataX1 = new String[data.size()/2+1];
		for(int i=1; i<data.size()/2+1; i++) {
			dataX1[i-1] = data.get("data"+i+"[X]");
			logger.info(dataX1[i-1]);
		}
		String[] dataY1 = new String[data.size()/2+1];
		for(int i=1; i<data.size()/2+1; i++) {
			dataY1[i-1] = data.get("data"+i+"[Y]");
			logger.info(dataY1[i-1]);
		}
		
		
		try {	
			String[] dataX2 = new String[data.size()/2];
			String[] dataY2 = new String[data.size()/2];
			for(int i=0; i<data.size()/2; i++) {
				dataX2[i] = (String) URLEncoder.encode(dataX1[i], "UTF-8");
				logger.info(dataX2[i]+"");
			}
			for(int i=0; i<data.size()/2; i++) {
				dataY2[i] = (String) URLEncoder.encode(dataY1[i], "UTF-8");
				logger.info(dataY2[i]+"");
			}
			
			
			String reqURL = null;
			
			if(dataX2.length == 7 && dataY2.length == 7) {
				reqURL = "https://naveropenapi.apigw.ntruss.com/map-direction-15/v1/driving?start="+dataX2[0]+','+dataY2[0]+"&goal="+dataX2[1]+','+dataY2[1]+"&waypoints="+dataX2[2]+","+dataY2[2]+"|"+dataX2[3]+","+dataY2[3]+"|"+dataX2[4]+","+dataY2[4]+"|"+dataX2[5]+","+dataY2[5]+"|"+dataX2[6]+","+dataY2[6]+"&option=trafast";
			}else if(dataX2.length == 6 && dataY2.length == 6) {
				reqURL = "https://naveropenapi.apigw.ntruss.com/map-direction-15/v1/driving?start="+dataX2[0]+','+dataY2[0]+"&goal="+dataX2[1]+','+dataY2[1]+"&waypoints="+dataX2[2]+","+dataY2[2]+"|"+dataX2[3]+","+dataY2[3]+"|"+dataX2[4]+","+dataY2[4]+"|"+dataX2[5]+","+dataY2[5]+"&option=trafast";
			}else if(dataX2.length == 5 && dataY2.length == 5) {
				reqURL = "https://naveropenapi.apigw.ntruss.com/map-direction-15/v1/driving?start="+dataX2[0]+','+dataY2[0]+"&goal="+dataX2[1]+','+dataY2[1]+"&waypoints="+dataX2[2]+","+dataY2[2]+"|"+dataX2[3]+","+dataY2[3]+"|"+dataX2[4]+","+dataY2[4]+"&option=trafast";
			}else if(dataX2.length == 4 && dataY2.length == 4) {
				reqURL = "https://naveropenapi.apigw.ntruss.com/map-direction-15/v1/driving?start="+dataX2[0]+','+dataY2[0]+"&goal="+dataX2[1]+','+dataY2[1]+"&waypoints="+dataX2[2]+","+dataY2[2]+"|"+dataX2[3]+","+dataY2[3]+"&option=trafast";
			}else if(dataX2.length == 3 && dataY2.length == 3) {
				reqURL = "https://naveropenapi.apigw.ntruss.com/map-direction-15/v1/driving?start="+dataX2[0]+','+dataY2[0]+"&goal="+dataX2[1]+','+dataY2[1]+"&waypoints="+dataX2[2]+","+dataY2[2]+"&option=trafast";
			}else {
				reqURL = "https://naveropenapi.apigw.ntruss.com/map-direction-15/v1/driving?start="+dataX2[0]+','+dataY2[0]+"&goal="+dataX2[1]+','+dataY2[1]+"&option=trafast";
			}
			
			String apiURL = reqURL;
			logger.info(apiURL);
			URL url = new URL(apiURL);
			
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
			con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			
			if(responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
				logger.info("정상");
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				logger.info("에러");
			}

			
			String inputLine;

			
			JSONParser jsonParser = new JSONParser();
			Object obj = null;
			org.json.simple.JSONObject jsonObj = null;
	
			while ((inputLine = br.readLine()) != null) {
				obj=jsonParser.parse(inputLine);
				jsonObj = (org.json.simple.JSONObject) obj;
			}
			
			br.close();
			
			org.json.simple.JSONObject route = (org.json.simple.JSONObject) jsonObj.get("route");
			org.json.simple.JSONArray trafast_arr = (org.json.simple.JSONArray) route.get("trafast");
			org.json.simple.JSONObject trafast_obj = (org.json.simple.JSONObject) trafast_arr.get(0);
			org.json.simple.JSONArray path = (org.json.simple.JSONArray) trafast_obj.get("path");
			
			JSONArray arr = new JSONArray(path);
			ArrayList<Object> list = new ArrayList<Object>();
			for(int i=0;i<arr.length();i++) {
				list.add(arr.getJSONArray(i));
			}	
			
			map.put("path", list);
			
		} catch (Exception e) {			
		}
		
		return map;
	}

}
