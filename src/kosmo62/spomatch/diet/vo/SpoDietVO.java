package kosmo62.spomatch.diet.vo;

public class SpoDietVO {
	private String sdi_no;
	private String sdi_breakfast;
	private String sdi_lunch;
	private String sdi_dinner;
	private String sdi_cal;
	private String sdi_tan;
	private String sdi_dan;
	private String sdi_fat;
	private String sdi_sugar;
	private String sdi_salt;
	private String sdi_col;
	private String sdi_fatacid;
	private String sdi_trans;
	private String sdi_dietdate;
	private String sdi_deleteyn;
	private String sdi_insertdate;
	private String sdi_updatedate;
	private String smb_no;
	
	// 체중 데이터 =======================
	private String smb_id;
	private String smb_height;
	private String smb_weight;
	private String smb_g_weight;
	private String smb_activity;
	private String smb_dailycal;
	
	// 식품정보 =======================
	private String sdi_serving_size;
	
	


	public SpoDietVO() {
		
	}
	
	
	public SpoDietVO(String sdi_no, String sdi_breakfast, String sdi_lunch, 
					 String sdi_dinner, String smb_dailycal, String sdi_cal, 
					 String sdi_tan, String sdi_dan, String sdi_fat, 
					 String sdi_sugar, String sdi_salt, String sdi_dietdate, 
					 String sdi_deleteyn, String sdi_insertdate, String sdi_updatedate, 
					 String smb_no) {
		this.sdi_no = sdi_no;
		this.sdi_breakfast = sdi_breakfast;
		this.sdi_lunch = sdi_lunch;
		this.sdi_dinner = sdi_dinner;
		this.smb_dailycal = smb_dailycal;
		this.sdi_cal = sdi_cal;
		this.sdi_tan = sdi_tan;
		this.sdi_dan = sdi_dan;
		this.sdi_fat = sdi_fat;
		this.sdi_sugar = sdi_sugar;
		this.sdi_salt = sdi_salt;
		this.sdi_dietdate = sdi_dietdate;
		this.sdi_deleteyn = sdi_deleteyn;
		this.sdi_insertdate = sdi_insertdate;
		this.sdi_updatedate = sdi_updatedate;
		this.smb_no = smb_no;
	}


	public String getSdi_col() {
		return sdi_col;
	}
	
	
	public void setSdi_col(String sdi_col) {
		this.sdi_col = sdi_col;
	}
	
	
	public String getSdi_fatacid() {
		return sdi_fatacid;
	}
	
	
	public void setSdi_fatacid(String sdi_fatacid) {
		this.sdi_fatacid = sdi_fatacid;
	}
	
	
	public String getSdi_trans() {
		return sdi_trans;
	}
	
	
	public void setSdi_trans(String sdi_trans) {
		this.sdi_trans = sdi_trans;
	}
	
	
	public String getSdi_serving_size() {
		return sdi_serving_size;
	}
	
	public String getSdi_no() {
		return sdi_no;
	}
	public void setSdi_no(String sdi_no) {
		this.sdi_no = sdi_no;
	}
	public String getSdi_breakfast() {
		return sdi_breakfast;
	}
	public void setSdi_breackfast(String sdi_breakfast) {
		this.sdi_breakfast = sdi_breakfast;
	}
	public String getSdi_lunch() {
		return sdi_lunch;
	}
	public void setSdi_lunch(String sdi_lunch) {
		this.sdi_lunch = sdi_lunch;
	}
	public String getSdi_dinner() {
		return sdi_dinner;
	}
	public void setSdi_dinner(String sdi_dinner) {
		this.sdi_dinner = sdi_dinner;
	}
	public String getSmb_dailycal() {
		return smb_dailycal;
	}
	public void setSmb_dailycal(String smb_dailycal) {
		this.smb_dailycal = smb_dailycal;
	}
	public String getSdi_cal() {
		return sdi_cal;
	}
	public void setSdi_cal(String sdi_cal) {
		this.sdi_cal = sdi_cal;
	}
	public String getSdi_tan() {
		return sdi_tan;
	}
	public void setSdi_tan(String sdi_tan) {
		this.sdi_tan = sdi_tan;
	}
	public String getSdi_dan() {
		return sdi_dan;
	}
	public void setSdi_dan(String sdi_dan) {
		this.sdi_dan = sdi_dan;
	}
	public String getSdi_fat() {
		return sdi_fat;
	}
	public void setSdi_fat(String sdi_fat) {
		this.sdi_fat = sdi_fat;
	}
	public String getSdi_sugar() {
		return sdi_sugar;
	}
	public void setSdi_sugar(String sdi_sugar) {
		this.sdi_sugar = sdi_sugar;
	}
	public String getSdi_salt() {
		return sdi_salt;
	}
	public void setSdi_salt(String sdi_salt) {
		this.sdi_salt = sdi_salt;
	}
	public String getSdi_dietdate() {
		return sdi_dietdate;
	}
	public void setSdi_dietdate(String sdi_dietdate) {
		this.sdi_dietdate = sdi_dietdate;
	}
	public String getSdi_deleteyn() {
		return sdi_deleteyn;
	}
	public void setSdi_deleteyn(String sdi_deleteyn) {
		this.sdi_deleteyn = sdi_deleteyn;
	}
	public String getSdi_insertdate() {
		return sdi_insertdate;
	}
	public void setSdi_insertdate(String sdi_insertdate) {
		this.sdi_insertdate = sdi_insertdate;
	}
	public String getSdi_updatedate() {
		return sdi_updatedate;
	}
	public void setSdi_updatedate(String sdi_updatedate) {
		this.sdi_updatedate = sdi_updatedate;
	}
	public String getSmb_no() {
		return smb_no;
	}
	public void setSmb_no(String smb_no) {
		this.smb_no = smb_no;
	}
	
	// 체중 데이터===========================================================

	public String getSmb_id() {
		return smb_id;
	}

	public void setSmb_id(String smb_id) {
		this.smb_id = smb_id;
	}
	public String getSmb_height() {
		return smb_height;
	}
	
	
	public void setSmb_height(String smb_height) {
		this.smb_height = smb_height;
	}


	public String getSmb_weight() {
		return smb_weight;
	}


	public void setSmb_weight(String smb_weight) {
		this.smb_weight = smb_weight;
	}


	public String getSmb_g_weight() {
		return smb_g_weight;
	}


	public void setSmb_g_weight(String smb_g_weight) {
		this.smb_g_weight = smb_g_weight;
	}


	public String getSmb_activity() {
		return smb_activity;
	}


	public void setSmb_activity(String smb_activity) {
		this.smb_activity = smb_activity;
	}


	public void setSdi_breakfast(String sdi_breakfast) {
		this.sdi_breakfast = sdi_breakfast;
	}	
	
}
