package kosmo62.spomatch.login.service;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo62.spomatch.login.dao.SpoLoginMapper;
import kosmo62.spomatch.login.vo.SpoLoginVO;

@Service
@Transactional
public class SpoLoginServiceImpl implements SpoLoginService{
	
	Logger log = Logger.getLogger(SpoLoginServiceImpl.class);
	
	@Autowired
	private SpoLoginMapper spoLoginMapper;
	
	
	@Override
	public List<SpoLoginVO> login(SpoLoginVO param) {

		log.info("SpoLoginServiceImpl login >>> ");
		log.info("SpoLoginServiceImpl login param>>> " + param);
		log.info("SpoLoginServiceImpl login param" + param.getSmb_id());
		log.info("SpoLoginServiceImpl login param>>> " + param.getSmb_pw());
		
		return spoLoginMapper.login(param);
	}

	@Override
	public List<SpoLoginVO> findid(SpoLoginVO param) {

		log.info("SpoLoginServiceImpl findid >>> ");
		log.info("SpoLoginServiceImpl findid param>>> " + param);
		
		return spoLoginMapper.findid(param);
	}

	



}
