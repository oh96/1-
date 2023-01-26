package kr.co.gudi.dao;

import java.util.ArrayList;

import kr.co.gudi.dto.HomeDTO;

public interface HomeDAO {

   int locationtotalCount();

   ArrayList<HomeDTO> locationTop(int offset);

   int reviewtotalCount();

   ArrayList<HomeDTO> reviewTop(int offset);

   int routetotalCount();

   ArrayList<HomeDTO> routeTop(int offset);


}