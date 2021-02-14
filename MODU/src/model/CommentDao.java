package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.CommentMapper;


public class CommentDao {
	private Class<CommentMapper> cls = CommentMapper.class;
	private Map<String, Object> map = new HashMap<>();
	
	public List<Comment> select(int reviewNo) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).select(reviewNo);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public int maxnum() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxnum();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int insert(Comment com) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).insert(com);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int update(int commentNo, String comment) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("commentNo", commentNo);
			map.put("comment", comment);
			return session.getMapper(cls).update(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int delete(int commentNo) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).delete(commentNo);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int cnt(int reviewNo) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).cnt(reviewNo);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

}
