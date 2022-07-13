package com.kh.e3i1.repository;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.e3i1.entity.AnimalPhotoDto;
import com.kh.e3i1.entity.ClubBoardDto;
import com.kh.e3i1.entity.ClubBoardReplyDto;
import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.MbtiAnimalDto;
import com.kh.e3i1.entity.MbtiBoardDto;
import com.kh.e3i1.entity.MbtiSurveyDto;
import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.vo.AdminClubSearchVO;
import com.kh.e3i1.vo.AdminMbtiAnimalListVO;
import com.kh.e3i1.vo.AdminSearchVO;
import com.kh.e3i1.vo.ClubMemberListVO;
import com.kh.e3i1.vo.ClubStatisticVO;

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
		return sqlSession.selectList("admin.membersearch", searchVO);
	}
	//소모임 수
	@Override
	public int clubCount() {
		return sqlSession.selectOne("admin.clubCount");
	}
	//소모임 멤버 목록
	@Override
	public List<ClubMemberListVO> clubMemberList(int clubNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("admin.clubMemberList",clubNo);
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
	//소모임 게시글 목록
	@Override
	public List<ClubBoardDto> clubBoardList(String column, String order, int clubNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("column", column);
		param.put("order", order);
		param.put("clubNo", clubNo);
		return sqlSession.selectList("admin.clubboardlist", param);
	}
	//소모임 게시글 검색
	@Override
	public List<ClubBoardDto> clubBoardSearch(AdminClubSearchVO searchVO) {
		return sqlSession.selectList("admin.clubboardsearch",searchVO);			
	}	
	//소모임 게시글 통계
	@Override
	public List<ClubStatisticVO> clubBoardStat(int clubNo) {
		return sqlSession.selectList("admin.clubboardstat", clubNo);
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
	public List<MbtiBoardDto> mbtiBoardList(String column, String order) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("column", column);
		param.put("order", order);
		return sqlSession.selectList("admin.mbtiboardlist", param);
	}

	//소모임 댓글 목록
	@Override
	public List<ClubBoardReplyDto> clubReplyList(int clubNo) {
		return sqlSession.selectList("admin.clubreplylist", clubNo);
	}
	//mbti 게시판 검색
	@Override
	public List<MbtiBoardDto> findBoard(AdminSearchVO searchVO) {
		return sqlSession.selectList("admin.mbtiboardsearch",searchVO);			
	}
	//mbti 게시판 게시글 수 
	@Override
	public int mbtiBoardCount() {
		return sqlSession.selectOne("admin.mbtiboardcount");
	}
	//mbti 동물 리스트
	@Override
	public List<AdminMbtiAnimalListVO> mbtiAnimalList() {
		return sqlSession.selectList("admin.mbtianimallist");
	}
	//mbti 동물 사진 등록
	@Override
	public int insertPhoto(int attachNo , int animalNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("animalNo", animalNo);
		param.put("attachNo", attachNo);
		return sqlSession.insert("admin.mbtiPhotoinsert",param);
	}
	@Override
	public int insertMbtiAnimal(MbtiAnimalDto mbtiAnimalDto) {
		sqlSession.insert("admin.mbtianimalinsert",mbtiAnimalDto);
		return mbtiAnimalDto.getAnimalNo();
	}
	@Override
	public int mbtianimalDelete(int animalNo) {
		sqlSession.delete("admin.mbtianimaldelete",animalNo);
		Integer result = sqlSession.selectOne("admin.selectmbtianimal",animalNo);
		if(result!=null) {
			return 0;
		}else {
			return 1;
		}
	}




}

