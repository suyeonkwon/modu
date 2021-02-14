package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Trip;

public interface TripMapper {

	@Insert("insert into trip(id,city,tripTitle,startDate,endDate,cityLat,cityLng,countryCode)"+
			"values(#{id},#{city},#{tripTitle},#{startDate},#{endDate},#{cityLat},#{cityLng},#{countryCode})")
	int insert(Trip trip);

	@Select("select count(*) from trip where id=#{value}")
	int tripcnt(String id);

	@Select({"<script>",
		"select * from trip",
		"<if test='id!=null'> where id=#{id}</if>",
		"<if test='tripNo!=null'> where tripNo=#{tripNo}</if>",
		"</script>"})
	List<Trip> list(Map<String, Object> map);

	@Select("select cityLat, cityLng, countryCode from trip where tripNo=#{tripNo}")
	Trip location(Map<String, Object> map);

	@Update("update trip set tripTitle=#{tripTitle}, startDate=#{startDate}, endDate=#{endDate} where tripNo=#{tripNo} ")
	int update(Trip trip);

	@Delete("delete from trip where tripNo=#{value}")
	int delete(int tripNo);

	@Update("update trip set comment=#{comment}, picture=#{picture}, share=#{share}, regdate=#{regdate} where tripNo=${tripNo}")
	int share(Trip trip);

	@Select({"<script>",
			"select count(*) from trip where share=1",
			"<if test='find!=null'>and city like '%${find}%'</if>",
			"</script>"})
	int boardcnt(Map<String, Object> map);

	@Select({"<script>",
		"select * from trip where share=1",
		"<choose>",
		"<when test='find!=null'>and city like '%${find}%' order by regdate desc</when>",
		"<otherwise>order by regdate desc</otherwise>",
		"</choose>",
		"</script>"})
	List<Trip> planboard(Map<String, Object> map);
	
	@Select({"<script>",
		"select * from trip where share=1",
		"<if test='find!=null'>and city like '%${find}%'</if>",
		"order by (SELECT COUNT(*) FROM likebook WHERE tripNo=trip.tripNo and type=1) desc",
		"</script>"})
	List<Trip> planboard2(Map<String, Object> map);

}
