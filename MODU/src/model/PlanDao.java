package model;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.PlanMapper;


public class PlanDao {
	private Class<PlanMapper> cls = PlanMapper.class; 
	private Map<String, Object> map = new HashMap<>(); 

	public List<Plan> list(int tripNo) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("tripNo", tripNo);
			List<Plan> list = session.getMapper(cls).select(map);
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public int insert(Plan plan) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).insert(plan);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int maxSeq(int tripNo) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxSeq(tripNo);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public List<Plan> location(int tripNo, Date planDate) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("tripNo", tripNo);
			map.put("planDate", planDate);
			List<Plan> list = session.getMapper(cls).location(map);
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public Plan select(int planSeq) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).planselect(planSeq);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public int delete(int planSeq) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).delete(planSeq);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int update(Plan plan) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).update(plan);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
}
