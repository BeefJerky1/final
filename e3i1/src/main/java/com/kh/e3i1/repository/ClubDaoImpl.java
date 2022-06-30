package com.kh.e3i1.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.MemberDto;

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

}
