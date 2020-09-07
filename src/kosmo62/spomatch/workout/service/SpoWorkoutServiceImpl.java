package kosmo62.spomatch.workout.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo62.spomatch.workout.controller.SpoWorkoutController;
import kosmo62.spomatch.workout.dao.SpoWorkoutMapper;
import kosmo62.spomatch.workout.vo.SpoWorkoutVO;

@Service
@Transactional
public class SpoWorkoutServiceImpl implements SpoWorkoutService{
	
	private static Logger log = Logger.getLogger(SpoWorkoutServiceImpl.class);
	@Autowired
	private SpoWorkoutMapper spoWorkoutMapper;
	
	@Override
	public List<SpoWorkoutVO> selectExercise(SpoWorkoutVO param) {
		log.info("SpoWorkoutServiceImpl selectExercise start");
		
		List<SpoWorkoutVO> list = spoWorkoutMapper.selectExercise(param);
		
		log.info("SpoWorkoutServiceImpl selectExercise end");
		return list;
	}

	@Override
	public List<SpoWorkoutVO> exerciseInfo(SpoWorkoutVO param) {
		log.info("SpoWorkoutServiceImpl exerciseInfo start");
		
		
		List<SpoWorkoutVO> list = spoWorkoutMapper.exerciseInfo(param);
		
		log.info("SpoWorkoutServiceImpl exerciseInfo end");
		return list;
	}

	@Override
	public int insertWorkout(SpoWorkoutVO param) {
		log.info("SpoWorkoutServiceImpl insertWorkout start");
		
		int result = spoWorkoutMapper.insertWorkout(param);
		
		log.info("SpoWorkoutServiceImpl insertWorkout end");
		return result;
	}

	@Override
	public List<SpoWorkoutVO> eventsWorkout(SpoWorkoutVO param) {
		log.info("SpoWorkoutServiceImpl eventsWorkout start");

		List<SpoWorkoutVO> list = spoWorkoutMapper.eventsWorkout(param);
		
		log.info("SpoWorkoutServiceImpl eventsWorkout end");
		return list;
	}

	@Override
	public int deleteWorkout(SpoWorkoutVO param) {
		log.info("SpoWorkoutServiceImpl deleteWorkout start");
		
		int result = spoWorkoutMapper.deleteWorkout(param);
		
		log.info("SpoWorkoutServiceImpl deleteWorkout end");
		return result;
	}

	@Override
	public List<SpoWorkoutVO> selectCurWeight(SpoWorkoutVO param) {
		log.info("SpoWorkoutServiceImpl selectCurWeight start");
		
		List<SpoWorkoutVO> list = spoWorkoutMapper.selectCurWeight(param);
		
		log.info("SpoWorkoutServiceImpl selectCurWeight end");
		return list;
	}

	@Override
	public int insertCurweight(SpoWorkoutVO param) {
		log.info("SpoWorkoutServiceImpl insertCurweight start");
		
		int result = spoWorkoutMapper.insertCurWeight(param);
		
		log.info("SpoWorkoutServiceImpl insertCurweight end");
		return result;
	}

	@Override
	public List<SpoWorkoutVO> selectWeekWeight(SpoWorkoutVO param) {
		log.info("SpoWorkoutServiceImpl selectWeekWeight start");
		
		List<SpoWorkoutVO> list = spoWorkoutMapper.selectWeekWeight(param);
		
		log.info("SpoWorkoutServiceImpl selectWeekWeight end");
		return list;
	}

	@Override
	public List<SpoWorkoutVO> selectMember(SpoWorkoutVO param) {
		log.info("SpoWorkoutServiceImpl selectMember start");
		
		List<SpoWorkoutVO> list = spoWorkoutMapper.selectMember(param);
		
		log.info("SpoWorkoutServiceImpl selectMember end");
		return list;
	}

	@Override
	public List selectWeekDate() {
		log.info("SpoWorkoutServiceImpl selectWeekDate start");
		
		List<SpoWorkoutVO> list = spoWorkoutMapper.selectWeekDate();
		
		log.info("SpoWorkoutServiceImpl selectWeekDate end");
		return list;
	}
}
