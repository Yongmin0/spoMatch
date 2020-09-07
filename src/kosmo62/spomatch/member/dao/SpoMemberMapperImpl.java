package kosmo62.spomatch.member.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import kosmo62.spomatch.member.vo.SpoMemberVO;


public class SpoMemberMapperImpl extends SqlSessionDaoSupport implements SpoMemberMapper{
	private static Logger log = Logger.getLogger(SpoMemberMapperImpl.class);
	private final String PACKAGE_PATH = "sqlMap.SpoMemberDAO.";
	//회원정보 전체조회
	@Override
	public List<SpoMemberVO> listSpoMember(SpoMemberVO param) {
		log.info("SpoMemberMapperImpl listSpoMember >>> : ");
		log.info("SpoMemberMapperImpl listSpoMember param >>> : " + param);
		
		return getSqlSession().selectList(PACKAGE_PATH + "listSpoMember");
	}//end of listSpoMember
	
	@Override
	public SpoMemberVO selectSpoMember(String smb_no) {
		log.info("SpoMemberMapperImpl selectSpoMember strat >>> ");
		log.info("SpoMemberMapperImpl selectSpoMember end >>> ");
		return (SpoMemberVO)getSqlSession().selectOne(PACKAGE_PATH + "selectSpoMember");
	}//end of selectSpoMember
	
	//회원정보 입력
	@Override
	public int insertSpoMember(SpoMemberVO param) {
		return (int)getSqlSession().insert(PACKAGE_PATH + "insertSpoMember");
	}//end of insertSpoMember
	
	//회원정보 수정
	@Override
	public int updateSpoMember(SpoMemberVO param) {
	
		return (int)getSqlSession().update(PACKAGE_PATH + "updateSpoMember");
	}//end of updateSpoMember
	
	//회원정보 탈퇴	
	@Override
	public int deleteSpoMember(SpoMemberVO param) {
		return (int)getSqlSession().delete("deleteSpoMember");
	}//end of deleteSpoMember
	
	//마이페이지에서 회원정보 수정 버튼시
	@Override
	public List<SpoMemberVO> spoUpdateForm(SpoMemberVO param) {
		return getSqlSession().selectList("spoUpdateForm");
	}//end of spoUpdateForm

	@Override
	public SpoMemberVO checkID(SpoMemberVO param) {
		SpoMemberVO svo = getSqlSession().selectOne("checkID");
		return svo;
	}

	@Override
	public int approvalUpdate(SpoMemberVO param) {
		return (int)getSqlSession().update("approvalUpdate");
	}
	
	

	

	
	
	
	
	
	
}//end of SpoMemberMapper
