package kosmo62.spomatch.chat.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo62.spomatch.chat.dao.SpoChatMapper;
import kosmo62.spomatch.chat.vo.SpoChatVO;

@Service
@Transactional
public class SpoChatServiceImpl implements SpoChatService{
	private Logger log = Logger.getLogger(SpoChatServiceImpl.class);
	
	@Autowired
	private SpoChatMapper spoChatMapper;
	
	@Override
	public List<SpoChatVO> listMatchChat(SpoChatVO param) {
		log.info("SpoChatServiceImpl listMatchChat start >>> ");
		log.info("SpoChatServiceImpl listMatchChat param >>> " + param);
		List<SpoChatVO> list = spoChatMapper.listMatchChat(param);
		log.info("SpoChatServiceImpl listMatchChat end >>> ");
		return list;
	}
	@Override
	public List<SpoChatVO> listMemberChat(SpoChatVO param) {
		log.info("SpoChatServiceImpl listMemberChat start >>> ");
		log.info("SpoChatServiceImpl listMemberChat param >>> " + param);
		List<SpoChatVO> list = spoChatMapper.listMemberChat(param);
		log.info("SpoChatServiceImpl listMemberChat end >>> ");
		return list;
	}

	@Override
	public List<SpoChatVO> selectChat(SpoChatVO param) {
		log.info("SpoChatServiceImpl selectChat start >>> ");
		log.info("SpoChatServiceImpl selectChat param >>> " + param);
		List<SpoChatVO> list = spoChatMapper.selectChat(param);
		log.info("SpoChatServiceImpl selectChat end >>> ");
		return list;
	}

	@Override
	public int sendChat(SpoChatVO param) {
		log.info("SpoChatServiceImpl sendChat start >>> ");
		log.info("SpoChatServiceImpl sendChat param >>> " + param);
		int nCnt = spoChatMapper.sendChat(param);
		log.info("SpoChatServiceImpl sendChat end >>> ");
		return nCnt;
	}
	// 수락된 멤버에게 자동으로 메세지를 보내는 쿼리실행
	@Override
	public int acceptMatchChat(SpoChatVO param) {
		log.info("SpoChatServiceImpl acceptMatchChat start >>> ");
		log.info("SpoChatServiceImpl acceptMatchChat param >>> " + param);
		int nCnt = spoChatMapper.acceptMatchChat(param);
		log.info("SpoChatServiceImpl acceptMatchChat end >>> ");
		return nCnt;
	}
	// 클릭한 시간 이전 메세지 모두 다 확인으로 
	@Override
	public int checkChat(SpoChatVO param) {
		log.info("SpoChatServiceImpl checkChat start >>> ");
		log.info("SpoChatServiceImpl checkChat param >>> " + param);
		int nCnt = spoChatMapper.checkChat(param);
		log.info("SpoChatServiceImpl checkChat end >>> ");
		return nCnt;
	}
	
}
