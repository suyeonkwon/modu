package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.ReviewBoardMapper;

public class ReviewBoardDao {
	private Class<ReviewBoardMapper> cls = ReviewBoardMapper.class; 
	private Map<String, Object> map = new HashMap<>(); 
	
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

	public boolean insert(ReviewBoard review) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).insert(review);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public int boardcnt(int category, String find) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("category",category);
			map.put("find",find);
			return session.getMapper(cls).boardcnt(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public List<ReviewBoard> reviewboard(int category, String find) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("category", category);
			map.put("find", find);
			return session.getMapper(cls).reviewboard(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public List<ReviewBoard> reviewboard2(int category, String find) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear(); 
			map.put("category", category);
			map.put("find", find);
			return session.getMapper(cls).reviewboard2(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public ReviewBoard select(int reviewNo) {
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

	public int reviewcnt(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).reviewcnt(id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public List<ReviewBoard> list(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).list(id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public boolean update(ReviewBoard review) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).update(review);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public int delete(int reviewNo) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).delete(reviewNo);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}


}
