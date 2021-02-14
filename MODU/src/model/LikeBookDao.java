package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.LikeBookMapper;

public class LikeBookDao {
	private Class<LikeBookMapper> cls = LikeBookMapper.class;
	private Map<String, Object> map = new HashMap<>();

	public Integer likecnt(int tripNo) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).likecnt(tripNo);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public Integer cnk(int tripNo, String id, int type) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("tripNo", tripNo);
			map.put("id", id);
			map.put("type",type);
			return session.getMapper(cls).chk(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public int add(int type,String id, int tripNo) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("tripNo", tripNo);
			map.put("id", id);
			map.put("type", type);
			return session.getMapper(cls).add(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int delete(int type,String id, int tripNo) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("tripNo", tripNo);
			map.put("id", id);
			map.put("type", type);
			return session.getMapper(cls).delete(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int addrv(int type, String id, int reviewNo) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("reviewNo", reviewNo);
			map.put("id", id);
			map.put("type", type);
			return session.getMapper(cls).add(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int deleterv(int type, String id, int reviewNo) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("reviewNo", reviewNo);
			map.put("id", id);
			map.put("type", type);
			return session.getMapper(cls).delete(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public Integer likecntRv(int reviewNo) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).likecntRv(reviewNo);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public Integer chkRv(int reviewNo, String id, int type) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("reviewNo", reviewNo);
			map.put("id", id);
			map.put("type",type);
			return session.getMapper(cls).chkRv(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public int bookcnt(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).bookcnt(id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public List<LikeBook> list(String id) {
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

}
