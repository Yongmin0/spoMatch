package kosmo62.spomatch.member.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo62.spomatch.member.dao.SpoMemberMapper;
import kosmo62.spomatch.member.vo.SpoMemberVO;

@Service
@Transactional

public class SpoMemberServiceImpl implements SpoMemberService {
	private static Logger log = Logger.getLogger(SpoMemberServiceImpl.class);
	
	@Autowired
	private SpoMemberMapper spoMemberMapper;
	//회원정보 전체 조회
	@Override
	public List<SpoMemberVO> listSpoMember(SpoMemberVO param) {
		
		//로그 값 찍어보기
		log.info("SpoMemberServiceImpl listSpoMember >>> : ");
		log.info("SpoMemberServiceImpl listSpoMember param >>> : " + param);
		//ArrayList인 VO를 참조변수 list에 담는다.
		List<SpoMemberVO> list = new ArrayList<SpoMemberVO>();
		//list를 spoMemberMapper에 listSpoMember로 보낸다.
		list = spoMemberMapper.listSpoMember(param);
		log.info("SpoMemberServiceImpl listSpoMember list >>> : " + list);
		return list;
		
	}//end of listSpoMember
	
	
	
	@Override
	public SpoMemberVO selectSpoMember(String smb_no) {
		log.info("SpoMemberServiceImpl selectSpoMember strat >>> ");
		log.info("SpoMemberServiceImpl selectSpoMember smb_no >>> " + smb_no);
		log.info("SpoMemberServiceImpl selectSpoMember end >>> ");
		//Mapper에 selectSpoMember(smb_no)를 반환한다.
		return spoMemberMapper.selectSpoMember(smb_no);
	}//end of selectSpoMember 
	
	//회원정보 입력
	@Override
	public int insertSpoMember(SpoMemberVO param) {
		return spoMemberMapper.insertSpoMember(param);
	}//end of insertSpoMember

	//회원정보 수정
	@Override
	public int updateSpoMember(SpoMemberVO param) {
		log.info("SpoMemberServiceImpl updateSpoMember strat >>> ");
		log.info("SpoMemberServiceImpl updateSpoMember end >>> ");
		return spoMemberMapper.updateSpoMember(param);
	}//end of updateSpoMember

	//회원정보 탈퇴
	@Override
	public int deleteSpoMember(SpoMemberVO param) {
		log.info("SpoMemberServiceImpl deleteSpoMember start >>> : ");
		log.info("SpoMemberServiceImpl deleteSpoMember end >>> : ");
		return spoMemberMapper.deleteSpoMember(param);
	}//end of deleteSpoMember

	//마이페이지 회원정보 수정 시
	@Override
	public List<SpoMemberVO> spoUpdateForm(SpoMemberVO param) {
		return spoMemberMapper.spoUpdateForm(param);
	}//end of spoUpdateForm


	
	@Override
	public SpoMemberVO checkID(SpoMemberVO param) {
		return spoMemberMapper.checkID(param);
	}


	//이메일 인증 'N' -> 'Y' 로변경
	@Override
	public int approvalUpdate(SpoMemberVO param) {
		log.info("SpoMemberServiceImpl approvalUpdate strat >>> ");
		log.info("SpoMemberServiceImpl approvalUpdate end >>> ");
		return spoMemberMapper.approvalUpdate(param);
	}
	
	
	


}
