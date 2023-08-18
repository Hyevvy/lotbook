package member;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import app.dto.Member;
import app.impl.member.MemberServiceImpl;

public class MemberSelect {
	@Test
	public void test() {
		MemberServiceImpl service;
		service = new MemberServiceImpl();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		Member member = Member.builder()
					.email("w@gmail.com")
					.build();
		
		Member loginUser = null;
		try {
			loginUser = service.get(member);
			service.modify(loginUser);
			assertEquals("login 비밀번호 에러", encoder.matches("1", loginUser.getHashedPwd()), true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		encoder = null;
		
	}
}
