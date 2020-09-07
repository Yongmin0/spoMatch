package kosmo62.spomatch.notice.vo;

import org.springframework.web.multipart.MultipartFile;

public class SpoNoticeVO {
	
	
		
	private String snt_no; 
	private String snt_subject; 
	private String snt_content; 
	private String snt_file; 
	private String snt_image; 
	private String snt_deleteyn;
	private String snt_viewCount;
	private String snt_updatedate; 
	private String snt_insertdate; 
	private String smb_no;
	
	
	
	
	
	private String spg_tableNo; 
	private String spg_pageSize;
	private String spg_groupSize;
	private String spg_totalSize;
	private String spg_curPage;
	

	private String searchFilter;
	private String keyword;
	
	public String getSnt_no() {
		return snt_no;
	}
	public void setSnt_no(String snt_no) {
		this.snt_no = snt_no;
	}
	public String getSnt_subject() {
		return snt_subject;
	}
	public void setSnt_subject(String snt_subject) {
		this.snt_subject = snt_subject;
	}
	public String getSnt_content() {
		return snt_content;
	}
	public void setSnt_content(String snt_content) {
		this.snt_content = snt_content;
	}
	public String getSnt_viewCount() {
		return snt_viewCount;
	}
	public void setSnt_viewCount(String snt_viewCount) {
		this.snt_viewCount = snt_viewCount;
	}
	public String getSnt_file() {
		return snt_file;
	}
	public void setSnt_file(String snt_file) {
		this.snt_file = snt_file;
	}
	public String getSnt_image() {
		return snt_image;
	}
	public void setSnt_image(String snt_image) {
		this.snt_image = snt_image;
	}
	public String getSnt_deleteyn() {
		return snt_deleteyn;
	}
	public void setSnt_deleteyn(String snt_deleteyn) {
		this.snt_deleteyn = snt_deleteyn;
	}
	public String getSnt_updatedate() {
		return snt_updatedate;
	}
	public void setSnt_updatedate(String snt_updatedate) {
		this.snt_updatedate = snt_updatedate;
	}
	public String getSnt_insertdate() {
		return snt_insertdate;
	}
	public void setSnt_insertdate(String snt_insertdate) {
		this.snt_insertdate = snt_insertdate;
	}
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
	public String getSmb_no() {
		return smb_no;
	}
	public void setSmb_no(String smb_no) {
		this.smb_no = smb_no;
	}
	


}
