package kosmo62.spomatch.member.service;

import java.util.List;

import kosmo62.spomatch.member.vo.SpoMemberVO;

public interface SpoMemberService {
		public List<SpoMemberVO> listSpoMember(SpoMemberVO param);
		
		public SpoMemberVO selectSpoMember(String smb_no);
		
		public int insertSpoMember(SpoMemberVO param);
		
		public int updateSpoMember(SpoMemberVO param);
		
		public int deleteSpoMember(SpoMemberVO param);
		
		public List<SpoMemberVO> spoUpdateForm(SpoMemberVO param);
		
		public SpoMemberVO checkID(SpoMemberVO param);
		
		public int approvalUpdate(SpoMemberVO param);
		
		
		
		
}
