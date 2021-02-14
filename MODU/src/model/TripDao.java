package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.TripMapper;

public class TripDao {
	private Class<TripMapper> cls = TripMapper.class;
	private Map<String, Object> map = new HashMap<>();
	
	public int insert(Trip trip) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).insert(trip);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int tripcnt(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).tripcnt(id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public List<Trip> list(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("id",id);
			List<Trip> list = session.getMapper(cls).list(map);
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

//	public Map<String, Date> select(int tripNo) {
//		SqlSession session = MyBatisConnection.getConnection();
//		try {
//			Map<String,Date> map = session.getMapper(cls).select(tripNo);
//			return map;
//		}catch(Exception e) {
//			e.printStackTrace();
//		}finally {
//			MyBatisConnection.close(session);
//		}
//		return null;
//	}

	public Trip select(int tripNo) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("tripNo", tripNo);
			List<Trip> list = session.getMapper(cls).list(map);
			return list.get(0);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public Trip location(int tripNo) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("tripNo", tripNo);
			Trip location = session.getMapper(cls).location(map);
			return location;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public int update(Trip trip) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).update(trip);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int delete(int tripNo) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).delete(tripNo);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int share(Trip trip) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).share(trip);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int boardcnt(String find) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("find", find);
			return session.getMapper(cls).boardcnt(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public List<Trip> planboard(String find) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("find", find);
			return session.getMapper(cls).planboard(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public List<Trip> planboard2(String find) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("find", find);
			return session.getMapper(cls).planboard2(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}




}
