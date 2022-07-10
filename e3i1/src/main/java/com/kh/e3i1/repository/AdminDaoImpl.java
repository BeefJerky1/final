package com.kh.e3i1.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.ClubBoardReplyDto;
import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.MbtiSurveyDto;
import com.kh.e3i1.entity.MemberDto;

@Repository
public class AdminDaoImpl implements AdminDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	//회원 목록
	@Override
	public List<MemberDto> memberList(String orderType) {
		return sqlSession.selectList("admin.memberlist",orderType);
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
	
	//소모임 목록
	@Override
	public List<ClubDto> clubList(String orderType) {
		return sqlSession.selectList("admin.clublist",orderType);
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
}

