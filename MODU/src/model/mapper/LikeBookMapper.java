package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import model.LikeBook;

public interface LikeBookMapper {

	@Select("select count(*) from likebook where tripNo=#{value} and type=1")
	Integer likecnt(int tripNo);
		
	@Select("select count(*) from likebook where tripNo=#{tripNo} and id=#{id} and type=#{type}")
	Integer chk(Map<String, Object> map);
	
	
	@Insert({"<script>",
			"<if test='tripNo!=null'> insert into likebook(type,tripNo,id) values(#{type},#{tripNo},#{id})</if>",
			"<if test='reviewNo!=null'> insert into likebook(type,reviewNo,id) values(#{type},#{reviewNo},#{id})</if>",
			"</script>"})
	int add(Map<String, Object> map);
	
	@Delete({"<script>",
			"<if test='tripNo!=null'> delete from likebook where tripNo=#{tripNo} and id=#{id} and type=#{type} </if>",
			"<if test='reviewNo!=null'> delete from likebook where reviewNo=#{reviewNo} and id=#{id} and type=#{type} </if>",
			"</script>"})
	int delete(Map<String, Object> map);

	@Select("select count(*) from likebook where reviewNo=#{reviewNo} and type=1")
	Integer likecntRv(int reviewNo);

	@Select("select count(*) from likebook where reviewNo=#{reviewNo} and id=#{id} and type=#{type}")
	Integer chkRv(Map<String, Object> map);

	@Select("select count(*) from likebook where id=#{value} and type=2")
	int bookcnt(String id);

	@Select("select * from likebook where id=#{value} and type=2")
	List<LikeBook> list(String id);

}
