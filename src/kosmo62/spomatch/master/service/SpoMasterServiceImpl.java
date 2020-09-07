package kosmo62.spomatch.master.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo62.spomatch.master.dao.SpoMasterMapper;
import kosmo62.spomatch.master.vo.SpoMasterVO;


@Service
@Transactional

public class SpoMasterServiceImpl implements SpoMasterService {
	
	@Autowired
	private SpoMasterMapper spoMasterMapper;
	
	
	@Override
	public SpoMasterVO selectSpoMember(SpoMasterVO param) {
		// TODO Auto-generated method stub
		return spoMasterMapper.selectSpoMember(param);
	}
	@Override
	public List<SpoMasterVO> listSpoMember(SpoMasterVO param) {
		List<SpoMasterVO> listNotice =null;
		listNotice = spoMasterMapper.listSpoMember2(param);
		return listNotice;
	}
	@Override
	public List<SpoMasterVO> getMatchCountAll(SpoMasterVO param) {
		List<SpoMasterVO> listAlldata =null;
		listAlldata = spoMasterMapper.getMatchCountAll(param);
		return listAlldata;
	}
	@Override
	public List<SpoMasterVO> getMatchCountToday(SpoMasterVO param) {
		List<SpoMasterVO> newCountToday =null;
		newCountToday = spoMasterMapper.getMatchCountToday(param);
		return newCountToday;
	}
	@Override
	public List<SpoMasterVO> getNewMemberToday(SpoMasterVO param) {
		List<SpoMasterVO> newMemberToday =null;
		newMemberToday = spoMasterMapper.getNewMemberToday(param);
		return newMemberToday;
	}
	@Override
	public List<SpoMasterVO> getNewMemberCountAll(SpoMasterVO param) {
		List<SpoMasterVO> listAllMemberdata =null;
		listAllMemberdata = spoMasterMapper.getNewMemberCountAll(param);
		return listAllMemberdata;
	}

	
}
