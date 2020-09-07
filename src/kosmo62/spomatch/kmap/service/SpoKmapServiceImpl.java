package kosmo62.spomatch.kmap.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo62.spomatch.kmap.dao.SpoKmapMapper;
import kosmo62.spomatch.kmap.vo.SpoKmapVO;



@Service
@Transactional
public class SpoKmapServiceImpl implements SpoKmapService{
	private static Logger log = Logger.getLogger(SpoKmapServiceImpl.class);
	
	@Autowired
	private SpoKmapMapper spoKmapMapper;

	//������ ��ü ��ȸ
	@Override
	public List<SpoKmapVO> listSpoKmap(SpoKmapVO param) {
		
		//�α� �� ����
		log.info("SpoKmapServiceImpl listSpoKmap start >>> : ");
		log.info("SpoKmapServiceImpl listSpoKmap param >>> : " + param);
		
		
		List<SpoKmapVO> list = new ArrayList<SpoKmapVO>();
		list = spoKmapMapper.listSpoKmap(param);
		log.info("SpoKmapServiceImpl listSpoKmap list >>> : " + list);
		return list;
	}

	@Override
	public List<SpoKmapVO> kakaoMapData(SpoKmapVO param) {
		log.info("SpoKmap SpoKmapServiceImpl kakaoMapData start >>> : ");
		log.info("SpoKmap SpoKmapServiceImpl kakaoMapData param >>> : " + param );
		
		List<SpoKmapVO> list = new ArrayList<SpoKmapVO>();
		list = spoKmapMapper.kakaoMapData(param);
		return list;
	}
	
	
	
	
	
	
	

}