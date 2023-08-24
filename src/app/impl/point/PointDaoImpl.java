package app.impl.point;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.entity.Point;
import app.frame.DaoFrame;

public class PointDaoImpl implements DaoFrame<Point, Point> {

	@Override
	public int insert(Point v, SqlSession session) throws Exception {
		return session.insert("point.insert", v);
	}

	@Override
	public int update(Point v, SqlSession session) throws Exception {
		return session.update("point.update", v);
	}

	@Override
	public int delete(Point k, SqlSession session) throws Exception {
		return 0;
	}

	@Override
	public Point select(Point k, SqlSession session) throws Exception {
		return null;
	}

	public int selectMemberSeq(SqlSession session) throws Exception {
		return session.selectOne("point.select");
	}
	
	@Override
	public List<Point> select(SqlSession session) throws Exception {
		return null;
	}
	
	public List<Point> selectAll(Point v, SqlSession session) throws Exception {
		return session.selectList("point.selectAll", v);
	}

}
