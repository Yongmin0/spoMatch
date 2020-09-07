package kosmo62.spomatch.apply.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import kosmo62.spomatch.apply.vo.SpoApplyVO;


public class SpoApplyMapperImpl extends SqlSessionDaoSupport implements SpoApplyMapper {
	private Logger log = Logger.getLogger(SpoApplyMapperImpl.class);

	@Override
	public List<SpoApplyVO> listApply(SpoApplyVO param) {
		log.info("SpoApplyMapperImpl listApply start >>>");
		List<SpoApplyVO> list = getSqlSession().selectList("listApply");
		log.info("SpoApplyMapperImpl listApply end >>>");
		return list;
	}
	@Override
	public List<SpoApplyVO> viewApplyMatch(SpoApplyVO param) {
		log.info("SpoApplyMapperImpl viewApplyMatch start >>>");
		List<SpoApplyVO> list = getSqlSession().selectList("viewApplyMatch");
		log.info("SpoApplyMapperImpl viewApplyMatch end >>>");
		return list;
	}

	@Override
	public SpoApplyVO viewApply(SpoApplyVO param) {
		log.info("SpoApplyMapperImpl viewApply start >>>");
		SpoApplyVO svo = (SpoApplyVO)getSqlSession().selectOne("viewApply");
		log.info("SpoApplyMapperImpl viewApply end >>>");
		return svo;
	}

	@Override
	public int applyMatch(SpoApplyVO param) {
		log.info("SpoApplyMapperImpl applyMatch start >>>");
		int nCnt = getSqlSession().insert("applyMatch");
		log.info("SpoApplyMapperImpl applyMatch nCnt >>>" + nCnt);
		log.info("SpoApplyMapperImpl applyMatch end >>>");
		return nCnt;
	}

	@Override
	public int updateApply(SpoApplyVO param) {
		log.info("SpoApplyMapperImpl updateApply start >>>");
		int nCnt = getSqlSession().update("updateApply");
		log.info("SpoApplyMapperImpl updateApply nCnt >>>" + nCnt);
		log.info("SpoApplyMapperImpl updateApply end >>>");
		return nCnt;
	}

	@Override
	public int deleteApply(SpoApplyVO param) {
		log.info("SpoApplyMapperImpl deleteApply start >>>");
		int nCnt = getSqlSession().update("deleteApply");
		log.info("SpoApplyMapperImpl deleteApply nCnt >>>" + nCnt);
		log.info("SpoApplyMapperImpl deleteApply end >>>");
		return nCnt;
	}

	@Override
	public int acceptApply(SpoApplyVO param) {
		log.info("SpoApplyMapperImpl acceptApply start >>>");
		int nCnt = getSqlSession().update("acceptApply");
		log.info("SpoApplyMapperImpl acceptApply nCnt >>>" + nCnt);
		log.info("SpoApplyMapperImpl acceptApply end >>>");
		return nCnt;
	}
	@Override
	public List<SpoApplyVO> applyCheckMatch(SpoApplyVO param) {
		log.info("SpoApplyMapperImpl applyCheckMatch start >>>");
		log.info("SpoApplyMapperImpl acceptApply param >>>" + param);
		List<SpoApplyVO> list = getSqlSession().selectList("applyCheckMatch");
		log.info("SpoApplyMapperImpl applyCheckMatch end >>>");
		
		return list;
	}
	
	
}
