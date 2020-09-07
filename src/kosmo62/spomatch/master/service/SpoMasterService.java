package kosmo62.spomatch.master.service;

import java.util.List;

import kosmo62.spomatch.master.vo.SpoMasterVO;

public interface SpoMasterService {
	
	public List<SpoMasterVO> listSpoMember(SpoMasterVO param);
	public SpoMasterVO selectSpoMember(SpoMasterVO param);
	public List<SpoMasterVO> getMatchCountToday(SpoMasterVO param);
	public List<SpoMasterVO> getNewMemberToday(SpoMasterVO param);
	public List<SpoMasterVO>getMatchCountAll(SpoMasterVO param);
	public List<SpoMasterVO>getNewMemberCountAll(SpoMasterVO param);
}
