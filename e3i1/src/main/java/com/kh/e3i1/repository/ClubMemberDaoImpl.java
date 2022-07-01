package com.kh.e3i1.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.ClubMemberDto;

@Repository
public class ClubMemberDaoImpl implements ClubMemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 소모임 생성시 소모임회원 생성
	@Override
	public void insertClubLeader(int clubNo, int memberNo) {
		int clubMemberNo = sqlSession.selectOne("clubMember.sequence");
		sqlSession.insert("clubMember.insert", ClubMemberDto.builder()
												.clubMemberNo(clubMemberNo)
												.clubNo(clubNo)
												.memberNo(memberNo)
												.clubMemberGrade("방장") // properties로 
												.clubMemberPermission(1) // properties로
											.build());
	}
	
	@Override
	public int insert(ClubMemberDto clubMemberDto) {
		int clubMemberNo = sqlSession.selectOne("clubMember.sequence");
		clubMemberDto.setClubMemberNo(clubMemberNo);
		sqlSession.insert("clubMember.insert", clubMemberDto);
		return clubMemberNo;
	}

	
}
