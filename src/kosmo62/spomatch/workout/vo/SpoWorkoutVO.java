package kosmo62.spomatch.workout.vo;

public class SpoWorkoutVO {

    private String swo_no;
    private String swo_name;
	private String swo_weight;
	private String swo_sets;
	private String swo_count;
	private String swo_curweight;
	private String swo_workoutdate;
	private String swo_deleteyn;
	private String swo_insertdate;
	private String swo_updatedate;
	private String smb_no;
	
	// 멤버 데이터의 체중 계산용
	private String smb_id;
	private String smb_height;
	private String smb_weight;
	private String smb_g_weight;
	private String smb_activity;
	
	// 운동 데이터의 운동정보
	private String ses_no;
	private String ses_name;
	private String ses_img;
	private String ses_explain;
	
	// 날짜 별 체중 데이터 
	private String scw_date;
	private String scw_curweight;
	
	public SpoWorkoutVO() {
		
	}
	
	public String getSwo_no() {
		return swo_no;
	}
	public void setSwo_no(String swo_no) {
		this.swo_no = swo_no;
	}
	public String getSwo_weight() {
		return swo_weight;
	}
	public void setSwo_weight(String swo_weight) {
		this.swo_weight = swo_weight;
	}
	public String getSwo_sets() {
		return swo_sets;
	}
	public void setSwo_sets(String swo_sets) {
		this.swo_sets = swo_sets;
	}
	public String getSwo_count() {
		return swo_count;
	}
	public void setSwo_count(String swo_count) {
		this.swo_count = swo_count;
	}
	public String getSwo_curweight() {
		return swo_curweight;
	}
	public void setSwo_curweight(String swo_curweight) {
		this.swo_curweight = swo_curweight;
	}
	public String getSwo_workoutdate() {
		return swo_workoutdate;
	}
	public void setSwo_workoutdate(String swo_workoutdate) {
		this.swo_workoutdate = swo_workoutdate;
	}
	public String getSwo_deleteyn() {
		return swo_deleteyn;
	}
	public void setSwo_deleteyn(String swo_deleteyn) {
		this.swo_deleteyn = swo_deleteyn;
	}
	public String getSwo_insertdate() {
		return swo_insertdate;
	}
	public void setSwo_insertdate(String swo_insertdate) {
		this.swo_insertdate = swo_insertdate;
	}
	public String getSwo_updatedate() {
		return swo_updatedate;
	}
	public void setSwo_updatedate(String swo_updatedate) {
		this.swo_updatedate = swo_updatedate;
	}
	public String getSmb_no() {
		return smb_no;
	}
	public void setSmb_no(String smb_no) {
		this.smb_no = smb_no;
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
	public String getSes_no() {
		return ses_no;
	}
	public void setSes_no(String ses_no) {
		this.ses_no = ses_no;
	}
	public String getSes_name() {
		return ses_name;
	}
	public void setSes_name(String ses_name) {
		this.ses_name = ses_name;
	}
	public String getSes_img() {
		return ses_img;
	}
	public void setSes_img(String ses_img) {
		this.ses_img = ses_img;
	}
	public String getSes_explain() {
		return ses_explain;
	}
	public void setSes_explain(String ses_explain) {
		this.ses_explain = ses_explain;
	}

	public String getSwo_name() {
		return swo_name;
	}

	public void setSwo_name(String swo_name) {
		this.swo_name = swo_name;
	}

	public String getScw_date() {
		return scw_date;
	}

	public void setScw_date(String scw_date) {
		this.scw_date = scw_date;
	}

	public String getScw_curweight() {
		return scw_curweight;
	}

	public void setScw_curweight(String scw_curweight) {
		this.scw_curweight = scw_curweight;
	}

	public String getSmb_id() {
		return smb_id;
	}

	public void setSmb_id(String smb_id) {
		this.smb_id = smb_id;
	}
}
