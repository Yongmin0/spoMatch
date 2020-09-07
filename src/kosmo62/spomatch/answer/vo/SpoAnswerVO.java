package kosmo62.spomatch.answer.vo;

public class SpoAnswerVO {
	//댓글 번호
	private String saw_no;
	//댓글 내용
	private String saw_content;
	//댓글 삭제여부
	private String saw_deleteyn;
	//댓글 입력일
	private String saw_insertdate;
	//댓글 수정일
	private String saw_updatedate;
	//게시판 번호
	private String siq_no;
	
	SpoAnswerVO(){}

	public String getSaw_no() {return saw_no;}
	public String getSaw_content() {return saw_content;}
	public String getSaw_deleteyn() {return saw_deleteyn;}
	public String getSaw_insertdate() {return saw_insertdate;}
	public String getSaw_updatedate() {return saw_updatedate;}
	public String getSiq_no() {return siq_no;}
	
	public void setSaw_no(String saw_no) {this.saw_no = saw_no;}
	public void setSaw_content(String saw_content) {this.saw_content = saw_content;}
	public void setSaw_deleteyn(String saw_deleteyn) {this.saw_deleteyn = saw_deleteyn;}
	public void setSaw_insertdate(String saw_insertdate) {this.saw_insertdate = saw_insertdate;}
	public void setSaw_updatedate(String saw_updatedate) {this.saw_updatedate = saw_updatedate;}
	public void setSiq_no(String siq_no) {this.siq_no = siq_no;}
	
}
