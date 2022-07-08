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
import com.kh.e3i1.vo.ClubDetailVO;

@Repository
public class ClubDaoImpl implements ClubDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ClubDto> list() {
		return sqlSession.selectList("club.list");
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
	
}
