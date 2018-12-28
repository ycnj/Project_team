package com.team.spring.movie.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.ItemList;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.team.spring.movie.dto.MovieDto;
import com.team.spring.movie.dto.MovieSercDto;

@Repository
public class MovieSercServiceImpl implements MovieSercService{

	@Autowired
    static public String clientId = "nZvqgYuVpsdxDLduE8EE";//애플리케이션 클라이언트 아이디값";
    static public String clientSecret = "fNh_MdpNMG";//애플리케이션 클라이언트 시크릿값";
	
	@Override
	public void Mserc (ModelAndView mView, MovieSercDto dto) {
        StringBuffer response = new StringBuffer();
		List<MovieDto> list=new ArrayList<>();

		String query=dto.getQuery();
		
        try {
            String text = URLEncoder.encode(query, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/movie.json?query="+ text; // json 결과
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            
            br.close();
            JSONParser parser = new JSONParser();
            JSONObject obj = (JSONObject) parser.parse(response.toString());
            JSONArray item= (JSONArray) obj.get("items");
            System.out.println("결과 1:" + item);

            for(int i =0; i<item.size(); i++) {
            	MovieDto dto1=new MovieDto();
            	JSONObject tmp = (JSONObject)item.get(i);        		
        		dto1.setTitle((String)tmp.get("title"));
            	dto1.setImage((String)tmp.get("image"));
            	dto1.setLink((String)tmp.get("link"));
            	dto1.setSubtitle((String)tmp.get("subtitle"));
            	dto1.setDirector((String)tmp.get("director"));
            	dto1.setActor((String)tmp.get("actor"));
            	dto1.setPubDate((String)tmp.get("pubDate"));
            	dto1.setUserRating((String)tmp.get("userRating"));

            	list.add(dto1);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        mView.addObject("list", list);
        
	}

}
