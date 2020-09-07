package kosmo62.spomatch.chat.vo;

public class SpoChatVO {
	 private String sch_no; 			// 채팅번호
	 private String smc_no;				// 매칭번호 
	 private String smc_subject;		// 매칭제목(채팅방 번호로 표시)
	 private String smb_no;				// 회원제목(발신인)
	 private String smb_id;				// 회원id
	 private String sch_chat;
	 private String sch_resiver;		// 수신인
	 private String sch_checkyn;		// 확인여부
	 private String sch_checkcnt;		// 미확인 갯수
	 private String sch_deleteyn;
	 private String sch_insertdate;		// 입력날짜
	 private String sch_inserttime;		// 입력시간 
	 private String sch_updatedate;
	 
	 
	 
	// default 생성자
	public SpoChatVO() {
	}
	
	public String getSch_no() {
		return sch_no;
	}
	public void setSch_no(String sch_no) {
		this.sch_no = sch_no;
	}
	public String getSmc_no() {
		return smc_no;
	}
	public void setSmc_no(String smc_no) {
		this.smc_no = smc_no;
	}
	public String getSmc_subject() {
		return smc_subject;
	}
	public void setSmc_subject(String smc_subject) {
		this.smc_subject = smc_subject;
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
	public String getSch_chat() {
		return sch_chat;
	}
	public void setSch_chat(String sch_chat) {
		this.sch_chat = sch_chat;
	}
	public String getSch_resiver() {
		return sch_resiver;
	}

	public void setSch_resiver(String sch_resiver) {
		this.sch_resiver = sch_resiver;
	}

	public String getSch_checkyn() {
		return sch_checkyn;
	}
	public void setSch_checkyn(String sch_checkyn) {
		this.sch_checkyn = sch_checkyn;
	}

	public String getSch_checkcnt() {
		return sch_checkcnt;
	}

	public void setSch_checkcnt(String sch_checkcnt) {
		this.sch_checkcnt = sch_checkcnt;
	}

	public String getSch_deleteyn() {
		return sch_deleteyn;
	}
	public void setSch_deleteyn(String sch_deleteyn) {
		this.sch_deleteyn = sch_deleteyn;
	}
	public String getSch_insertdate() {
		return sch_insertdate;
	}
	public void setSch_insertdate(String sch_insertdate) {
		this.sch_insertdate = sch_insertdate;
	}
	public String getSch_inserttime() {
		return sch_inserttime;
	}

	public void setSch_inserttime(String sch_inserttime) {
		this.sch_inserttime = sch_inserttime;
	}

	public String getSch_updatedate() {
		return sch_updatedate;
	}
	public void setSch_updatedate(String sch_updatedate) {
		this.sch_updatedate = sch_updatedate;
	}
	 
	 
}
