package kosmo62.spomatch.master.vo;

public class SpoMasterVO {
	
	
	
	/*******************************************************************************
										회원
	 *******************************************************************************/
	private String smb_no;
	private String smb_mf;
	private String smb_id;
	private String smb_name;
	private String smb_pw;
	private String smb_email;
	private String smb_addrno;
	private String smb_addr;
	private String smb_hp;
	private String smb_gender;
	private String smb_height;
	private String smb_weight;
	private String smb_g_weight;
	private String smb_activity;
	private String smb_deleteyn;
	private String smb_count;
	private String smb_date;
	private String smb_insertdate;
	private String smb_updatedate;
	
	/*******************************************************************************
												매칭
	 *******************************************************************************/
	private String smc_no;
	private String smc_subject;
	private String smc_category;
	private String smc_date;
	private String smc_sttime;
	private String smc_endtime;
	private String smc_apply;
	private String smc_maxapl;
	private String smc_local;
	private String smc_content;
	private String smc_deleteyn;
	private String smc_insertdate;
	private String smc_updatedate;
	private String smc_count;
	private String startDate;
	private String endDate;
	
	/*******************************************************************************
											페이징
	 *******************************************************************************/
	private String spg_tableNo; 
	private String spg_pageSize;
	private String spg_groupSize;
	private String spg_totalSize;
	private String spg_curPage;
	
	
	/*******************************************************************************
											검색
	 *******************************************************************************/
	private String searchFilter;
	private String keyword;
	
	/*******************************************************************************
											매칭 getter,setter 메소드
	 *******************************************************************************/

	
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

	public String getSmc_category() {
		return smc_category;
	}

	public void setSmc_category(String smc_category) {
		this.smc_category = smc_category;
	}

	public String getSmc_date() {
		return smc_date;
	}

	public void setSmc_date(String smc_date) {
		this.smc_date = smc_date;
	}

	public String getSmc_sttime() {
		return smc_sttime;
	}

	public void setSmc_sttime(String smc_sttime) {
		this.smc_sttime = smc_sttime;
	}

	public String getSmc_endtime() {
		return smc_endtime;
	}

	public void setSmc_endtime(String smc_endtime) {
		this.smc_endtime = smc_endtime;
	}

	public String getSmc_apply() {
		return smc_apply;
	}

	public void setSmc_apply(String smc_apply) {
		this.smc_apply = smc_apply;
	}

	public String getSmc_maxapl() {
		return smc_maxapl;
	}

	public void setSmc_maxapl(String smc_maxapl) {
		this.smc_maxapl = smc_maxapl;
	}

	public String getSmc_local() {
		return smc_local;
	}

	public void setSmc_local(String smc_local) {
		this.smc_local = smc_local;
	}

	public String getSmc_content() {
		return smc_content;
	}

	public void setSmc_content(String smc_content) {
		this.smc_content = smc_content;
	}

	public String getSmc_deleteyn() {
		return smc_deleteyn;
	}

	public void setSmc_deleteyn(String smc_deleteyn) {
		this.smc_deleteyn = smc_deleteyn;
	}

	public String getSmc_insertdate() {
		return smc_insertdate;
	}

	public void setSmc_insertdate(String smc_insertdate) {
		this.smc_insertdate = smc_insertdate;
	}

	public String getSmc_updatedate() {
		return smc_updatedate;
	}

	public void setSmc_updatedate(String smc_updatedate) {
		this.smc_updatedate = smc_updatedate;
	}
	
	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	/*******************************************************************************
											�쉶�썝�젙蹂� 硫붿냼�뱶
	 *******************************************************************************/

	public String getSmb_no() {
		return smb_no;
	}
	public void setSmb_no(String smb_no) {
		this.smb_no = smb_no;
	}

	public String getSmb_mf() {
		return smb_mf;
	}

	public void setSmb_mf(String smb_mf) {
		this.smb_mf = smb_mf;
	}

	public String getSmb_id() {
		return smb_id;
	}

	public void setSmb_id(String smb_id) {
		this.smb_id = smb_id;
	}

	public String getSmb_name() {
		return smb_name;
	}

	public void setSmb_name(String smb_name) {
		this.smb_name = smb_name;
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

	public String getSmb_addrno() {
		return smb_addrno;
	}

	public void setSmb_addrno(String smb_addrno) {
		this.smb_addrno = smb_addrno;
	}

	public String getSmb_addr() {
		return smb_addr;
	}

	public void setSmb_addr(String smb_addr) {
		this.smb_addr = smb_addr;
	}

	public String getSmb_hp() {
		return smb_hp;
	}

	public void setSmb_hp(String smb_hp) {
		this.smb_hp = smb_hp;
	}

	public String getSmb_gender() {
		return smb_gender;
	}

	public void setSmb_gender(String smb_gender) {
		this.smb_gender = smb_gender;
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

	public String getSmb_deleteyn() {
		return smb_deleteyn;
	}

	public void setSmb_deleteyn(String smb_deleteyn) {
		this.smb_deleteyn = smb_deleteyn;
	}
	
	public String getSmb_count() {
		return smb_count;
	}

	public void setSmb_count(String smb_count) {
		this.smb_count = smb_count;
	}
	
	
	public String getSmb_date() {
		return smb_date;
	}

	public void setSmb_date(String smb_date) {
		this.smb_date = smb_date;
	}

	public String getSmb_insertdate() {
		return smb_insertdate;
	}

	public void setSmb_insertdate(String smb_insertdate) {
		this.smb_insertdate = smb_insertdate;
	}

	public String getSmb_updatedate() {
		return smb_updatedate;
	}

	public void setSmb_updatedate(String smb_updatedate) {
		this.smb_updatedate = smb_updatedate;
	}

	public String getSmc_count() {
		return smc_count;
	}

	public void setSmc_count(String smc_count) {
		this.smc_count = smc_count;
	}
	/*******************************************************************************
												�럹�씠吏� 硫붿냼�뱶
	 *******************************************************************************/

	public String getSpg_tableNo() {
		return spg_tableNo;
	}

	public void setSpg_tableNo(String spg_tableNo) {
		this.spg_tableNo = spg_tableNo;
	}

	public String getSpg_pageSize() {
		return spg_pageSize;
	}

	public void setSpg_pageSize(String spg_pageSize) {
		this.spg_pageSize = spg_pageSize;
	}

	public String getSpg_groupSize() {
		return spg_groupSize;
	}

	public void setSpg_groupSize(String spg_groupSize) {
		this.spg_groupSize = spg_groupSize;
	}

	public String getSpg_totalSize() {
		return spg_totalSize;
	}

	public void setSpg_totalSize(String spg_totalSize) {
		this.spg_totalSize = spg_totalSize;
	}

	public String getSpg_curPage() {
		return spg_curPage;
	}

	public void setSpg_curPage(String spg_curPage) {
		this.spg_curPage = spg_curPage;
	}

	/*******************************************************************************
										寃��깋湲곕뒫 硫붿냼�뱶
	 *******************************************************************************/
	
	public String getSearchFilter() {
		return searchFilter;
	}

	public void setSearchFilter(String searchFilter) {
		this.searchFilter = searchFilter;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	

}
