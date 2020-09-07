package kosmo62.spomatch.comment.vo;

public class SpoCommentVO {

	
	private String scm_no;
	private String stb_no;
	private String smb_no;
	private String smb_id;
	private String scm_content;
	private String scm_goodcnt;
	private String scm_deleteyn;
	private String scm_insertdate;
	private String scm_updatedate;

	
	public SpoCommentVO() {
		
	}


	public SpoCommentVO(String scm_no, String stb_no, String smb_no, String smb_id, String scm_content,
			String scm_goodcnt, String scm_deleteyn, String scm_insertdate, String scm_updatedate) {
		
		this.scm_no = scm_no;
		this.stb_no = stb_no;
		this.smb_no = smb_no;
		this.smb_id = smb_id;
		this.scm_content = scm_content;
		this.scm_goodcnt = scm_goodcnt;
		this.scm_deleteyn = scm_deleteyn;
		this.scm_insertdate = scm_insertdate;
		this.scm_updatedate = scm_updatedate;
	}


	public String getScm_no() {
		return scm_no;
	}


	public void setScm_no(String scm_no) {
		this.scm_no = scm_no;
	}


	public String getStb_no() {
		return stb_no;
	}


	public void setStb_no(String stb_no) {
		this.stb_no = stb_no;
	}


	public String getSmb_no() {
		return smb_no;
	}


	public void setSmb_no(String smb_no) {
		this.smb_no = smb_no;
	}


	public String getSmb_id() {
		return smb_id;
	}


	public void setSmb_id(String smb_id) {
		this.smb_id = smb_id;
	}


	public String getScm_content() {
		return scm_content;
	}


	public void setScm_content(String scm_content) {
		this.scm_content = scm_content;
	}


	public String getScm_goodcnt() {
		return scm_goodcnt;
	}


	public void setScm_goodcnt(String scm_goodcnt) {
		this.scm_goodcnt = scm_goodcnt;
	}


	public String getScm_deleteyn() {
		return scm_deleteyn;
	}


	public void setScm_deleteyn(String scm_deleteyn) {
		this.scm_deleteyn = scm_deleteyn;
	}


	public String getScm_insertdate() {
		return scm_insertdate;
	}


	public void setScm_insertdate(String scm_insertdate) {
		this.scm_insertdate = scm_insertdate;
	}


	public String getScm_updatedate() {
		return scm_updatedate;
	}


	public void setScm_updatedate(String scm_updatedate) {
		this.scm_updatedate = scm_updatedate;
	}


	
}
