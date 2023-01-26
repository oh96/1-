package kr.co.gudi.dto;

public class HomeDTO {
   
   private String board_idx;
   private String cls_code;
   private String id;
   private String board_subject;
   private String board_content;
   private String reg_date;
   private String hit;
   
   public String getBoard_idx() {
      return board_idx;
   }
   public void setBoard_idx(String board_idx) {
      this.board_idx = board_idx;
   }
   public String getCls_code() {
      return cls_code;
   }
   public void setCls_code(String cls_code) {
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
   public String getReg_date() {
      return reg_date;
   }
   public void setReg_date(String reg_date) {
      this.reg_date = reg_date;
   }
   public String getHit() {
      return hit;
   }
   public void setHit(String hit) {
      this.hit = hit;
   }
   
   

}