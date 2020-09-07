package kosmo62.spomatch.chat.dao;

import java.util.List;

import kosmo62.spomatch.chat.vo.SpoChatVO;

public interface SpoChatMapper{
	public List<SpoChatVO> listMatchChat(SpoChatVO param);
	public List<SpoChatVO> listMemberChat(SpoChatVO param);
	public List<SpoChatVO> selectChat(SpoChatVO param);
	public int sendChat(SpoChatVO param);
	public int acceptMatchChat(SpoChatVO param);
	public int checkChat(SpoChatVO param);
}
