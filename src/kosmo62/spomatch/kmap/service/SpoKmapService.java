package kosmo62.spomatch.kmap.service;

import java.util.List;

import kosmo62.spomatch.kmap.vo.SpoKmapVO;

public interface SpoKmapService {
	//전체 조회
	public List<SpoKmapVO> listSpoKmap(SpoKmapVO param);
	
	//Ajax 이벤트 객체 불러오기
	public List<SpoKmapVO> kakaoMapData(SpoKmapVO param);
}