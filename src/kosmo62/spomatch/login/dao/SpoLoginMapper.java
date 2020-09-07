package kosmo62.spomatch.login.dao;

import java.util.List;

import kosmo62.spomatch.login.vo.SpoLoginVO;

public interface SpoLoginMapper {

	public List<SpoLoginVO> login(SpoLoginVO param);
	public List<SpoLoginVO> findid(SpoLoginVO param);
	public int updatepw(SpoLoginVO param);
}
