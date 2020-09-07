package kosmo62.spomatch.kmap.dao;

import java.util.List;

import kosmo62.spomatch.kmap.vo.SpoKmapVO;

public interface SpoKmapMapper {
	
	//맵 전체 조회
	public List<SpoKmapVO> listSpoKmap(SpoKmapVO param);
	
	//ajax 값 불러오기
	public List<SpoKmapVO> kakaoMapData(SpoKmapVO param);

}