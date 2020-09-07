package kosmo62.spomatch.question.vo;

public class SpoQuestionVO {

	private String siq_no;
	private String smb_id;
	private String siq_subject;
	private String siq_content;
	private String siq_deleteyn;
	private String siq_insertdate;
	private String siq_updatedate;
	private String smb_no;
	private String spg_tableno;
	//댓글 갯수
	private String ancnt;
	
	public SpoQuestionVO() {
		
	}
	
	public void setSiq_no(String siq_no) {this.siq_no = siq_no;}
	public void setSmb_id(String smb_id) {this.smb_id = smb_id;}
	public void setSiq_subject(String siq_subject) {this.siq_subject = siq_subject;}
	public void setSiq_content(String siq_content) {this.siq_content = siq_content;}
	public void setSiq_deleteyn(String siq_deleteyn) {this.siq_deleteyn = siq_deleteyn;}
	public void setSiq_insertdate(String siq_insertdate) {this.siq_insertdate = siq_insertdate;}
	public void setSiq_updatedate(String siq_updatedate) {this.siq_updatedate = siq_updatedate;}
	public void setSmb_no(String smb_no) {this.smb_no = smb_no;}
	public void setSpg_tableno(String spg_tableno) {this.spg_tableno = spg_tableno;}
	public void setAncnt(String ancnt) {this.ancnt = ancnt;}
	
	
	public String getSiq_no() {return siq_no;}
	public String getSmb_id() {return smb_id;}
	public String getSiq_subject() {return siq_subject;}
	public String getSiq_content() {return siq_content;}
	public String getSiq_deleteyn() {return siq_deleteyn;}
	public String getSiq_insertdate() {return siq_insertdate;}
	public String getSiq_updatedate() {return siq_updatedate;}
	public String getSmb_no() {return smb_no;}
	public String getSpg_tableno() {return spg_tableno;}
	public String getAncnt() {return ancnt;}
	
}
