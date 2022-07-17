package com.kh.e3i1.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.vo.MemberComplexSearchVO;
import com.kh.e3i1.vo.MemberDetailVO;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	//회원가입
	@Override
	public int join(MemberDto memberDto) {
		String rawPassword = memberDto.getMemberPw();
		String encryptPassword = passwordEncoder.encode(rawPassword);
		//memberDto.setMemberPw(encryptPassword);
		int memberNo = sqlSession.selectOne("member.sequence");
		memberDto.setMemberNo(memberNo);
		sqlSession.insert("member.join", memberDto);
		return memberNo;
	}
	
	//로그인
	@Override
	public MemberDto login(String memberEmail, String memberPw) {
		MemberDto memberDto = sqlSession.selectOne("member.existEmail",memberEmail);
		if(memberDto == null) {
			return null;
		}
		boolean isPasswordMatch = memberDto.getMemberPw().equals(memberPw);
		//boolean isPasswordMatch = passwordEncoder.matches(memberPw, memberDto.getMemberPw());
		
		if(isPasswordMatch) {
			sqlSession.update("member.updateLastLogin", memberEmail);
			return memberDto;
		}
		else {
			return null;
		}
	}
	
	//회원 검색
	@Override
	public List<MemberDto> complexSearch(MemberComplexSearchVO vo) {
		List<MemberDto> list = sqlSession.selectList("member.complexSearch", vo);
		return list;
	}

	
	//비밀번호 변경
	@Override
	public boolean changePassword(String memberEmail, String currentPw, String changePw) {
		//현재 정보로 일치하는지 검사
		MemberDto memberDto = this.login(memberEmail, currentPw);
		if(memberDto == null) {
			return false;
		}
		//String encodePassword = passwordEncoder.encode(changePw);
		
		int count = sqlSession.update("member.changePassword", 
				MemberDto.builder().memberEmail(memberEmail).memberPw(changePw).build());
		
		return count > 0;
	}
	
	@Override
	public boolean changePassword(MemberDto memberDto) {
		//암호화를 거친 뒤 등록될 수 있도록 처리
		String rawPassword = memberDto.getMemberPw();
		String encryptPassword = passwordEncoder.encode(rawPassword);
		memberDto.setMemberPw(encryptPassword);
		int count = sqlSession.update("member.changePassword", memberDto);
		return count > 0;
	}

	//회원 탈퇴
	@Override
	public boolean exit(String memberEmail, String memberPw) {
		MemberDto memberDto = this.login(memberEmail, memberPw);
		if(memberDto == null) {
			return false;
		}
		else {
			int count = sqlSession.delete("member.exit", memberEmail);
			return count > 0;
		}
	}

	
	//이메일 찾기
	@Override
	public String findEmail(MemberDto memberDto) {
		return sqlSession.selectOne("member.findEmail", memberDto);
	}
	
	//비밀번호 찾기
	@Override
	public MemberDto find(MemberDto memberDto) {
		return sqlSession.selectOne("member.find", memberDto);
	}
	
	// 회원 조회용 구문
	@Override
	public List<MemberDto> list() {
		
		return sqlSession.selectList("member.list");
	}
	
	// 회원정보
	@Override
	public MemberDto info(int memberNo) {
		return sqlSession.selectOne("member.one", memberNo);
	}
	
	//회원정보 수정
	@Override
	public boolean changeInformation(MemberDto memberDto) {
		MemberDto findDto = this.login(memberDto.getMemberEmail(), memberDto.getMemberPw());
		if(findDto == null) {
			return false;
		}
		else {
			int count = sqlSession.update("member.changeInformation", memberDto);
			return count > 0;
		}
	}
	
	// 마이페이지 회원 정보
	@Override
	public MemberDetailVO mypageMember(int memberNo) {
		return sqlSession.selectOne("member.mypageMember",memberNo);
	}
	
	// 마에페이지 회원 소모임 정보
	@Override
	public List<MemberDetailVO> mypageClub(int memberNo) {
		return sqlSession.selectList("member.mypageClub",memberNo);
	}

	@Override
	public List<MemberDetailVO> mypageMbti(int memberNo) {
		return sqlSession.selectList("member.mypageMbti", memberNo);
	}
	
	@Override
	public int mypageInterest(MemberDto memberDto) {
		return sqlSession.update("member.changeInformation", memberDto);
	}
}
