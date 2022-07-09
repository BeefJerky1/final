package com.kh.e3i1.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.ClubDto;
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
		int count = sqlSession.update("admin.changeInformation", memberDto);
		return count>0;
	}
	
	//소모임 목록
	@Override
	public List<ClubDto> clubList(String orderType) {
		return sqlSession.selectList("admin.clublist",orderType);
	}
	@Override
	public int deleteClub(int clubNo) {
		int count = sqlSession.delete("admin.deleteClub", clubNo);
		return count;
	}
	@Override
	public ClubDto oneClub(int clubNo) {
		return sqlSession.selectOne("admin.oneClub", clubNo);
	}
}

