package dto;

public class UploadFiles {
	
	private int seqNum ;
	private int ref_seqNum;
	private String savePath;
	private String saveFile;
	private String uploadFile;
	private int fileSize;
	private String fileType;
	private String thumbnail;
	private String wDate;
	
	public int getSeqNum() {
		return seqNum;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public void setSeqNum(int seqNum) {
		this.seqNum = seqNum;
	}
	public int getRef_seqNum() {
		return ref_seqNum;
	}
	public void setRef_seqNum(int ref_seqNum) {
		this.ref_seqNum = ref_seqNum;
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
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	public String getIsDel() {
		return isDel;
	}
	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}
	private String isDel;

}
