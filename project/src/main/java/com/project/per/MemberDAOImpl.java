package com.project.per;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.domain.Member;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Member> getMemberList() {
		return sqlSession.selectList("member.getMemberList");
	}

	@Override
	public Member getIdMember(String id) {
		return sqlSession.selectOne("member.getIdMember",id);
	}
	
	@Override
	public Member getMcodeMember(int mcode) {
		return sqlSession.selectOne("member.getMcodeMember",mcode);
	}
	
	@Override
	public Member getAbleMember(String able) {
		return sqlSession.selectOne("member.getAbleMember",able);
	}

	@Override
	public void insMember(Member member) {
		sqlSession.insert("member.insMember",member);
	}

	@Override
	public void upMember(Member member) {
		sqlSession.update("member.upMember",member);	
	}
	
	@Override
	public void upPw(Member member) {
		sqlSession.update("member.upPw", member);
	}
	
	@Override
	public void upMcode(Member member) {
		sqlSession.update("member.upMcode", member);
	}
	
	@Override
	public void upAble(Member member) {
		sqlSession.update("member.upAble", member);
	}

	@Override
	public void delMember(String id) {
		sqlSession.delete("member.delMember",id);
		
	}
	
}
