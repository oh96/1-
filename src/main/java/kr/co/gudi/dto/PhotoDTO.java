package kr.co.gudi.dto;

import java.sql.Date;

public class PhotoDTO {

	private int photo_idx;
	private int board_idx;
	private String oriFileName;
	private String newFileName;
	private Date photo_date;
	
	public int getPhoto_idx() {
		return photo_idx;
	}
	public void setPhoto_idx(int photo_idx) {
		this.photo_idx = photo_idx;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getOriFileName() {
		return oriFileName;
	}
	public void setOriFileName(String oriFileName) {
		this.oriFileName = oriFileName;
	}
	public String getNewFileName() {
		return newFileName;
	}
	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}
	public Date getPhoto_date() {
		return photo_date;
	}
	public void setPhoto_date(Date photo_date) {
		this.photo_date = photo_date;
	}
}
