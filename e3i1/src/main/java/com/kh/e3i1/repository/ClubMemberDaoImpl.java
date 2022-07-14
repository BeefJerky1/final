package com.kh.e3i1.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.ClubMemberDto;
import com.kh.e3i1.vo.ClubMemberListVO;

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
		ClubMemberDto isExist = this.one(clubMemberDto.getClubNo(), clubMemberDto.getMemberNo());
		System.out.println(isExist);
		if(isExist != null) {
			return 0;
		}
		
		int clubMemberNo = sqlSession.selectOne("clubMember.sequence");
		clubMemberDto.setClubMemberNo(clubMemberNo);
		sqlSession.insert("clubMember.insert", clubMemberDto);
		return clubMemberNo;
	}
	
	// 소모임회원 단일 조회 - clubNo, memberNo 필요
	@Override
	public ClubMemberDto one(int clubNo, int memberNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("clubNo", clubNo);
		param.put("memberNo", memberNo);
		return sqlSession.selectOne("clubMember.one",param);
	}
	
	// 소모임 신청 회원 조회
	@Override
	public List<ClubMemberListVO> selectPermission(int clubNo) {
		return sqlSession.selectList("clubMember.clubMemberPermissionList",clubNo);
	}
	
	// 소모임 회원 조회
	@Override
	public List<ClubMemberListVO> select(int clubNo) {
		return sqlSession.selectList("clubMember.clubMemberList",clubNo);
	}

	// 소모임 가입 승인
	@Override
	public int approveClub(int clubMemberNo) {
		return sqlSession.update("clubMember.approve",clubMemberNo);
	}
	
	// 소모임 가입 거절
	@Override
	public int refuseClub(ClubMemberDto clubMemberDto) {
		return sqlSession.update("clubMember.refuse", clubMemberDto);
	}

	@Override
	public int check(int clubNo, int memberNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("clubNo", clubNo);
		param.put("memberNo", memberNo);
		ClubMemberDto clubMemberDto = sqlSession.selectOne("clubMember.one",param);
		if(clubMemberDto==null) {
			return 2;
		}else {		
			return 1;
		}
	}
	
}
