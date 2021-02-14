package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Comment;

public interface CommentMapper {

	@Select("select * from comment where reviewNo=#{value} order by regdate desc")
	List<Comment> select(int reviewNo);

	@Select("select ifnull(max(commentNo),0) from comment")
	int maxnum();

	@Insert("insert into comment(commentNo,comment,regdate,reviewNo,id)"+ 
			"values(#{commentNo},#{comment},#{regdate},#{reviewNo},#{id})")
	int insert(Comment com);

	@Update("update comment set comment=#{comment} where commentNo=${commentNo}")
	int update(Map<String, Object> map);

	@Delete("delete from comment where commentNo=${value}")
	int delete(int commentNo);

	@Select("select count(*) from comment where reviewNo=#{value}")
	int cnt(int reviewNo);

}
