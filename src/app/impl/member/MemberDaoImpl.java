package app.impl.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.entity.Member;
import app.frame.DaoFrame;

public class MemberDaoImpl implements DaoFrame<Member, Member> {

	@Override
	public int insert(Member v, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Member v, SqlSession session) throws Exception {
		return session.update("member.update", v);
	}

	@Override
	public int delete(Member k, SqlSession session) throws Exception {
		return 0;
	}

	@Override
	public Member select(Member k, SqlSession session) throws Exception {
		// 아이디,비밀번호 검사 
		return session.selectOne("member.select", k);
	}

	@Override
	public List<Member> select(SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	

}
