package kosmo62.spomatch.tipboard.vo;



public class SpoTipBoardVO {

	private String stb_no;         //게시판번호
	private String stb_category;   //게시판목록
	private String stb_subject;    //게시판제목
	private String stb_viewcnt;    //게시판조회수
	private String stb_goodcnt;    //게시판좋아요
	private String smb_no;         //회원번호
	private String smb_id;         //회원아이디
	private String stb_pw;         //게시판비밀번호
	private String stb_content;    //게시판내용
	private String file;           //파일
	private String stb_file;       //게시판파일
	private String stb_shareyn;    //공유여부
	private String stb_deleteyn;   //삭제여부
	private String stb_insertdate; //입력일
	private String stb_updatedate; //수정일
	
	//조회수 
	
	private String sgd_no;         
	private String sgd_goodyn;     //게시판좋아요클릭여부
	private String sgd_updatedate;
	private String session_no;
	private String my_goodyn;
	
	//페이징
	private String spg_tableNo;    //테이블번호 게시판=04   
	private String spg_pageSize;   
	private String spg_groupSize;
	private String spg_totalSize;
	private String spg_curPage;
	
	private String keyword;			// 검색어
	private String searchFilter;    // 검색조건
	
	public SpoTipBoardVO() {
		
	}

	public SpoTipBoardVO(String stb_no, String stb_category, String stb_subject, String stb_viewcnt, String stb_goodcnt,
			String smb_no, String smb_id, String stb_pw, String stb_content, String file, String stb_file,
			String stb_shareyn, String stb_deleteyn, String stb_insertdate, String stb_updatedate, String sgd_no,
			String sgd_goodyn, String sgd_updatedate, String session_no, String my_goodyn, String spg_tableNo,
			String spg_pageSize, String spg_groupSize, String spg_totalSize, String spg_curPage, String keyword,
			String searchFilter) {
	
		this.stb_no = stb_no;
		this.stb_category = stb_category;
		this.stb_subject = stb_subject;
		this.stb_viewcnt = stb_viewcnt;
		this.stb_goodcnt = stb_goodcnt;
		this.smb_no = smb_no;
		this.smb_id = smb_id;
		this.stb_pw = stb_pw;
		this.stb_content = stb_content;
		this.file = file;
		this.stb_file = stb_file;
		this.stb_shareyn = stb_shareyn;
		this.stb_deleteyn = stb_deleteyn;
		this.stb_insertdate = stb_insertdate;
		this.stb_updatedate = stb_updatedate;
		this.sgd_no = sgd_no;
		this.sgd_goodyn = sgd_goodyn;
		this.sgd_updatedate = sgd_updatedate;
		this.session_no = session_no;
		this.my_goodyn = my_goodyn;
		this.spg_tableNo = spg_tableNo;
		this.spg_pageSize = spg_pageSize;
		this.spg_groupSize = spg_groupSize;
		this.spg_totalSize = spg_totalSize;
		this.spg_curPage = spg_curPage;
		this.keyword = keyword;
		this.searchFilter = searchFilter;
	}

	public String getStb_no() {
		return stb_no;
	}

	public void setStb_no(String stb_no) {
		this.stb_no = stb_no;
	}

	public String getStb_category() {
		return stb_category;
	}

	public void setStb_category(String stb_category) {
		this.stb_category = stb_category;
	}

	public String getStb_subject() {
		return stb_subject;
	}

	public void setStb_subject(String stb_subject) {
		this.stb_subject = stb_subject;
	}

	public String getStb_viewcnt() {
		return stb_viewcnt;
	}

	public void setStb_viewcnt(String stb_viewcnt) {
		this.stb_viewcnt = stb_viewcnt;
	}

	public String getStb_goodcnt() {
		return stb_goodcnt;
	}

	public void setStb_goodcnt(String stb_goodcnt) {
		this.stb_goodcnt = stb_goodcnt;
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

	public String getStb_pw() {
		return stb_pw;
	}

	public void setStb_pw(String stb_pw) {
		this.stb_pw = stb_pw;
	}

	public String getStb_content() {
		return stb_content;
	}

	public void setStb_content(String stb_content) {
		this.stb_content = stb_content;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public String getStb_file() {
		return stb_file;
	}

	public void setStb_file(String stb_file) {
		this.stb_file = stb_file;
	}

	public String getStb_shareyn() {
		return stb_shareyn;
	}

	public void setStb_shareyn(String stb_shareyn) {
		this.stb_shareyn = stb_shareyn;
	}

	public String getStb_deleteyn() {
		return stb_deleteyn;
	}

	public void setStb_deleteyn(String stb_deleteyn) {
		this.stb_deleteyn = stb_deleteyn;
	}

	public String getStb_insertdate() {
		return stb_insertdate;
	}

	public void setStb_insertdate(String stb_insertdate) {
		this.stb_insertdate = stb_insertdate;
	}

	public String getStb_updatedate() {
		return stb_updatedate;
	}

	public void setStb_updatedate(String stb_updatedate) {
		this.stb_updatedate = stb_updatedate;
	}

	public String getSgd_no() {
		return sgd_no;
	}

	public void setSgd_no(String sgd_no) {
		this.sgd_no = sgd_no;
	}

	public String getSgd_goodyn() {
		return sgd_goodyn;
	}

	public void setSgd_goodyn(String sgd_goodyn) {
		this.sgd_goodyn = sgd_goodyn;
	}

	public String getSgd_updatedate() {
		return sgd_updatedate;
	}

	public void setSgd_updatedate(String sgd_updatedate) {
		this.sgd_updatedate = sgd_updatedate;
	}

	public String getSession_no() {
		return session_no;
	}

	public void setSession_no(String session_no) {
		this.session_no = session_no;
	}

	public String getMy_goodyn() {
		return my_goodyn;
	}

	public void setMy_goodyn(String my_goodyn) {
		this.my_goodyn = my_goodyn;
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

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSearchFilter() {
		return searchFilter;
	}

	public void setSearchFilter(String searchFilter) {
		this.searchFilter = searchFilter;
	}
	

}