package kosmo62.spomatch.master.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import kosmo62.spomatch.master.vo.SpoMasterVO;
import kosmo62.spomatch.master.dao.SpoMasterMapperImpl;





public class SpoMasterMapperImpl extends SqlSessionDaoSupport implements SpoMasterMapper {
	private static Logger log = Logger.getLogger(SpoMasterMapperImpl.class);
	
	
	@Override
	public SpoMasterVO selectSpoMember(SpoMasterVO param) {
		// TODO Auto-generated method stub
		return (SpoMasterVO)getSqlSession().selectOne("selectSpoMember2");
	}
	@Override
	public List<SpoMasterVO> listSpoMember2(SpoMasterVO param) {
		log.info("DAO listSpoMember >>> : ");
		List<SpoMasterVO> list = getSqlSession().selectList("listSpoMember2");
		log.info(list);
		return list;
	}
	@Override
	public List<SpoMasterVO> getMatchCountAll(SpoMasterVO param) {
		List<SpoMasterVO> list = getSqlSession().selectList("getMatchCountAll");
		return list;
	}
	@Override
	public List<SpoMasterVO> getMatchCountToday(SpoMasterVO param) {
		List<SpoMasterVO> list = getSqlSession().selectList("getMatchCountToday");
		return list;
	}
	@Override
	public List<SpoMasterVO> getNewMemberToday(SpoMasterVO param) {
		List<SpoMasterVO> list = getSqlSession().selectList("getNewMemberToday");
		return list;
	}
	@Override
	public List<SpoMasterVO> getNewMemberCountAll(SpoMasterVO param) {
		List<SpoMasterVO> list = getSqlSession().selectList("getNewMemberCountAll");
		return list;
	}
	
}
