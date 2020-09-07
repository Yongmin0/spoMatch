package kosmo62.spomatch.workout.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import kosmo62.spomatch.workout.vo.SpoWorkoutVO;

public class SpoWorkoutMapperImpl extends SqlSessionDaoSupport implements SpoWorkoutMapper {

	@Override
	public List<SpoWorkoutVO> selectExercise(SpoWorkoutVO param) {
		
		List<SpoWorkoutVO> list = getSqlSession().selectList("selectExercise");
		return list;
	}

	@Override
	public List<SpoWorkoutVO> exerciseInfo(SpoWorkoutVO param) {
		
		List<SpoWorkoutVO> list = getSqlSession().selectList("exerciseInfo");
		return list;
	}

	@Override
	public int insertWorkout(SpoWorkoutVO param) {
		
		int result = getSqlSession().insert("insertWorkout");
		return result;
	}

	@Override
	public List<SpoWorkoutVO> eventsWorkout(SpoWorkoutVO param) {
		
		List<SpoWorkoutVO> list = getSqlSession().selectList("eventsWorkout");
		return list;
	}

	@Override
	public int deleteWorkout(SpoWorkoutVO param) {
		
		int result = getSqlSession().update("deleteWorkout");
		return result;
	}

	@Override
	public List<SpoWorkoutVO> selectCurWeight(SpoWorkoutVO param) {
		
		List<SpoWorkoutVO> list = getSqlSession().selectList("selectCurWeight");
		return list;
	}

	@Override
	public int insertCurWeight(SpoWorkoutVO param) {
		
		int result = getSqlSession().insert("insertCurWeight");
		return result;
	}

	@Override
	public List<SpoWorkoutVO> selectWeekWeight(SpoWorkoutVO param) {
		
		List<SpoWorkoutVO> list = getSqlSession().selectList("selectWeekWeight");
		return list;
	}

	@Override
	public List<SpoWorkoutVO> selectMember(SpoWorkoutVO param) {
		
		List<SpoWorkoutVO> list = getSqlSession().selectList("selectMember");
		return list;
	}

	@Override
	public List selectWeekDate() {
		
		List list = getSqlSession().selectList("selectWeekDate");
		return list;
	}

}
