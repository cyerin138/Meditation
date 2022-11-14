package vo;

import java.sql.Date;

public class MCommentVO {
	private String category;
	private String name;
	private Date coDate;
	private String text;
	
	public MCommentVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MCommentVO(String category, String name, Date coDate, String text) {
		super();
		this.category = category;
		this.name = name;
		this.coDate = coDate;
		this.text = text;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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
