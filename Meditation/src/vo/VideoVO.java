package vo;

import java.sql.Date;

public class VideoVO {
	private int viNum;
	private char category;
	private String name;
	private Date viDate;
	private String title;
	private String text;
	
	public VideoVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public VideoVO(int viNum, char category, String name, Date viDate, String title, String text) {
		super();
		this.viNum = viNum;
		this.category = category;
		this.name = name;
		this.viDate = viDate;
		this.title = title;
		this.text = text;
	}

	public int getViNum() {
		return viNum;
	}

	public void setViNum(int viNum) {
		this.viNum = viNum;
	}

	public char getCategory() {
		return category;
	}

	public void setCategory(char category) {
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getViDate() {
		return viDate;
	}

	public void setViDate(Date viDate) {
		this.viDate = viDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
	
	
}
