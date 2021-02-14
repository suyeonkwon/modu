package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.MemberMapper;

public class MemberDao {
	private Class<MemberMapper> cls = MemberMapper.class;
	private Map<String, Object> map = new HashMap<>();
		
	public int insert(Member mem) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).insert(mem);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public Member selectOne(String id) throws IndexOutOfBoundsException{
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("id", id);
			List<Member> list = session.getMapper(cls).select(map);
			return list.get(0);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public Member selectNick(String nick) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("nick", nick);
			List<Member> list = session.getMapper(cls).select(map);
			return list.get(0);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public int checkid(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).checkid(id);
			return cnt;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int checknick(String nick) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).checknick(nick);
			return cnt;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int update(Member mem) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).update(mem);
			return cnt;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int updatePw(Member mem) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).updatePw(mem);
			return cnt;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int checkemail(String email) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).checkemail(email);
			return cnt;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public String findid(String email) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).findid(email);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public String findpw(String email, String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).findpw(email,id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public int delete(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).delete(id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}


}
