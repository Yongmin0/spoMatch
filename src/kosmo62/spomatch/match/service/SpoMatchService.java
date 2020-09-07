package kosmo62.spomatch.match.service;

import java.util.List;

import kosmo62.spomatch.match.vo.SpoMatchVO;

public interface SpoMatchService {
	public List<SpoMatchVO> listMatch(SpoMatchVO param);
	public List<SpoMatchVO> mypageListMatch(SpoMatchVO param);
	public List<SpoMatchVO> mypageListApply(SpoMatchVO param);
	public SpoMatchVO viewMatch(SpoMatchVO param);
	public int insertMatch(SpoMatchVO param);
	public int updateMatch(SpoMatchVO param);
	public int updateApplyMatch(SpoMatchVO param);
	public int deleteMatch(SpoMatchVO param);
}
