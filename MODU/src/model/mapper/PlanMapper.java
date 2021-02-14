package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Plan;

public interface PlanMapper {

	@Select("select * from plan where tripNo=#{tripNo} ORDER BY planDate, planTime")
	List<Plan> select(Map<String, Object> map);

	@Insert("insert into plan(tripNo,planSeq,id,planDate,planTime,memo,place,lat,lng)"+
			"values(#{tripNo},#{planSeq},#{id},#{planDate},#{planTime},#{memo},#{place},#{lat},#{lng})")
	int insert(Plan plan);

	@Select("select ifnull(max(planSeq),0) from plan")
	int maxSeq(int tripNo);

	@Select("select * from plan where tripNo=#{tripNo} and planDate=#{planDate}")
	List<Plan> location(Map<String, Object> map);

	@Delete("delete from plan where planSeq=#{value}")
	int delete(int planSeq);

	@Update("update plan set planDate=#{planDate}, planTime=#{planTime}, memo=#{memo}, place=#{place}, lat=#{lat}, lng=#{lng} where planSeq=#{planSeq}")
	int update(Plan plan);
	

	@Select("select * from plan where planSeq=#{value}")
	Plan planselect(int planSeq);
}
