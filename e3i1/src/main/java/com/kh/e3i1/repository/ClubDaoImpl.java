package com.kh.e3i1.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.ClubLikeDto;
import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.vo.ClubComplexSearchVO;
import com.kh.e3i1.vo.ClubDetailVO;
import com.kh.e3i1.vo.ClubListVO;

@Repository
public class ClubDaoImpl implements ClubDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 소모임 전체목록
	@Override
	public List<ClubListVO> list(int page) {
		return sqlSession.selectList("club.list", page);
	}
	
	// 소모임 검색목록
	@Override
	public List<ClubListVO> searchList(ClubComplexSearchVO clubComplexSearchVO) {
		return sqlSession.selectList("club.searchList", clubComplexSearchVO);
	}

	
	@Override
	public int create(ClubDto clubDto) {
		// 소모임 생성횟수(member_club_count)가 0일 경우 생성제한 = 0 반환
		// 생성했는지 확인
		MemberDto memberDto = sqlSession.selectOne("member.existClub",clubDto.getClubLeader());
		if(memberDto.getMemberClubCount() == 0) {
			return 0;
		}
		
		int clubNo = sqlSession.selectOne("club.sequence");
		clubDto.setClubNo(clubNo);
		sqlSession.insert("club.create",clubDto);
		// 소모임 생성 횟수 차감
		sqlSession.update("member.minusClubCount",clubDto.getClubLeader());
		
		return clubNo;
	}

	// 소모임 상세페이지
	@Override
	public ClubDetailVO detail(int clubNo) {
		// 
		return sqlSession.selectOne("club.clubDetail",clubNo);
	}
	
	// 소모임 좋아요 여부 
	@Override
	public boolean isLike(int clubNo, int memberNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("clubNo", clubNo);
		param.put("memberNo", memberNo);
		ClubLikeDto existDto = sqlSession.selectOne("club.exist_like", param);
		if(existDto == null) {
			return false;
		}
		return true;
	}
	
	// 소모임 좋아요
	@Override
	public int likeClub(ClubLikeDto clubLikeDto) {
		
		if(!this.isLike(clubLikeDto.getClubNo(), clubLikeDto.getMemberNo())) {
			// 시퀀스 생성
			clubLikeDto.setClubLikeNo(sqlSession.selectOne("club.like_sequence"));
			// 좋아요 테이블 생성 - 좋아요
			sqlSession.insert("club.like_club",clubLikeDto);
			return clubLikeDto.getClubLikeNo();
		}
		else {
			// 좋아요 테이블 삭제 - 취소
			sqlSession.delete("club.like_cancel",clubLikeDto);
			return 0;
		}
	}
	
	// 소모임 정보 변경 
	public int editClub(ClubDto clubDto) {
		// sql에서 소모임장 여부도 같이 판단
		return sqlSession.update("club.edit",clubDto);
	}

	// 상단 검색바 기능
	@Override
	public List<ClubDto> search(String keyword) {
		
		return sqlSession.selectList("club.search", keyword);
	}

	@Override
	public int count() {
		return sqlSession.selectOne("club.count");
	}
	
}
