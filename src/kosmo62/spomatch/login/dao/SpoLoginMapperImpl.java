package kosmo62.spomatch.login.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import kosmo62.spomatch.login.vo.SpoLoginVO;


public class SpoLoginMapperImpl extends SqlSessionDaoSupport implements SpoLoginMapper{

	private static Logger log = Logger.getLogger(SpoLoginMapperImpl.class);
	
	
	@Override
	public List<SpoLoginVO> login(SpoLoginVO param) {
	
		log.info("SpoLoginMapperImpl login >>> ");
		log.info("SpoLoginMapperImpl login param >>> " + param);
		
		
		return getSqlSession().selectOne("login", param);
	}
	
	@Override
	public List<SpoLoginVO> findid(SpoLoginVO param) {

		log.info("SpoLoginMapperImpl findid >>> ");
		log.info("SpoLoginMapperImpl findid param >>> " + param);
		
		return getSqlSession().selectOne("findid", param);
	}


	@Override
	public int updatepw(SpoLoginVO param) {

		log.info("SpoLoginMapperImpl updatepw >>> ");
		log.info("SpoLoginMapperImpl updatepw param >>> " + param);
		
		return getSqlSession().update("updatepw",param);
	}

}
