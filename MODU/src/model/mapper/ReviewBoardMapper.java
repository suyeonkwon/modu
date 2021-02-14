package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.ReviewBoard;

public interface ReviewBoardMapper {

	@Select("SELECT ifnull(MAX(reviewNo),0) FROM reviewboard ")
	int maxnum();

	@Insert("insert into reviewboard(reviewNo,id,subject,content,regdate,file,place,category,url,address)"+
			"values(#{reviewNo},#{id},#{subject},#{content},#{regdate},#{file},#{place},#{category},#{url},#{address})")
	void insert(ReviewBoard review);

	@Select({"<script>",
			"select count(*) from reviewboard",
			"<if test='category!=0 &amp;&amp; find!=null'> where category=#{category} and address like '%${find}%' </if>",
			"<if test='category!=0'> where category=#{category}</if>",
			"<if test='find!=null'> where address like '%${find}%'</if>",
			"</script>"})
	int boardcnt(Map<String, Object> map);
	
	@Select({"<script>",
		"select * from reviewboard",
		"<if test='category!=0 &amp;&amp; find!=null'> where category=#{category} and address like '%${find}%' </if>",
		"<if test='category!=0'> where category=#{category}</if>",
		"<if test='find!=null'> where address like '%${find}%'</if>",
		"order by regdate desc",
		"</script>"})
	List<ReviewBoard> reviewboard(Map<String, Object> map);
	
	@Select({"<script>",
		"select * from reviewboard",
		"<if test='category!=0 &amp;&amp; find!=null'> where category=#{category} and address like '%${find}%' </if>",
		"<if test='category!=0'> where category=#{category}</if>",
		"<if test='find!=null'> where address like '%${find}%'</if>",
		"order by (SELECT COUNT(*) FROM likebook WHERE reviewNo=reviewboard.reviewNo) desc",
		"</script>"})
	List<ReviewBoard> reviewboard2(Map<String, Object> map);

	@Select("select * from reviewboard where reviewNo=#{value}")
	ReviewBoard select(int reviewNo);

	@Select("select count(*) from reviewboard where id=#{value}")
	int reviewcnt(String id);

	@Select("select * from reviewboard where id=#{value}")
	List<ReviewBoard> list(String id);

	@Update("update reviewboard set subject=#{subject}, content=#{content}, file=#{file}, place=#{place}, url=#{url}, address=#{address}"+
	"where reviewNo=#{reviewNo}")
	boolean update(ReviewBoard review);

	@Delete("delete from reviewboard where reviewNo=#{value}")
	int delete(int reviewNo);

}
