package kosmo62.spomatch.kmap.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosmo62.spomatch.kmap.vo.SpoKmapVO;


public class SpoKmapMapperImpl extends SqlSessionDaoSupport implements SpoKmapMapper{
	private static Logger log = Logger.getLogger("SpoKmapMapperImpl.class");
	private final String PACKAGE_PATH = "sqlMap.SpoKmapDAO.";
	@Override
	//맵 전체 조회	
	public List listSpoKmap(SpoKmapVO kvo) {
		
		log.info("spoKmapMapperImpl listSpoKmap 함수 진입 성공 >>> : ");
		log.info("listSpoKmap kvo >>> : " + kvo);
		

		return getSqlSession().selectList(PACKAGE_PATH + "listSpoKmap");
	}
	//ajax 값 불러오기
	@Override
	public List<SpoKmapVO> kakaoMapData(SpoKmapVO param) {
		
		
		return getSqlSession().selectList(PACKAGE_PATH + "kakaoMapData");
	}
	
	
	
}