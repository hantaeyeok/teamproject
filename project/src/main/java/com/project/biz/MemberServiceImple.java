package com.project.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.project.domain.Member;
import com.project.per.MemberDAO;

@Service
public class MemberServiceImple implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	 
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public List<Member> getMemberList() {
		return memberDAO.getMemberList();
	}

	@Override
	public Member getIdMember(String id) {
		return memberDAO.getIdMember(id);
	}
	
	@Override
	public Member getMcodeMember(int mcode) {
		return memberDAO.getMcodeMember(mcode);
	}
	
	@Override
	public Member getAbleMember(String able) {
		return memberDAO.getAbleMember(able);
	}

	@Override
	public void insMember(Member member) {
		//비밀번호 암호화
        String hashedPassword = passwordEncoder.encode(member.getPw());
        member.setPw(hashedPassword);
		memberDAO.insMember(member);
		
	}

	@Override
	public void upMember(Member member) {
		memberDAO.upMember(member);
	}
	
	@Override
	public void upPw(Member member) {
		//비밀번호 암호화
		String hashedPassword = passwordEncoder.encode(member.getPw());
		member.setPw(hashedPassword);
		memberDAO.upPw(member);
	}
	
	@Override
	public void upMcode(Member member) {
		memberDAO.upMcode(member);
	}
	
	@Override
	public void upAble(Member member) {
		memberDAO.upAble(member);
	}

	@Override
	public void delMember(String id) {
		memberDAO.delMember(id);
	}
	
	@Override
    public boolean checkPassword(String rawPassword, String encodedPassword) {
        return passwordEncoder.matches(rawPassword, encodedPassword);
    }
	
}
