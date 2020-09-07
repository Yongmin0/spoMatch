package kosmo62.spomatch.match.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo62.spomatch.match.dao.SpoMatchMapper;
import kosmo62.spomatch.match.vo.SpoMatchVO;

@Service
@Transactional
public class SpoMatchServiceImpl implements SpoMatchService{
	private Logger log = Logger.getLogger(SpoMatchServiceImpl.class);
	
	@Autowired
	private SpoMatchMapper spoMatchMapper;

	@Override
	public List<SpoMatchVO> listMatch(SpoMatchVO param) {
		log.info("SpoMatchServiceImpl listMatch start >>> ");
		log.info("SpoMatchServiceImpl listMatch param >>> " + param);
		List<SpoMatchVO> matchList = new ArrayList<SpoMatchVO>();
		matchList = spoMatchMapper.listMatch(param);
		log.info("SpoMatchServiceImpl listMatch matchList >>> " + matchList);
		log.info("SpoMatchServiceImpl listMatch end >>> ");
		return matchList;
	}
	
	@Override
	public List<SpoMatchVO> mypageListMatch(SpoMatchVO param) {
		log.info("SpoMatchServiceImpl mypageListMatch start >>> ");
		log.info("SpoMatchServiceImpl mypageListMatch param >>> " + param);
		List<SpoMatchVO> matchList = new ArrayList<SpoMatchVO>();
		matchList = spoMatchMapper.mypageListMatch(param);
		log.info("SpoMatchServiceImpl mypageListMatch nCnt >>> " + matchList);
		log.info("SpoMatchServiceImpl mypageListMatch end >>> ");
		return matchList;
	}
	
	
	@Override
	public List<SpoMatchVO> mypageListApply(SpoMatchVO param) {
		log.info("SpoMatchServiceImpl mypageListApply start >>> ");
		log.info("SpoMatchServiceImpl mypageListApply param >>> " + param);
		List<SpoMatchVO> matchList = new ArrayList<SpoMatchVO>();
		matchList = spoMatchMapper.mypageListApply(param);
		log.info("SpoMatchServiceImpl mypageListApply nCnt >>> " + matchList);
		log.info("SpoMatchServiceImpl mypageListApply end >>> ");
		return matchList;
	}
	@Override
	public SpoMatchVO viewMatch(SpoMatchVO param) {
		log.info("SpoMatchServiceImpl viewMatch start >>> ");
		log.info("SpoMatchServiceImpl viewMatch param >>> " + param);
		SpoMatchVO spoMatchVO = new SpoMatchVO();
		spoMatchVO = spoMatchMapper.viewMatch(param);
		log.info("SpoMatchServiceImpl viewMatch spoMatchVO >>> " + spoMatchVO);
		log.info("SpoMatchServiceImpl viewMatch end >>> ");
		return spoMatchVO;
	}

	@Override
	public int insertMatch(SpoMatchVO param) {
		log.info("SpoMatchServiceImpl insertMatch start >>> ");
		log.info("SpoMatchServiceImpl insertMatch param >>> " + param);
		int nCnt = 0;
		nCnt = spoMatchMapper.insertMatch(param);
		log.info("SpoMatchServiceImpl insertMatch nCnt >>> " + nCnt);
		log.info("SpoMatchServiceImpl insertMatch end >>> ");
		return nCnt;
	}

	@Override
	public int updateMatch(SpoMatchVO param) {
		log.info("SpoMatchServiceImpl updateMatch start >>> ");
		log.info("SpoMatchServiceImpl updateMatch param >>> " + param);
		int nCnt = 0;
		nCnt = spoMatchMapper.updateMatch(param);
		log.info("SpoMatchServiceImpl updateMatch nCnt >>> " + nCnt);
		log.info("SpoMatchServiceImpl updateMatch end >>> ");
		return nCnt;
	}
	@Override
	public int updateApplyMatch(SpoMatchVO param) {
		log.info("SpoMatchServiceImpl updateApplyMatch start >>> ");
		log.info("SpoMatchServiceImpl updateApplyMatch param >>> " + param);
		int nCnt = 0;
		nCnt = spoMatchMapper.updateApplyMatch(param);
		log.info("SpoMatchServiceImpl updateApplyMatch nCnt >>> " + nCnt);
		log.info("SpoMatchServiceImpl updateApplyMatch end >>> ");
		return nCnt;
	}

	@Override
	public int deleteMatch(SpoMatchVO param) {
		log.info("SpoMatchServiceImpl deleteMatch start >>> ");
		log.info("SpoMatchServiceImpl deleteMatch param >>> " + param);
		int nCnt = 0;
		nCnt = spoMatchMapper.deleteMatch(param);
		log.info("SpoMatchServiceImpl deleteMatch nCnt >>> " + nCnt);
		log.info("SpoMatchServiceImpl deleteMatch end >>> ");
		return nCnt;
	}


	
	
	
}
