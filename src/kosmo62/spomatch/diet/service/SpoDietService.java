package kosmo62.spomatch.diet.service;

import java.util.List;

import kosmo62.spomatch.diet.vo.SpoDietVO;

public interface SpoDietService {

	public List<SpoDietVO> listDiet(SpoDietVO param);
	public List<SpoDietVO> selectInfo(SpoDietVO param);
	public int insertWeight(SpoDietVO param);
	public List<SpoDietVO> selectDiet(SpoDietVO param);
	public int insertDiet(SpoDietVO param);
	public int deleteDiet(SpoDietVO param);
	public List<SpoDietVO> detailDiet(SpoDietVO param);
	public int updateDiet(SpoDietVO param);
	public List<SpoDietVO> memberInfo(SpoDietVO param);
}
