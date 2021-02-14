package model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Member;

public interface MemberMapper {

	@Insert("insert into member(id,pw,nick,profile,email) values(#{id},#{pw},#{nick},#{profile},#{email})")
	int insert(Member mem);

	@Select({"<script>",
			"select * from member",
			"<if test='id!=null'> where binary id=#{id}</if>",
			"</script>"})
	List<Member> select(Object object);

	@Select("select count(*) from member where id=#{id}")
	int checkid(@Param("id")String id);

	@Select("select count(*) from member where nick=#{nick}")
	int checknick(String nick);

	@Update("update member set nick=#{nick}, profile=#{profile} where id=#{id}")
	int update(Member mem);

	@Update("update member set pw=#{pw} where id=#{id}")
	int updatePw(Member mem);

	@Select("select count(*) from member where email=#{value}")
	int checkemail(String email);

	@Select("select id from member where email=#{value}")
	String findid(String email);

	@Select("select pw from member where email=#{email} and id=#{id}")
	String findpw(@Param("email")String email, @Param("id")String id);

	@Delete("delete from member where id=#{value}")
	int delete(String id);
}
