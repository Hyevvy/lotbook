package mem;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import app.dto.Member;
import app.mem.MemServiceImpl;

public class MemSelect {
	@Test
	public void test() {
		MemServiceImpl service;
		service = new MemServiceImpl();
		
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
