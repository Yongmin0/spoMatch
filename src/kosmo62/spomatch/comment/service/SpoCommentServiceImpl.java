package kosmo62.spomatch.comment.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo62.spomatch.comment.dao.SpoCommentMapper;
import kosmo62.spomatch.comment.vo.SpoCommentVO;

@Service
@Transactional
public class SpoCommentServiceImpl implements SpoCommentService{
	
	private Logger log = Logger.getLogger(SpoCommentServiceImpl.class);
	
	@Autowired
	private SpoCommentMapper spoCommentMapper;

	@Override
	public List<SpoCommentVO> listcomment(SpoCommentVO param) {


		log.info("SpoCommentServiceImpl listcomment >>>");
		log.info("SpoCommentServiceImpl listcomment param >>>" + param);
		
		List<SpoCommentVO> listcomment = new ArrayList<SpoCommentVO>();
		listcomment = spoCommentMapper.listcomment(param);
		log.info("SpoCommentServiceImpl listcomment listcomment >>>" + listcomment);
		
		return listcomment;
	}
	
	@Override
	public List<SpoCommentVO> listallcomment(SpoCommentVO param) {
		
		log.info("SpoCommentServiceImpl listallcomment >>>");
		log.info("SpoCommentServiceImpl listallcomment param >>>" + param);
		
		List<SpoCommentVO> listallcomment = new ArrayList<SpoCommentVO>();
		listallcomment = spoCommentMapper.listallcomment(param);
		log.info("SpoCommentServiceImpl listallcomment listallcomment >>>" + listallcomment);
		
		return listallcomment;
	}

	@Override
	public int insertcomment(SpoCommentVO param) {


		log.info("SpoCommentServiceImpl insertcomment >>>");
		log.info("SpoCommentServiceImpl insertcomment param >>>" + param);
		
		return spoCommentMapper.insertcomment(param);
	}

	@Override
	public int updatecomment(SpoCommentVO param) {


		log.info("SpoCommentServiceImpl updatecomment >>>");
		log.info("SpoCommentServiceImpl updatecomment param >>>" + param);
		
		return spoCommentMapper.updatecomment(param);
	}

	@Override
	public int deletecomment(SpoCommentVO param) {


		log.info("SpoCommentServiceImpl deletecomment >>>");
		log.info("SpoCommentServiceImpl deletecomment param >>>" + param);
		
		return spoCommentMapper.deletecomment(param);
	}



}
