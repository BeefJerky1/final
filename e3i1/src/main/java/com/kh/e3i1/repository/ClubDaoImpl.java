package com.kh.e3i1.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.e3i1.entity.ClubDto;
import com.kh.e3i1.entity.ClubLikeDto;
import com.kh.e3i1.entity.ClubMemberDto;
import com.kh.e3i1.entity.MemberDto;
import com.kh.e3i1.vo.ClubComplexSearchVO;
import com.kh.e3i1.vo.ClubDetailVO;
import com.kh.e3i1.vo.ClubLikeVO;
import com.kh.e3i1.vo.ClubListVO;
import com.kh.e3i1.vo.ClubMemberListVO;

@Repository
public class ClubDaoImpl implements ClubDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private ClubMemberDao clubMemberDao;
	
	// 소모임 전체목록
	@Override
	public List<ClubListVO> list(int page, String orderType) {
		Map<String, Object> param = new HashMap<>();
		param.put("page", page);
		param.put("orderType", orderType);
		return sqlSession.selectList("club.list", param);
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
	
	// 소모임 번호로 하나 조회
	@Override
	public ClubDto one(int clubNo) {
		return sqlSession.selectOne("club.one", clubNo);
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

	// main 리스트 출력 기능
	@Override
	public List<ClubLikeVO> bestClub() {
		return sqlSession.selectList("club.bestClubList");
	}
	
	
	// 결제시 소모임 인원제한 증가
	@Override
	public void clubPlus(int clubPlusNo, int clubNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("clubPlusNo", clubPlusNo);
		param.put("clubNo", clubNo);
		sqlSession.update("club.clubPlus",param);
	}

	@Override
	public boolean isLimit(int clubNo, int clubPlusNo) {
		ClubDto clubDto = sqlSession.selectOne("club.one",clubNo);
		int plus = 0;
		
		if(clubPlusNo == 1) plus = 10;
		if(clubPlusNo == 2) plus = 30;
		if(clubPlusNo == 3) plus = 50;
		if(clubPlusNo == 4) plus = 100;
		
		if(plus + clubDto.getClubMemberLimit() > 200) {
			return true;
		}
		return false;
	}
	
	// 소모임 회원 여부
	@Override
	public ClubMemberDto isClubMember(int clubNo, int memberNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("clubNo", clubNo);
		param.put("memberNo", memberNo);
		return sqlSession.selectOne("club.isClubMember", param);
	}
	
	@Override
	public List<ClubDto> isClubLeader(int memberNo) {
		return sqlSession.selectList("club.isLeader",memberNo);
	}

	// 소모임 회원한테 리더 양도
	@Override
	public int passLeader(ClubDto clubDto) {
		List<ClubMemberListVO> list = clubMemberDao.select(clubDto.getClubNo());
		System.out.println("회원수 : "+list.size());
		// 만약 소모임 회원이 나뿐이라면 양도없이 그냥 소모임 삭제
		if(list.size() <= 1) {
			sqlSession.delete("club.delete",clubDto.getClubNo());
			return 0;
		}
		int nextLeader = list.get(1).getClubMemberDto().getMemberNo();
		System.out.println("nextLeader:"+nextLeader);
		
		Map<String, Object> param = new HashMap<>();
		param.put("nextLeader", nextLeader);
		param.put("clubNo", clubDto.getClubNo());
		sqlSession.update("club.passLeader",param);
		return nextLeader;
	}

	// 소모임 삭제
	@Override
	public void deleteClub(int clubNo) {
		sqlSession.delete("club.delete",clubNo);
	}
}
