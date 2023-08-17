package mem;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import app.dto.entity.Member;
import app.impl.member.MemberServiceImpl;

public class MemberSelect {
	@Test
	public void test() {
		MemberServiceImpl service;
		service = new MemberServiceImpl();
		
		Member member = Member.builder()
					.email("w@gmail.com")
					.hashedPwd("1")
					.build();
		
		Member loginUser = null;
		try {
			loginUser = service.get(member);
			assertEquals("login 에러", "1", loginUser.getHashedPwd());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
