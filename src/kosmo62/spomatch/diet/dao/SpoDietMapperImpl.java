package kosmo62.spomatch.diet.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import kosmo62.spomatch.diet.vo.SpoDietVO;

public class SpoDietMapperImpl extends SqlSessionDaoSupport implements SpoDietMapper{

	@Override
	public List<SpoDietVO> listDiet(SpoDietVO param) {
		
		List<SpoDietVO> list = getSqlSession().selectList("listDiet");
		return list;
	}

	@Override
	public List<SpoDietVO> selectInfo(SpoDietVO param) {
		
		List<SpoDietVO> list = getSqlSession().selectList("selectInfo");
		return list;
	}

	@Override
	public int insertWeight(SpoDietVO param) {
		
		int result = getSqlSession().update("insertWeight");
		return result;
	}

	@Override
	public List<SpoDietVO> selectDiet(SpoDietVO param) {
		
		List<SpoDietVO> list = getSqlSession().selectList("selectDiet");
		return list;
	}

	@Override
	public int insertDiet(SpoDietVO param) {
		
		int result = getSqlSession().insert("insertDiet");
		return result;
	}

	@Override
	public List<SpoDietVO> detailDiet(SpoDietVO param) {
		
		List<SpoDietVO> list = getSqlSession().selectList("detailDiet");
		return list;
	}
	
	@Override
	public int deleteDiet(SpoDietVO param) {
		
		int result = getSqlSession().update("deleteDiet");
		return result;
	}

	@Override
	public int updateDiet(SpoDietVO param) {
		
		int result = getSqlSession().update("updateDiet");
		return result;
	}

	@Override
	public List<SpoDietVO> memberInfo(SpoDietVO param) {
		
		List<SpoDietVO> list = getSqlSession().selectList("memberInfo");
		return list;
	}
}
