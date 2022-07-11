package com.kh.e3i1.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.ClubBoardReplyDto;
import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.MbtiBoardDto;
import com.kh.e3i1.entity.MbtiSurveyDto;
import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.vo.AdminSearchVO;

@Repository
public class AdminDaoImpl implements AdminDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	//회원 목록
	@Override
	public List<MemberDto> memberList(String column, String order) {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("column", column);
			param.put("order", order);
			return sqlSession.selectList("admin.memberlist",param);			
	}
	//회원 검색
	@Override
	public List<MemberDto> memberSearch(AdminSearchVO searchVO) {
			return sqlSession.selectList("admin.membersearch",searchVO);			
	}
	//회원 총 숫자
	@Override
	public int memberCount() {
		return sqlSession.selectOne("admin.memberCount");
	}
	//회원삭제
	@Override
	public int deleteMember(int memberNo) {
		int count = sqlSession.delete("admin.deleteMember", memberNo);
		return count;
	}
	//회원 상세조회
	@Override
	public MemberDto oneMember(int memberNo) {
		return sqlSession.selectOne("admin.oneMember", memberNo);
	}

	//회원정보 수정
	public boolean changeMember(MemberDto memberDto) {
		int count = sqlSession.update("admin.changeMemberInformation", memberDto);
		return count>0;
	}
	//회원 검색
	@Override
	public List<MemberDto> findMember(AdminSearchVO searchVO) {
		List<MemberDto> list = sqlSession.selectList("admin.findMember", searchVO);
		if(list.isEmpty()) {
//			throw new CannotFindException();
			return null;
		}else {
			return list;			
		}
	}
	//소모임 수
	@Override
	public int clubCount() {
		return sqlSession.selectOne("admin.clubCount");
	}
	//소모임 목록
	@Override
	public List<ClubDto> clubList(String column, String order) {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("column", column);
			param.put("order", order);
			return sqlSession.selectList("admin.clublist",param);			
	}
	//소모임 검색
	@Override
	public List<ClubDto> clubSearch(AdminSearchVO searchVO) {
			return sqlSession.selectList("admin.clubsearch",searchVO);			
	}
	//소모임 삭제
	@Override
	public int deleteClub(int clubNo) {
		int count = sqlSession.delete("admin.deleteClub", clubNo);
		return count;
	}
	//소모임 상세조회
	@Override
	public ClubDto oneClub(int clubNo) {
		return sqlSession.selectOne("admin.oneClub", clubNo);
	}
	//소모임 수정
	@Override
	public boolean changeClub(ClubDto clubDto) {
		int count = sqlSession.update("admin.changeClubInformation", clubDto);
		return count>0;
	}
	
	//mbti 설문 목록
	@Override
	public List<MbtiSurveyDto> mbtiSurveyList() {
		return sqlSession.selectList("admin.mbtisurveylist");
	}
	//mbti 설문 수정
	@Override
	public MbtiSurveyDto changeSurveyInformation(MbtiSurveyDto mbtiSurveyDto) {
		int count = sqlSession.update("admin.changeSurveyInformation", mbtiSurveyDto);
		if(count==0) {
//			throw new CannotFindException();
		}
		return sqlSession.selectOne("admin.oneSurvey", mbtiSurveyDto.getSurveyNo());
	}
	//mbti 설문 추가
	@Override
	public MbtiSurveyDto insert(MbtiSurveyDto mbtiSurveyDto) {
		sqlSession.insert("admin.insert", mbtiSurveyDto);
		return sqlSession.selectOne("admin.oneSurvey", mbtiSurveyDto.getSurveyNo());
	}
	//mbti 설문 삭제
	@Override
	public int deleteSurvey(int surveyNo) {
		int count = sqlSession.delete("admin.deleteSurvey", surveyNo);
		return count;
	}
	//mbti 게시판 목록
	@Override
	public List<MbtiBoardDto> mbtiBoardList() {
		return sqlSession.selectList("admin.mbtiboardlist");
	}



}

