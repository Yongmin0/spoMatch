package kosmo62.spomatch.diet.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo62.spomatch.diet.dao.SpoDietMapper;
import kosmo62.spomatch.diet.vo.SpoDietVO;

@Service
@Transactional
public class SpoDietServiceImpl implements SpoDietService {
	private static Logger log = Logger.getLogger(SpoDietServiceImpl.class);
	
	@Autowired
	private SpoDietMapper spoDietMapper;

	@Override
	public List<SpoDietVO> listDiet(SpoDietVO param) {
		log.info("SpoDietServiceImpl listDiet start");
		
		List<SpoDietVO> list = new ArrayList<SpoDietVO>();
		list = spoDietMapper.listDiet(param);
		log.info(list);
		
		log.info("SpoDietServiceImpl listDiet end");
		return list;
	}

	@Override
	public List<SpoDietVO> selectInfo(SpoDietVO param) {
		log.info("SpoDietServiceImpl selectInfo start");
		
		List<SpoDietVO> list = spoDietMapper.selectInfo(param);
		log.info("SpoDietServiceImpl selectInfo end");
		return list;
	}

	@Override
	public int insertWeight(SpoDietVO param) {
		log.info("SpoDietServiceImpl insertWeight start");
		
		int result = spoDietMapper.insertWeight(param);
		
		log.info("SpoDietServiceImpl insertWeight end");
		return result;
	}

	@Override
	public List<SpoDietVO> selectDiet(SpoDietVO param) {
		log.info("SpoDietServiceImpl selectDiet start");
		
		List<SpoDietVO> list = spoDietMapper.selectDiet(param);
		
		log.info("SpoDietServiceImpl selectDiet end");
		return list;
	}

	@Override
	public int insertDiet(SpoDietVO param) {
		log.info("SpoDietServiceImpl insertDiet start");
		
		int result = spoDietMapper.insertDiet(param);
		
		log.info("SpoDietServiceImpl insertDiet end");
		return result;
	}

	@Override
	public int deleteDiet(SpoDietVO param) {
		log.info("SpoDietServiceImpl deleteDiet start");
		
		int result = spoDietMapper.deleteDiet(param);
		log.info("SpoDietServiceImpl deleteDiet result >>> "+result);
		
		log.info("SpoDietServiceImpl deleteDiet end");
		return result;
	}

	@Override
	public List<SpoDietVO> detailDiet(SpoDietVO param) {
		log.info("SpoDietServiceImpl detailDiet start");

		List<SpoDietVO> list = spoDietMapper.detailDiet(param);
		
		log.info("SpoDietServiceImpl detailDiet end");
		return list;
	}

	@Override
	public int updateDiet(SpoDietVO param) {
		
		int result = spoDietMapper.updateDiet(param);
		return result;
	}

	@Override
	public List<SpoDietVO> memberInfo(SpoDietVO param) {
		
		List<SpoDietVO> list = spoDietMapper.memberInfo(param);
		return list;
	}

	
}
