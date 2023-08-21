package member;

import static org.junit.Assert.*;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import app.dto.entity.Member;
import app.frame.GetSessionFacroty;
import app.impl.member.MemberServiceImpl;

public class MemberInsert {
	SqlSession session;
	
	@Test
	public void test() {
		MemberServiceImpl service;
		service = new MemberServiceImpl();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		Member member = Member.builder()
				.email("test@gmail.com")
				.hashedPwd(encoder.encode("test"))
				.name("t")
				.memberPhone("01012345678")
				.zipcode("012345")
				.streetAddress("서울시 송파구"+" "+"올림픽로")
				.addressDetail("새천년대로445")
				.build();
		
		try {
			session = GetSessionFacroty.getInstance().openSession();
			int res = service.register(member);
			assertEquals("회원가입 에러", res, 1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			System.out.println("----rollback 처리완료---");
			session.rollback();
			session.close();
		}
		
	}
}
