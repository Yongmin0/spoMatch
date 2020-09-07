package kosmo62.spomatch.workout.dao;

import java.util.List;

import kosmo62.spomatch.workout.vo.SpoWorkoutVO;

public interface SpoWorkoutMapper {

	public List<SpoWorkoutVO> selectExercise(SpoWorkoutVO param);
	public List<SpoWorkoutVO> exerciseInfo(SpoWorkoutVO param);
	public int insertWorkout(SpoWorkoutVO param);
	public List<SpoWorkoutVO> eventsWorkout(SpoWorkoutVO param);
	public int deleteWorkout(SpoWorkoutVO param);
	public List<SpoWorkoutVO> selectCurWeight(SpoWorkoutVO param);
	public int insertCurWeight(SpoWorkoutVO param);
	public List<SpoWorkoutVO> selectWeekWeight(SpoWorkoutVO param);
	public List<SpoWorkoutVO> selectMember(SpoWorkoutVO param);
	public List selectWeekDate();

}
