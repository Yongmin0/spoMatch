package kosmo62.spomatch.login.service;


import java.util.List;

import kosmo62.spomatch.login.vo.SpoLoginVO;

public interface SpoLoginService {

	public List<SpoLoginVO> login(SpoLoginVO param);
	public List<SpoLoginVO> findid(SpoLoginVO param);

}
