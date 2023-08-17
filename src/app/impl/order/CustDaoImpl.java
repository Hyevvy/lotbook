package app.impl.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.Cust;
import app.frame.DaoFrame;

public class CustDaoImpl implements DaoFrame<String, Cust> {

	@Override
	public int insert(Cust v, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return session.insert("cust.insert", v);
	}

	@Override
	public int update(Cust v, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return session.insert("cust.update", v);
	}

	@Override
	public int delete(String k, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return session.insert("cust.delete", k);
	}

	@Override
	public Cust select(String k, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("cust.select", k);
	}

	@Override
	public List<Cust> select(SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("cust.selectall");
	}

}
