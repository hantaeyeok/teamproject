package com.project.per;

import java.util.List;

import com.project.domain.Member;

public interface MemberDAO {
	public List<Member> getMemberList();
	public Member getIdMember(String id);
	public Member getMcodeMember(int mcode);
	public Member getAbleMember(String able);
	public void insMember(Member member);
	public void upMember(Member member);
	public void upPw(Member member);
	public void upMcode(Member member);
	public void upAble(Member member);
	public void delMember(String id);
}
