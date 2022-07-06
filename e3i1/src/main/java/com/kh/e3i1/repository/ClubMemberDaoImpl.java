package com.kh.e3i1.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.ClubMemberDto;

@Repository
public class ClubMemberDaoImpl implements ClubMemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Value("${club.permission}")
	private int permission;
	
	@Value("${club.grade}")
	private int grade;
	
	// 소모임 생성시 소모임회원 생성
	@Override
	public void insertClubLeader(int clubNo, int memberNo) {
		int clubMemberNo = sqlSession.selectOne("clubMember.sequence");
		sqlSession.insert("clubMember.insert", ClubMemberDto.builder()
												.clubMemberNo(clubMemberNo)
												.clubNo(clubNo)
												.memberNo(memberNo)
												.clubMemberGrade(grade) // properties로 
												.clubMemberPermission(permission) // properties로
											.build());
	}
	
	// 소모임회원 가입신청
	@Override
	public int insert(ClubMemberDto clubMemberDto) {
		ClubMemberDto isExist = sqlSession.selectOne("clubMember.one",clubMemberDto);
		System.out.println(isExist);
		if(isExist != null) {
			return 0;
		}
		
		int clubMemberNo = sqlSession.selectOne("clubMember.sequence");
		clubMemberDto.setClubMemberNo(clubMemberNo);
		sqlSession.insert("clubMember.insert", clubMemberDto);
		return clubMemberNo;
	}

	
}
