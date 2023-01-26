package kr.co.gudi.dto;

import java.sql.Date;

public class BlindDTO {

   private int blind_idx;
   private int board_idx;
   private int cls_code;
   private String manager;
   private String block_id;
   private String reason;
   private Date blind_date;
   
   public int getBlind_idx() {
      return blind_idx;
   }
   public void setBlind_idx(int blind_idx) {
      this.blind_idx = blind_idx;
   }
   public int getBoard_idx() {
      return board_idx;
   }
   public void setBoard_idx(int board_idx) {
      this.board_idx = board_idx;
   }
   public int getCls_code() {
      return cls_code;
   }
   public void setCls_code(int cls_code) {
      this.cls_code = cls_code;
   }
   public String getManager() {
      return manager;
   }
   public void setManager(String manager) {
      this.manager = manager;
   }
   public String getBlock_id() {
      return block_id;
   }
   public void setBlock_id(String block_id) {
      this.block_id = block_id;
   }
   public String getReason() {
      return reason;
   }
   public void setReason(String reason) {
      this.reason = reason;
   }
   public Date getBlind_date() {
      return blind_date;
   }
   public void setBlind_date(Date blind_date) {
      this.blind_date = blind_date;
   }
}