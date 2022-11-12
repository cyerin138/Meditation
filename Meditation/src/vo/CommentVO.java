package vo;

import java.sql.Date;

public class CommentVO {
	private int viNum;
	private String name;
	private Date coDate;
	private String text;
	
	public CommentVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CommentVO(int viNum, String name, Date coDate, String text) {
		super();
		this.viNum = viNum;
		this.name = name;
		this.coDate = coDate;
		this.text = text;
	}

	public int getViNum() {
		return viNum;
	}

	public void setViNum(int viNum) {
		this.viNum = viNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getCoDate() {
		return coDate;
	}

	public void setCoDate(Date coDate) {
		this.coDate = coDate;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
	
}
