package kr.co.gudi.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.gudi.service.RouteService;

@Controller
public class RouteController {
   
   Logger logger = LoggerFactory.getLogger(this.getClass());
   
   @Autowired RouteService routeService;
   
//   @RequestMapping(value="/routeWrite")
//   public String main() {
//      return "routeWrite";
//   }
   
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
   
//   @RequestMapping(value="/routeList2")
//   public String routeList2(Model model) {
//      
//      String page = "여행지경로";
//      model.addAttribute("page", page);
//      
//      return "main";
//   }
   
   
   @RequestMapping(value="/routeWrite1")
   @ResponseBody
   public HashMap<String, Object> routeWrite1(@RequestParam(value="locIdx[]") List<Integer> locIdx, 
         @RequestParam String content, @RequestParam String loginId, @RequestParam String title) {

      Object[] locationIdx = locIdx.toArray();
      
      int board_idx = routeService.routeWrite(locationIdx, loginId, title, content);   
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("board_idx", board_idx);
      return map;
   }
   
   
   @RequestMapping(value="/routeListCall")
      @ResponseBody
      public HashMap<String, Object> routeListCall(@RequestParam int page) {

         return routeService.routelist(page);
      }
   
   @RequestMapping(value="/commentListCall")
   @ResponseBody
   public HashMap<String, Object> commentListCall(@RequestParam int page, @RequestParam int board_idx) {
      
      return routeService.commentList(board_idx, page);
   }
   
   
   
   
   @RequestMapping(value = "/routeDetail")
   public String reviewDetail(Model model,
         @RequestParam String board_idx) {

      String page = "여행지경로";
      List<HashMap<String, Object>> map = routeService.routeDetail(board_idx);
      HashMap<String, String> latlng = new HashMap<String, String>();

      Object[] information = new Object[map.size()];
      information = map.toArray();
      //logger.info(information[0]+"");
      HashMap<String, String> routeDetailInfo = (HashMap<String, String>) information[0];

      if (map != null) {
         page = "여행지경로상세보기";
         model.addAttribute("page", page);
         model.addAttribute("routeDetailInfo",routeDetailInfo);
      }
      
      String address = null;
      
      for(int i=0; i<map.size(); i++) {
         HashMap<String, String> info = (HashMap<String, String>) information[i];
         if(info.get("road_address").length()>0 ) {
            address = info.get("road_address");
         }else {
            address = info.get("land_address");
         }

         
         
         String clientId = "i4kv2usz7y";
         String clientSecret = "nZi7a71uL5f2KAgfqK0EJp2xFOfAFuTXpBizhjph";
         //HashMap<String, Object> map = new HashMap<String, Object>();
         
         try {
            String addr = URLEncoder.encode(address, "UTF-8");
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
               latlng.put("X"+(i+1), (String) temp.get("x"));
               latlng.put("Y"+(i+1), (String) temp.get("y"));

            }
         } catch (Exception e) {         
         }
      }

      
      String clientId = "i4kv2usz7y";
      String clientSecret = "nZi7a71uL5f2KAgfqK0EJp2xFOfAFuTXpBizhjph";

      String[] lng1 = new String[latlng.size()/2];
      for(int i=0; i<latlng.size()/2; i++) {
         
         lng1[i] = latlng.get("X"+(i+1));

      }
      String[] lat1 = new String[latlng.size()/2];
      for(int i=0; i<latlng.size()/2; i++) {
         
         lat1[i] = latlng.get("Y"+(i+1));

      }
      
      try {   
         String[] lng = new String[latlng.size()/2];
         String[] lat = new String[latlng.size()/2];
         for(int i=0; i<latlng.size()/2; i++) {
            
            lng[i] = (String) URLEncoder.encode(lng1[i], "UTF-8");

         }
         for(int i=0; i<latlng.size()/2; i++) {
            
            lat[i] = (String) URLEncoder.encode(lat1[i], "UTF-8");

         }
         
         model.addAttribute("lng", Arrays.toString(lng));
         model.addAttribute("lat", Arrays.toString(lat));
         
         String reqURL = null;
         
         if(lng.length == 7 && lat.length == 7) {
            reqURL = "https://naveropenapi.apigw.ntruss.com/map-direction-15/v1/driving?start="+lng[0]+','+lat[0]+"&goal="+lng[1]+','+lat[1]+"&waypoints="+lng[2]+","+lat[2]+"|"+lng[3]+","+lat[3]+"|"+lng[4]+","+lat[4]+"|"+lng[5]+","+lat[5]+"|"+lng[6]+","+lat[6]+"&option=trafast";
         }else if(lng.length == 6 && lat.length == 6) {
            reqURL = "https://naveropenapi.apigw.ntruss.com/map-direction-15/v1/driving?start="+lng[0]+','+lat[0]+"&goal="+lng[1]+','+lat[1]+"&waypoints="+lng[2]+","+lat[2]+"|"+lng[3]+","+lat[3]+"|"+lng[4]+","+lat[4]+"|"+lng[5]+","+lat[5]+"&option=trafast";
         }else if(lng.length == 5 && lat.length == 5) {
            reqURL = "https://naveropenapi.apigw.ntruss.com/map-direction-15/v1/driving?start="+lng[0]+','+lat[0]+"&goal="+lng[1]+','+lat[1]+"&waypoints="+lng[2]+","+lat[2]+"|"+lng[3]+","+lat[3]+"|"+lng[4]+","+lat[4]+"&option=trafast";
         }else if(lng.length == 4 && lat.length == 4) {
            reqURL = "https://naveropenapi.apigw.ntruss.com/map-direction-15/v1/driving?start="+lng[0]+','+lat[0]+"&goal="+lng[1]+','+lat[1]+"&waypoints="+lng[2]+","+lat[2]+"|"+lng[3]+","+lat[3]+"&option=trafast";
         }else if(lng.length == 3 && lat.length == 3) {
            reqURL = "https://naveropenapi.apigw.ntruss.com/map-direction-15/v1/driving?start="+lng[0]+','+lat[0]+"&goal="+lng[1]+','+lat[1]+"&waypoints="+lng[2]+","+lat[2]+"&option=trafast";
         }else {
            reqURL = "https://naveropenapi.apigw.ntruss.com/map-direction-15/v1/driving?start="+lng[0]+','+lat[0]+"&goal="+lng[1]+','+lat[1]+"&option=trafast";
         }
      
         String apiURL = reqURL;

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

         
         model.addAttribute("polypath", list);
      } catch (Exception e) {         
      }
      
      return "main";
   }
   
      @RequestMapping(value="/routeUpdateForm")
      public String routeUpdateForm(Model model, @RequestParam String board_idx) {

         String page = "여행지경로수정하기";
         
         List<HashMap<String, Object>> routeInfo1 = routeService.routeInfo(board_idx);

         Object[] routeInfo = new Object[routeInfo1.size()];
         routeInfo = routeInfo1.toArray();

         HashMap<String, String> routeUpdateInfo = (HashMap<String, String>) routeInfo[0];
         model.addAttribute("subject", routeUpdateInfo.get("board_subject"));
         model.addAttribute("content", routeUpdateInfo.get("board_content"));

         Integer[] locIdx = new Integer[routeInfo1.size()];
         String[] locName = new String[routeInfo1.size()];
         for(int i = 0; i<routeInfo1.size(); i++) {
            HashMap<String, Object> info = (HashMap<String, Object>) routeInfo[i];
            locIdx[i] = (Integer) info.get("loc_idx");
            locName[i] = (String) info.get("loc_name");
         }
        
//         HashMap<String, Object> locationIdx = new HashMap<String, Object>();
//         for(int x=0; x<locIdx.length; x++) {
//            locationIdx.put("위치"+(x+1), locIdx[x]);
//         }
//         HashMap<String, Object> locationName = new HashMap<String, Object>();
//         for(int y=0; y<locName.length; y++) {
//            locationName.put("여행지명"+(y+1), locName[y]);
//         }
         ArrayList<Object> list = new ArrayList<Object>();
         for(int i3=0;i3<locName.length;i3++) {
            list.add(locName[i3]);
         }   

         
         
         
         model.addAttribute("locIdx", Arrays.toString(locIdx));
         model.addAttribute("locName", list);  
         model.addAttribute("page", page);
         model.addAttribute("board_idx", board_idx);
         return "main";
      }
      
      @RequestMapping(value="/routeUpdate")
      @ResponseBody
      public HashMap<String, Object> routeUpdate(@RequestParam(value="locIdx[]") List<Integer> locIdx, 
            @RequestParam String content, @RequestParam String title, @RequestParam int board_idx) {

         Object[] locationIdx = locIdx.toArray();

         routeService.routeUpdate(locationIdx, title, content, board_idx);   
         
         HashMap<String, Object> map = new HashMap<String, Object>();
         map.put("board_idx", board_idx);
         
         
         return map;
      }
      
      @RequestMapping(value="/commentWrite")
      @ResponseBody
      public HashMap<String, Object> commentWrite(@RequestParam String board, @RequestParam String comment, @RequestParam int rating, @RequestParam String loginId) {
         HashMap<String, Object> map = new HashMap<String, Object>();
         logger.info(board+" / "+comment+" / "+rating+" / "+loginId);
         
         int row = routeService.reWrite(loginId, board);
         
         if(row == 0) {
            routeService.commentWrite(board, loginId, comment, rating);
            map.put("msg", "댓글 작성 완료!");
         }else {
            map.put("msg", "이미 이 글에 평가를 하였습니다.");
         }
         
         return map;
      }
      
      @RequestMapping(value="/routeErase")
      public String routeErase(Model model ,@RequestParam int board_idx) {
         String page = "여행지경로";
         
         routeService.routeErase(board_idx);
         
         
         
         model.addAttribute("page", page);
         return "main";
      }
      
      @RequestMapping(value="/routeBlindForm")
      public String routeBlindForm(Model model, @RequestParam int board_idx) {
         
         String page = "경로블라인드글쓰기";
         
         String authorId = routeService.routeBlindInfo(board_idx);
         
         
         
         model.addAttribute("page", page);
         model.addAttribute("authorId", authorId);
         model.addAttribute("board_idx", board_idx);
         
         return "main";
      }
      
      @RequestMapping(value="/routeBlind")
      @ResponseBody
      public HashMap<String, Object> routeBlind(HttpServletRequest req ,@RequestParam int board_idx, @RequestParam String authorId, @RequestParam String reason) {
         HashMap<String, Object> map = new HashMap<String, Object>();
         HttpSession session = req.getSession();
         String id = (String) session.getAttribute("loginId");
         
         
         routeService.routeBlind(board_idx, id, authorId, reason);
         
         map.put("result", "성공~~");
         
         return map;
      }
      
      @RequestMapping(value="/commentDelete")
      @ResponseBody
      public HashMap<String, Object> commentDelete(@RequestParam int comment_idx) {
         
         HashMap<String, Object> map = new HashMap<String, Object>();
         
         routeService.commentDelete(comment_idx);
         
         
         
         map.put("success", "성공했음");
         
         
         
         
         return map;
      }
      
      
      

}