package vo;

import java.sql.Date;

public class VideoVO {
	private int viNum;
	private String category;
	private String name;
	private Date viDate;
	private String title;
	private String text;
	private String videoUrl;
	private String imgUrl;
	
	public VideoVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public VideoVO(int viNum, String category, String name, Date viDate, String title, String text, String videoUrl,
			String imgUrl) {
		super();
		this.viNum = viNum;
		this.category = category;
		this.name = name;
		this.viDate = viDate;
		this.title = title;
		this.text = text;
		this.videoUrl = videoUrl;
		this.imgUrl = imgUrl;
	}

	public int getViNum() {
		return viNum;
	}

	public void setViNum(int viNum) {
		this.viNum = viNum;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String string) {
		this.category = string;
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

	public String getVideoUrl() {
		return videoUrl;
	}

	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	
	
	
}
