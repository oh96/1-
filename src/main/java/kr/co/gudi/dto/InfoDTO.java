package kr.co.gudi.dto;

import java.sql.Date;

public class InfoDTO {

   private String board_idx;
   private int cls_code;
   private String id;
   private String board_subject;
   private String board_content;
   private Date reg_date;
   private int hit;
   public String getBoard_idx() {
      return board_idx;
   }
   public void setBoard_idx(String board_idx) {
      this.board_idx = board_idx;
   }
   public int getCls_code() {
      return cls_code;
   }
   public void setCls_code(int cls_code) {
      this.cls_code = cls_code;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getBoard_subject() {
      return board_subject;
   }
   public void setBoard_subject(String board_subject) {
      this.board_subject = board_subject;
   }
   public String getBoard_content() {
      return board_content;
   }
   public void setBoard_content(String board_content) {
      this.board_content = board_content;
   }
   public Date getReg_date() {
      return reg_date;
   }
   public void setReg_date(Date reg_date) {
      this.reg_date = reg_date;
   }
   public int getHit() {
      return hit;
   }
   public void setHit(int hit) {
      this.hit = hit;
   }
   
}