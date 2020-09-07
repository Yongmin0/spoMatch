package kosmo62.spomatch.kmap.vo;

public class SpoKmapVO {
	
	//변수 선언
	private String smp_content;
	private String smp_no;
	private String smp_name;
	private String smp_addr;
	private String smp_hp;
	private String smp_x;
	private String smp_y;
	
	private String searchFilter;
	private String keyword;
	
	//매개 변수 없는 생성자
	public SpoKmapVO() {
		
	}
	
	public SpoKmapVO(String smp_content, String smp_no
									   , String smp_name
									   , String smp_addr
									   , String smp_hp
									   , String smp_x
									   , String smp_y ) {
		this.smp_content = smp_content;
		this.smp_no = smp_no;
		this.smp_name = smp_name;
		this.smp_addr = smp_addr;
		this.smp_hp = smp_addr;
		this.smp_x = smp_x;
		this.smp_y = smp_y;
	}

	public String getSmp_content() {
		return smp_content;
	}

	public void setSmp_content(String smp_content) {
		this.smp_content = smp_content;
	}

	public String getSmp_no() {
		return smp_no;
	}

	public void setSmp_no(String smp_no) {
		this.smp_no = smp_no;
	}

	public String getSmp_name() {
		return smp_name;
	}

	public void setSmp_name(String smp_name) {
		this.smp_name = smp_name;
	}

	public String getSmp_addr() {
		return smp_addr;
	}

	public void setSmp_addr(String smp_addr) {
		this.smp_addr = smp_addr;
	}

	public String getSmp_hp() {
		return smp_hp;
	}

	public void setSmp_hp(String smp_hp) {
		this.smp_hp = smp_hp;
	}

	public String getSmp_x() {
		return smp_x;
	}

	public void setSmp_x(String smp_x) {
		this.smp_x = smp_x;
	}

	public String getSmp_y() {
		return smp_y;
	}

	public void setSmp_y(String smp_y) {
		this.smp_y = smp_y;
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
	
	

}


