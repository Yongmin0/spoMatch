package kosmo62.spomatch.apply.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo62.spomatch.apply.dao.SpoApplyMapper;
import kosmo62.spomatch.apply.vo.SpoApplyVO;

@Service
@Transactional
public class SpoApplyServiceImpl implements SpoApplyService{
	private Logger log = Logger.getLogger(SpoApplyServiceImpl.class);
	
	@Autowired
	private SpoApplyMapper spoApplyMapper;

	@Override
	public List<SpoApplyVO> listApply(SpoApplyVO param) {
		log.info("SpoApplyServiceImpl listApply start >>>");
		log.info("SpoApplyServiceImpl listApply param >>>" + param);
		List<SpoApplyVO> list = spoApplyMapper.listApply(param);
		log.info("SpoApplyServiceImpl listApply list >>>" + list);
		log.info("SpoApplyServiceImpl listApply end >>>");
		
		return list;
	}
	@Override
	public List<SpoApplyVO> viewApplyMatch(SpoApplyVO param) {
		log.info("SpoApplyServiceImpl viewApplyMatch start >>>");
		log.info("SpoApplyServiceImpl viewApplyMatch param >>>" + param);
		List<SpoApplyVO> list = spoApplyMapper.viewApplyMatch(param);
		log.info("SpoApplyServiceImpl viewApplyMatch list >>>" + list);
		log.info("SpoApplyServiceImpl viewApplyMatch end >>>");
		
		return list;
	}

	@Override
	public SpoApplyVO viewApply(SpoApplyVO param) {
		log.info("SpoApplyServiceImpl viewApply start >>>");
		log.info("SpoApplyServiceImpl viewApply param >>>" + param);
		SpoApplyVO svo = spoApplyMapper.viewApply(param);
		log.info("SpoApplyServiceImpl viewApply svo >>>" + svo);
		log.info("SpoApplyServiceImpl viewApply end >>>");
		return svo;
	}

	@Override
	public int applyMatch(SpoApplyVO param) {
		log.info("SpoApplyServiceImpl applyMatch start >>>");
		log.info("SpoApplyServiceImpl applyMatch param >>>" + param);
		int nCnt = spoApplyMapper.applyMatch(param);
		log.info("SpoApplyServiceImpl applyMatch nCnt >>>" + nCnt);
		log.info("SpoApplyServiceImpl applyMatch end >>>");
		return nCnt;
	}

	@Override
	public int updateApply(SpoApplyVO param) {
		log.info("SpoApplyServiceImpl updateApply start >>>");
		log.info("SpoApplyServiceImpl updateApply param >>>" + param);
		int nCnt = spoApplyMapper.updateApply(param);
		log.info("SpoApplyServiceImpl updateApply nCnt >>>" + nCnt);
		log.info("SpoApplyServiceImpl updateApply end >>>");
		return nCnt;
	}

	@Override
	public int deleteApply(SpoApplyVO param) {
		log.info("SpoApplyServiceImpl deleteApply start >>>");
		log.info("SpoApplyServiceImpl deleteApply param >>>" + param);
		int nCnt = spoApplyMapper.deleteApply(param);
		log.info("SpoApplyServiceImpl deleteApply nCnt >>>" + nCnt);
		log.info("SpoApplyServiceImpl deleteApply end >>>");
		return nCnt;
	}

	@Override
	public int acceptApply(SpoApplyVO param) {
		log.info("SpoApplyServiceImpl acceptApply start >>>");
		log.info("SpoApplyServiceImpl acceptApply param >>>" + param);
		int nCnt = spoApplyMapper.acceptApply(param);
		log.info("SpoApplyServiceImpl acceptApply nCnt >>>" + nCnt);
		log.info("SpoApplyServiceImpl acceptApply end >>>");
		return nCnt;
	}
	@Override
	public List<SpoApplyVO> applyCheckMatch(SpoApplyVO param) {
		log.info("SpoApplyMapperImpl applyCheckMatch start >>>");
		log.info("SpoApplyMapperImpl acceptApply param >>>" + param);
		List<SpoApplyVO> list = spoApplyMapper.applyCheckMatch(param);
		log.info("SpoApplyMapperImpl applyCheckMatch end >>>");
		return list;
	}
}
