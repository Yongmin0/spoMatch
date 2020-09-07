package kosmo62.spomatch.comment.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import kosmo62.spomatch.comment.vo.SpoCommentVO;

public class SpoCommentMapperImpl extends SqlSessionDaoSupport implements SpoCommentMapper{

	private static Logger log = Logger.getLogger(SpoCommentMapperImpl.class);
	@Override
	public List<SpoCommentVO> listcomment(SpoCommentVO param) {

		log.info("SpoCommentMapperImpl listcomment >>>");
		log.info("SpoCommentMapperImpl listcomment param >>>" + param);
		
		List<SpoCommentVO> listcomment = getSqlSession().selectList("listcomment");
		log.info("SpoCommentMapperImpl listcomment >>>");
		
		return listcomment;
	}
	
	@Override
	public List<SpoCommentVO> listallcomment(SpoCommentVO param) {


		log.info("SpoCommentMapperImpl listallcomment >>>");
		log.info("SpoCommentMapperImpl listallcomment param >>>" + param);
		
		List<SpoCommentVO> listallcomment = getSqlSession().selectList("listallcomment");
		log.info("SpoCommentMapperImpl listallcomment >>>");
		
		return listallcomment;
	}

	@Override
	public int insertcomment(SpoCommentVO param) {


		log.info("SpoCommentMapperImpl insertcomment >>>");
		log.info("SpoCommentMapperImpl insertcomment param >>>" + param);
		
		return (int)getSqlSession().insert("insertcomment");
	}

	@Override
	public int updatecomment(SpoCommentVO param) {


		log.info("SpoCommentMapperImpl updatecomment >>>");
		log.info("SpoCommentMapperImpl updatecomment param >>>" + param);
		
		return (int)getSqlSession().update("updatecomment");
	}

	@Override
	public int deletecomment(SpoCommentVO param) {
		// TODO Auto-generated method stub
		return (int)getSqlSession().update("deletecomment");
	}



}
