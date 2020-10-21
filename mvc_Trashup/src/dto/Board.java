package dto;

public class Board {
	
	private int rowNum;
	private int seqNum ;
	private String title;
	private String content;
	private String id;
	private String savePath;
	private String saveFile;
	private String uploadFile;
	private String mDate;
	private String wDate;
	private String category;
	private String isOpen;
	private int cnt;
	

	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public int getSeqNum() {
		return seqNum;
	}
	public void setSeqNum(int seqNum) {
		this.seqNum = seqNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public String getSaveFile() {
		return saveFile;
	}
	public void setSaveFile(String saveFile) {
		this.saveFile = saveFile;
	}
	public String getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(String uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getmDate() {
		return mDate;
	}
	public void setmDate(String mDate) {
		this.mDate = mDate;
	}
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getIsOpen() {
		return isOpen;
	}
	public void setIsOpen(String isOpen) {
		this.isOpen = isOpen;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
}
