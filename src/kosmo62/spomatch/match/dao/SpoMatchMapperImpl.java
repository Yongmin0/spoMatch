package kosmo62.spomatch.match.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import kosmo62.spomatch.match.vo.SpoMatchVO;

public class SpoMatchMapperImpl extends SqlSessionDaoSupport implements SpoMatchMapper{
	private Logger log = Logger.getLogger(SpoMatchMapperImpl.class);
	
	@Override
	public List<SpoMatchVO> listMatch(SpoMatchVO param) {
		log.info("SpoMatchMapperImpl listMatch start >>> ");
		log.info("SpoMatchMapperImpl listMatch param >>> " + param);
		List<SpoMatchVO> matchList = getSqlSession().selectList("listMatch");
		log.info("SpoMatchMapperImpl listMatch matchList >>> " + matchList);
		return matchList;
	}
	
	@Override
	public List<SpoMatchVO> mypageListMatch(SpoMatchVO param) {
		log.info("SpoMatchMapperImpl mypageListMatch start >>> ");
		log.info("SpoMatchMapperImpl mypageListMatch param >>> " + param);
		List<SpoMatchVO> matchList = getSqlSession().selectList("mypageListMatch");
		log.info("SpoMatchMapperImpl mypageListMatch matchList >>> " + matchList);
		return matchList;
	}
	
	@Override
	public List<SpoMatchVO> mypageListApply(SpoMatchVO param) {
		log.info("SpoMatchMapperImpl mypageListApply start >>> ");
		log.info("SpoMatchMapperImpl mypageListApply param >>> " + param);
		List<SpoMatchVO> matchList = getSqlSession().selectList("mypageListApply");
		log.info("SpoMatchMapperImpl mypageListApply matchList >>> " + matchList);
		return matchList;
	}
	
	@Override
	public SpoMatchVO viewMatch(SpoMatchVO param) {
		log.info("SpoMatchMapperImpl viewMatch start >>> ");
		log.info("SpoMatchMapperImpl viewMatch param >>> " + param);
		SpoMatchVO spoMatchVO = (SpoMatchVO)getSqlSession().selectList("viewMatch");
		log.info("SpoMatchMapperImpl viewMatch spoMatchVO >>> " + spoMatchVO);
		return spoMatchVO;
	}
	@Override
	public int insertMatch(SpoMatchVO param) {
		log.info("SpoMatchMapperImpl insertMatch start >>> ");
		log.info("SpoMatchMapperImpl insertMatch param >>> " + param);
		int nCnt = getSqlSession().insert("insertMatch");
		log.info("SpoMatchMapperImpl insertMatch nCnt >>> " + nCnt);
		return nCnt;
	}
	@Override
	public int updateMatch(SpoMatchVO param) {
		log.info("SpoMatchMapperImpl updateMatch start >>> ");
		log.info("SpoMatchMapperImpl updateMatch param >>> " + param);
		int nCnt = getSqlSession().update("updateMatch");
		log.info("SpoMatchMapperImpl updateMatch nCnt >>> " + nCnt);
		return nCnt;
	}
	@Override
	public int updateApplyMatch(SpoMatchVO param) {
		log.info("SpoMatchMapperImpl updateApplyMatch start >>> ");
		log.info("SpoMatchMapperImpl updateApplyMatch param >>> " + param);
		int nCnt = getSqlSession().update("updateApplyMatch");
		log.info("SpoMatchMapperImpl updateApplyMatch nCnt >>> " + nCnt);
		return nCnt;
	}
	@Override
	public int deleteMatch(SpoMatchVO param) {
		log.info("SpoMatchMapperImpl deleteMatch start >>> ");
		log.info("SpoMatchMapperImpl deleteMatch param >>> " + param);
		int nCnt = getSqlSession().delete("deleteMatch");
		log.info("SpoMatchMapperImpl deleteMatch nCnt >>> " + nCnt);
		return nCnt;
	}

	
}
