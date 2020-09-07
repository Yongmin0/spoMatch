package kosmo62.spomatch.login.vo;

public class SpoLoginVO {
	
	private String smb_no;
	private String smb_id;
	private String smb_pw;
	private String smb_mf;
	private String smb_email;
	private String smb_approval_key;
	private String message;
	
	public SpoLoginVO() {
		
	}

	public SpoLoginVO(String smb_no, String smb_id, String smb_pw, String smb_mf, String smb_email, String smb_approval_key,
			String message) {
	
		this.smb_no = smb_no;
		this.smb_id = smb_id;
		this.smb_pw = smb_pw;
		this.smb_mf = smb_mf;
		this.smb_email = smb_email;
		this.smb_approval_key = smb_approval_key;
		this.message = message;
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

	public String getSmb_pw() {
		return smb_pw;
	}

	public void setSmb_pw(String smb_pw) {
		this.smb_pw = smb_pw;
	}

	public String getSmb_email() {
		return smb_email;
	}

	public void setSmb_email(String smb_email) {
		this.smb_email = smb_email;
	}

	public String getSmb_mf() {
		return smb_mf;
	}

	public void setSmb_mf(String smb_mf) {
		this.smb_mf = smb_mf;
	}

	public String getSmb_approval_key() {
		return smb_approval_key;
	}

	public void setSmb_approval_key(String smb_approval_key) {
		this.smb_approval_key = smb_approval_key;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	

	
}
	
