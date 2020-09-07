package kosmo62.spomatch.chat.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import kosmo62.spomatch.chat.vo.SpoChatVO;

public class SpoChatMapperImpl extends SqlSessionDaoSupport implements SpoChatMapper{
	private Logger log = Logger.getLogger(SpoChatMapperImpl.class);
	
	@Override
	public List<SpoChatVO> listMatchChat(SpoChatVO param) {
		log.info("SpoChatMapperImpl listMatchChat start >>> ");
		log.info("SpoChatMapperImpl listMatchChat param >>> " + param);
		
		List<SpoChatVO> list = getSqlSession().selectList("listMatchChat");
		log.info("SpoChatMapperImpl listMatchChat end >>> ");
		return list;
	}
	@Override
	public List<SpoChatVO> listMemberChat(SpoChatVO param) {
		log.info("SpoChatMapperImpl listMemberChat start >>> ");
		log.info("SpoChatMapperImpl listMemberChat param >>> " + param);
		
		List<SpoChatVO> list = getSqlSession().selectList("listMemberChat");
		log.info("SpoChatMapperImpl listMemberChat end >>> ");
		return list;
	}

	@Override
	public List<SpoChatVO> selectChat(SpoChatVO param) {
		log.info("SpoChatMapperImpl selectChat start >>> ");
		log.info("SpoChatMapperImpl selectChat param >>> " + param);
		List<SpoChatVO> list = getSqlSession().selectList("selectChat");
		log.info("SpoChatMapperImpl selectChat end >>> ");
		return list;
	}

	@Override
	public int sendChat(SpoChatVO param) {
		log.info("SpoChatMapperImpl sendChat start >>> ");
		log.info("SpoChatMapperImpl sendChat param >>> " + param);
		int nCnt = getSqlSession().insert("sendChat");
		log.info("SpoChatMapperImpl sendChat end >>> ");
		return nCnt;
	}
	// 수락된 멤버에게 자동으로 메세지를 보내는 쿼리실행
	@Override
	public int acceptMatchChat(SpoChatVO param) {
		log.info("SpoChatMapperImpl acceptMatchChat start >>> ");
		log.info("SpoChatMapperImpl acceptMatchChat param >>> " + param);
		int nCnt = getSqlSession().insert("acceptMatchChat");
		log.info("SpoChatMapperImpl acceptMatchChat end >>> ");
		return nCnt;
	}
	// 채팅 클릭시 자동으로 
	@Override
	public int checkChat(SpoChatVO param) {
		log.info("SpoChatMapperImpl checkChat start >>> ");
		log.info("SpoChatMapperImpl checkChat param >>> " + param);
		int nCnt = getSqlSession().update("checkChat");
		log.info("SpoChatMapperImpl checkChat end >>> ");
		return nCnt;
	}

}
