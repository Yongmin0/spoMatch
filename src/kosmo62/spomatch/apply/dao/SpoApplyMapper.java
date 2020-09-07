package kosmo62.spomatch.apply.dao;

import java.util.List;

import kosmo62.spomatch.apply.vo.SpoApplyVO;

public interface SpoApplyMapper {
	public List<SpoApplyVO> listApply(SpoApplyVO param);
	public List<SpoApplyVO> viewApplyMatch(SpoApplyVO param);
	public SpoApplyVO viewApply(SpoApplyVO param);
	public List<SpoApplyVO> applyCheckMatch(SpoApplyVO param);
	public int applyMatch(SpoApplyVO param);
	public int updateApply(SpoApplyVO param);
	public int deleteApply(SpoApplyVO param);
	public int acceptApply(SpoApplyVO param);
}
