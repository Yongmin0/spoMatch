package kosmo62.spomatch.member.dao;

import java.util.List;

import kosmo62.spomatch.member.vo.SpoMemberVO;

public interface SpoMemberMapper {

	//회원정보 전체조회
	public List<SpoMemberVO> listSpoMember(SpoMemberVO param);
	public SpoMemberVO selectSpoMember(String smb_no);
	//회원정보 입력
	public int insertSpoMember(SpoMemberVO param);
	//회원정보 수정
	public int updateSpoMember(SpoMemberVO param);
	//회원정보 탈퇴
	public int deleteSpoMember(SpoMemberVO param);
	//마이페이지에서 회원정보 수정 클릭시
	public List<SpoMemberVO> spoUpdateForm(SpoMemberVO param);
	
	public SpoMemberVO checkID(SpoMemberVO param);
	
	public int approvalUpdate(SpoMemberVO param);
	
}
