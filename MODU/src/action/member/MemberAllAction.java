package action.member;


import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.imageio.ImageIO;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.ActionForward;
import model.Comment;
import model.CommentDao;
import model.LikeBook;
import model.LikeBookDao;
import model.Member;
import model.MemberDao;
import model.Plan;
import model.PlanDao;
import model.ReviewBoard;
import model.ReviewBoardDao;
import model.Trip;
import model.TripDao;

public class MemberAllAction {
	private MemberDao dao = new MemberDao();
	private TripDao tp = new TripDao();
	private PlanDao pn = new PlanDao();
	private LikeBookDao lb = new LikeBookDao();
	private ReviewBoardDao rv = new ReviewBoardDao();
	private CommentDao cm = new CommentDao();
	
	private boolean logincheck(HttpServletRequest request) {
		String login = (String)request.getSession().getAttribute("login");
		if(login==null) {
			request.setAttribute("msg","로그인하세요");
			request.setAttribute("url", "../member/loginForm.do");
			return false;
		}else {
			
		}
		return true;
	}
	
	public ActionForward picture(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String path = request.getServletContext().getRealPath("")+"/member/picture/";
		String fname = null;
			File f = new File(path);
			if(!f.exists()){
				f.mkdirs(); //폴더생성
			}
			MultipartRequest multi = new MultipartRequest(request,path,10*1024*1024,"euc-kr"); //upload완성
			//fname: upload된 이미지 파일 이름 
			fname=multi.getFilesystemName("picture");
			//new File(path+fname):현재 업로르된 원본파일
			//bi:메모리에 로드 정보
			BufferedImage bi = ImageIO.read(new File(path+fname));
			int width = bi.getWidth()/3;
			int height = bi.getHeight()/3;
			//thumb: 빈이미지. 그림이 없는 도화지
			BufferedImage thumb = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
			//g: 그리기 도구
			Graphics2D g = thumb.createGraphics();
			//그림 그리기
			//thumb: 이미지 그려짐
			g.drawImage(bi,0,0,20,30,null);
			f = new File(path+"sm_"+fname);
			//thumb 이미지 f 파일로 저장
			ImageIO.write(thumb,"jpg",f);
		request.setAttribute("fname",fname);
		return new ActionForward();
	}
	
	public ActionForward join(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		request.setCharacterEncoding("euc-kr");
		
		Member mem = new Member();

		mem.setId(request.getParameter("id"));
		mem.setPw(request.getParameter("pw"));
		mem.setNick(request.getParameter("nick"));
		mem.setProfile(request.getParameter("profile"));
		mem.setEmail(request.getParameter("email"));
		
		String msg = "회원가입 실패";
		String url = "join.do";
		
		int result = dao.insert(mem); //model.Member 이름의 클래스가 매개변수
		if(result>0){
			msg=mem.getNick()+"님 회원가입 완료";
			url="../main/main.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return new ActionForward(false,"../alert.jsp");
	}
	
	public ActionForward login(HttpServletRequest request, HttpServletResponse response) {
		
		String msg = "아이디를 또는 비밀번호를 확인하세요";
		String url = "loginForm.do";
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		Member mem = dao.selectOne(id);
		
		if(mem!=null) {
			if(pw.equals(mem.getPw())) {
				request.getSession().setAttribute("login", id);
				request.getSession().setAttribute("mem", mem);
				msg=mem.getNick()+"님 안녕하세요!";
				url="../main/main.do";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return new ActionForward(false,"../alert.jsp");
	}
	
	public ActionForward logout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate();
		return new ActionForward(true,"../main/main.do");
	}
	
	public ActionForward checkid(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		
		int cnt = dao.checkid(id);
		request.setAttribute("cnt", cnt);
		
		return new ActionForward();
	}
	public ActionForward checknick(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		
		String nick = request.getParameter("nick");
		int cnt = dao.checknick(nick);
		
		request.setAttribute("cnt", cnt);
		
		return new ActionForward();
	}
	public ActionForward checkemail(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		int cnt=dao.checkemail(email);
		
		request.setAttribute("cnt", cnt);
		return new ActionForward();
	}
	
	public ActionForward addTrip(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, ParseException {
		request.setCharacterEncoding("euc-kr");
		
		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");
		
		double cityLat = Double.parseDouble(lat);
		double cityLng = Double.parseDouble(lng);
				
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		Trip trip = new Trip();
		trip.setCity(request.getParameter("city"));
		trip.setId(request.getParameter("id"));
		trip.setTripTitle(request.getParameter("tripTitle"));
		trip.setStartDate(fm.parse(request.getParameter("startDate")));
		trip.setEndDate(fm.parse(request.getParameter("endDate")));
		trip.setCityLat(cityLat);
		trip.setCityLng(cityLng);
		trip.setCountryCode(request.getParameter("countryCode"));
		
		String msg = "여행등록 실패";
		String url = "planner.do";
		
		int result = tp.insert(trip); //model.Member 이름의 클래스가 매개변수
		
		if(result>0){
			msg="새로운 여행 등록 완료";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return new ActionForward(false,"../alert.jsp");
	}
	
	public ActionForward planner(HttpServletRequest request, HttpServletResponse response){
		if(logincheck(request)) {
			String id = (String)request.getSession().getAttribute("login");
			String userid = request.getParameter("id");
			if(!id.equals(userid)) {
				request.setAttribute("msg", "본인의 플래너만 접근 가능합니다.");
				request.setAttribute("url", "../main/main.do");
				return new ActionForward(false, "../alert.jsp");
			}else {
				int tripcnt = tp.tripcnt(id);
				
				List<Trip> list = tp.list(id);
				
				
				request.setAttribute("list", list);
				request.setAttribute("tripcnt", tripcnt);
				
				return new ActionForward();
			}
			
		}else {
			return new ActionForward(false, "../alert.jsp");
		}
	}
		
	public ActionForward schedule(HttpServletRequest request, HttpServletResponse response) throws ParseException {
		if(logincheck(request)) {
			int tripNo = Integer.parseInt(request.getParameter("tripNo"));
			Trip t = tp.select(tripNo);
			
			String login = (String)request.getSession().getAttribute("login");
			String userid = t.getId();
			
			if(!login.equals(userid)) {
				request.setAttribute("msg", "본인의 여행만 접근 가능합니다.");
				request.setAttribute("url", "planner.do?id="+login);
				return new ActionForward(false, "../alert.jsp");
			}else {
				List<Plan> list = pn.list(tripNo);
				
				Date str = t.getStartDate();
				Date end = t.getEndDate();
				
				long diff = end.getTime()-str.getTime();
				long diffday=diff/(24*60*60*1000)+1;
				
				Calendar cal = Calendar.getInstance();
				cal.setTime(str);
				
				List<String> date = new ArrayList<>();
				SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
				
				for(int i=0; i<diffday; i++) {
					String listdate = fmt.format(cal.getTime());
					date.add(listdate);
					cal.add(Calendar.DATE, 1);
				}
				
				
				request.setAttribute("t", t);
				request.setAttribute("date", date);
				request.setAttribute("list", list);
						
				return new ActionForward();
			}
			
		}else {
			return new ActionForward(false, "../alert.jsp");
		}
		
	}
	
	public ActionForward addplan(HttpServletRequest request, HttpServletResponse response) throws ParseException, UnsupportedEncodingException {
		
		request.setCharacterEncoding("euc-kr");
		
		int tripNo = Integer.parseInt(request.getParameter("tripNo"));
		
		double lat = Double.parseDouble(request.getParameter("lat"));
		double lng = Double.parseDouble(request.getParameter("lng"));
		
		int maxSeq = pn.maxSeq(tripNo);
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");

		Plan plan = new Plan();
		plan.setTripNo(tripNo);
		plan.setPlanSeq(maxSeq+1);
		plan.setId((String)request.getSession().getAttribute("login"));
		plan.setPlanDate(fm.parse(request.getParameter("planDate")));
		plan.setPlanTime(request.getParameter("planTime"));
		plan.setMemo(request.getParameter("memo"));
		plan.setPlace(request.getParameter("place"));
		plan.setLat(lat);
		plan.setLng(lng);
		System.out.println(plan);
		String msg = "일정등록 실패";
		String url = "schedule.do?tripNo="+tripNo;
		
		int result = pn.insert(plan); //model.Member 이름의 클래스가 매개변수
		
		if(result>0){
			msg="일정 등록 완료";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return new ActionForward(false,"../alert.jsp");
		
	}
		
	public ActionForward searchForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(request.getParameter("tripNo")!=null) {
			int tripNo = Integer.parseInt(request.getParameter("tripNo"));
			
			Trip location = tp.location(tripNo);
			
			double lat = location.getCityLat();
			double lng = location.getCityLng();
			String code = location.getCountryCode();
			
			request.setAttribute("lat", lat);
			request.setAttribute("lng", lng);
			request.setAttribute("code", code);
			
			return new ActionForward();
		}else {
			return new ActionForward();
		}

	}
	public ActionForward mapForm(HttpServletRequest request, HttpServletResponse response) throws ParseException {
		
		int tripNo = Integer.parseInt(request.getParameter("tripNo"));
		String date = request.getParameter("planDate");
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		Date planDate = fm.parse(date);
		
		List<Plan> location = pn.location(tripNo, planDate); 
		String places="[";
		for(int i=0; i<location.size(); i++) {
			Plan plan = location.get(i);
			places+="{lat:"+plan.getLat()+", lng:"+plan.getLng()+"},";
		}
		places+="]";
		request.setAttribute("places", places);
		
		return new ActionForward();
		
	}
	public ActionForward updateTripForm(HttpServletRequest request, HttpServletResponse response) {
		int tripNo = Integer.parseInt(request.getParameter("tripNo"));
		Trip t = tp.select(tripNo);
		request.setAttribute("t", t);
		
		return new ActionForward();
	}
	public ActionForward updateTrip(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, ParseException {
		request.setCharacterEncoding("euc-kr");
		int tripNo = Integer.parseInt(request.getParameter("tripNo"));				
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		Trip trip = new Trip();
		trip.setTripNo(tripNo);
		trip.setTripTitle(request.getParameter("tripTitle"));
		trip.setStartDate(fm.parse(request.getParameter("date1")));
		trip.setEndDate(fm.parse(request.getParameter("date2")));

		String msg = "업데이트 실패";
		String url = "schedule.do?tripNo="+tripNo;
		
		int result = tp.update(trip); //model.Member 이름의 클래스가 매개변수
		
		if(result>0){
			msg="업데이트 완료";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return new ActionForward(false,"../alert.jsp");
	}
	public ActionForward deleteTrip(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("login");
		int tripNo = Integer.parseInt(request.getParameter("tripNo"));
		
		int result = tp.delete(tripNo);
		
		String msg = "삭제 실패";
		String url = "planner.do?id="+id;
		
		if(result>0){
			msg="삭제 완료";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return new ActionForward(false,"../alert.jsp");
	}
	public ActionForward share(HttpServletRequest request, HttpServletResponse response) throws IOException {		
		request.setCharacterEncoding("euc-kr");
		
		String path = request.getServletContext().getRealPath("")+"/plan/picture/";
		String id = (String)request.getSession().getAttribute("login");
		
		File f = new File(path);
		if(!f.exists()){
			f.mkdirs(); //폴더생성
		}	
		MultipartRequest multi = new MultipartRequest(request,path,10*1024*1024,"euc-kr"); //upload완성
		int tripNo = Integer.parseInt(multi.getParameter("tripNo"));
		
		Trip trip = new Trip();
		trip.setRegdate(new Date());
		trip.setTripNo(tripNo);
		trip.setComment(multi.getParameter("comment"));
		trip.setPicture(multi.getFilesystemName("picture"));
		trip.setShare(1);
		
		String msg = "공유 실패";
		String url = "planner.do?id="+id;
		
		int result = tp.share(trip); //model.Member 이름의 클래스가 매개변수
		
		if(result>0){
			msg="공유 완료";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
			
		return new ActionForward(false,"../alert.jsp");
	}
	public ActionForward planboard(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		//request.setCharacterEncoding("euc-kr");
		String id = (String)request.getSession().getAttribute("login");
		int type=Integer.parseInt(request.getParameter("type"));
		String find = request.getParameter("find");
		int boardcnt = tp.boardcnt(find);
		if(find==null||find.equals("")) {
			find=null;
		}
		List<Trip> list = new ArrayList<Trip>();
		List<Member> member = new ArrayList<Member>(); 
		List<Integer> likecnt = new ArrayList<Integer>();
		List<Integer> likechk = new ArrayList<Integer>();
		
		if(type==1) {
			list = tp.planboard(find);
		}else if(type==2) {
			list = tp.planboard2(find);
		}
		
		
		for(int i=0; i<list.size(); i++) {
			Trip trip = list.get(i);
			System.out.println(trip.getId());
			member.add(dao.selectOne(trip.getId()));
			likecnt.add(lb.likecnt(trip.getTripNo()));
			Integer chk = lb.cnk(trip.getTripNo(),id, 1);
			if(chk==null) {
				likechk.add(0);
			}else {
				likechk.add(chk);
			}
		}
		
		request.setAttribute("likecnt", likecnt);
		request.setAttribute("likechk", likechk);
		request.setAttribute("member", member);
		request.setAttribute("list", list);
		request.setAttribute("boardcnt", boardcnt);
		
		return new ActionForward();
	}
//	public ActionForward likefunc(HttpServletRequest request, HttpServletResponse response) {
//		if(logincheck(request)) {
//			String id = (String)request.getSession().getAttribute("login");
//			int type=Integer.parseInt(request.getParameter("type"));
//			int likechk=Integer.parseInt(request.getParameter("likechk"));
//			int tripNo=Integer.parseInt(request.getParameter("tripNo"));
//			
//			String url="";
//			String msg="";
//			if(type==1) {
//				url="planboard.do?type=1";
//			}else {
//				url="planInfo.do?tripNo="+tripNo;
//			}
//			
//			int result;
//			if(likechk==0) {
//				result = lb.add(1,id,tripNo);
//				if(result>0) {
//					msg="좋아요!";
//				}
//			}else {
//				result = lb.delete(1,id,tripNo);
//				if(result>0) {
//					msg="좋아요 취소";
//				}
//			}
//			request.setAttribute("url", url);
//			request.setAttribute("msg", msg);
//			
//			return new ActionForward(false,"../alert.jsp");
//		}else {
//			return new ActionForward(false,"../alert.jsp");	
//		}
//	}
	public ActionForward likefunc(HttpServletRequest request, HttpServletResponse response) {
		if(logincheck(request)) {
			String id = (String)request.getSession().getAttribute("login");
			int type=Integer.parseInt(request.getParameter("type"));
			int likechk=Integer.parseInt(request.getParameter("likechk"));
			//int tripNo=Integer.parseInt(request.getParameter("tripNo"));
			//int reviewNo=Integer.parseInt(request.getParameter("reviewNo"));
			String trip = request.getParameter("tripNo");
			String review = request.getParameter("reviewNo");
			String url="";
			String msg="";
			if(review==null||review.equals("")) {
				review=null;
				int tripNo = Integer.parseInt(trip);
				if(type==1) {
					url="planboard.do?type=1";
				}else {
					url="planInfo.do?tripNo="+tripNo;
				}
				
				int result;
				if(likechk==0) {
					result = lb.add(1,id,tripNo);
					if(result>0) {
						msg="좋아요!";
					}
				}else {
					result = lb.delete(1,id,tripNo);
					if(result>0) {
						msg="좋아요 취소";
					}
				}
				
			}else if(trip==null||trip.equals("")) {
				trip=null;
				int reviewNo = Integer.parseInt(review);
				if(type==1) {
					url="review.do?type=1";
				}else {
					url="reviewInfo.do?reviewNo="+reviewNo;
				}
				
				int result;
				if(likechk==0) {
					result = lb.addrv(1,id,reviewNo);
					if(result>0) {
						msg="좋아요!";
					}
				}else {
					result = lb.deleterv(1,id,reviewNo);
					if(result>0) {
						msg="좋아요 취소";
					}
				}
			}
			
			request.setAttribute("url", url);
			request.setAttribute("msg", msg);
			
			return new ActionForward(false,"../alert.jsp");
			
		}else {
			return new ActionForward(false,"../alert.jsp");	
		}
	}
	

	public ActionForward bookfunc(HttpServletRequest request, HttpServletResponse response) {
		if(logincheck(request)) {
			String id = (String)request.getSession().getAttribute("login");
			
			int bookchk=Integer.parseInt(request.getParameter("bookchk"));
			int tripNo=Integer.parseInt(request.getParameter("tripNo"));
			
			String msg="북마크 추가 실패";
			String url="planInfo.do?&tripNo="+tripNo;
			int result;
			
			if(bookchk==0) {
				result = lb.add(2,id,tripNo);
				if(result>0) {
					msg="북마크 추가!";
				}
			}else {
				result = lb.delete(2,id,tripNo);
				if(result>0) {
					msg="북마크 취소";
				}
			}
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			
			return new ActionForward(false,"../alert.jsp");	
		}else {
			return new ActionForward(false,"../alert.jsp");	
		}
	}
	public ActionForward planInfo(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("login");
		int tripNo = Integer.parseInt(request.getParameter("tripNo"));
		
		Trip list = tp.select(tripNo);
		Member member = dao.selectOne(list.getId());
		List<Plan> plan = pn.list(tripNo);
		int likecnt = lb.likecnt(tripNo);
		int likechk = lb.cnk(tripNo, id, 1);
		int bookchk = lb.cnk(tripNo, id, 2);
		
		Date str = list.getStartDate();
		Date end = list.getEndDate();
		
		long diff = end.getTime()-str.getTime();
		long diffday = diff/(24*60*60*1000)+1;
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(str);
		
		List<String> date = new ArrayList<>();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		
		for(int i=0; i<diffday; i++) {
			String listdate = fmt.format(cal.getTime());
			date.add(listdate);
			cal.add(Calendar.DATE, 1);
		}
		
		request.setAttribute("date", date);
		request.setAttribute("diffday", diffday);
		request.setAttribute("plan", plan);
		request.setAttribute("bookchk", bookchk);
		request.setAttribute("likecnt", likecnt);
		request.setAttribute("likechk", likechk);
		request.setAttribute("member", member);
		request.setAttribute("list", list);
		
		return new ActionForward();
	}
	
	public ActionForward write(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
			request.setCharacterEncoding("euc-kr");
			
			String msg="게시물 등록 실패";
			String url="writeForm.do";
			String id = (String)request.getSession().getAttribute("login");
			String fileName = (String)request.getSession().getAttribute("fileName");
			String city = request.getParameter("city");
		
			ReviewBoard review = new ReviewBoard();
			review.setCategory(Integer.parseInt(request.getParameter("category")));
			review.setContent(request.getParameter("content"));
			review.setFile(fileName);
			review.setId(id);
			review.setPlace(request.getParameter("place"));
			review.setRegdate(new Date());
			review.setSubject(request.getParameter("subject"));
			review.setUrl(request.getParameter("url"));
			review.setAddress(city+","+request.getParameter("address"));
				
			int num = rv.maxnum();
			review.setReviewNo(++num);
				
			if(rv.insert(review)){
				msg="게시물 등록 성공";
				url="review.do?type=1";
				request.getSession().removeAttribute("fileName");
			}
				
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false,"../alert.jsp");
	}
	
	public ActionForward imgupload(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String path=request.getServletContext().getRealPath("/")+"board/imgfile/";
		System.out.println(path);
		File f = new File(path);
		if(!f.exists()) f.mkdirs();
		MultipartRequest multi = new MultipartRequest(request, path, 10*1024*1024,"euc-kr");
		String fileName = multi.getFilesystemName("upload");
		
		request.getSession().setAttribute("fileName", fileName);
		
		request.setAttribute("fileName", fileName);
		request.setAttribute("CKEditorFuncNum", request.getParameter("CKEditorFuncNum"));
		
		return new ActionForward(false,"ckeditor.jsp");
	}
	
	public ActionForward review(HttpServletRequest request, HttpServletResponse response)throws NumberFormatException {
		String id = (String)request.getSession().getAttribute("login");
		String find = request.getParameter("find");
		//Integer category = Integer.parseInt(request.getParameter("category"));
		String cat = request.getParameter("category");
		int category;
		if(find==null||find.equals("")) {
			find=null;
		}
		if(cat==null||cat.equals("")) {
			cat=null;
			category=0;
		}else {
			category=Integer.parseInt(cat);
		}
		
		int boardcnt = rv.boardcnt(category,find);
		int type=Integer.parseInt(request.getParameter("type"));
		
		List<ReviewBoard> list = new ArrayList<ReviewBoard>();
		List<Member> member = new ArrayList<Member>(); 
		List<Integer> likecnt = new ArrayList<Integer>();
		List<Integer> likechk = new ArrayList<Integer>();
		if(type==1) {
			list = rv.reviewboard(category,find);
		}else if(type==2) {
			list = rv.reviewboard2(category,find);
		}
		for(int i=0; i<list.size(); i++) {
			ReviewBoard review = list.get(i);
			member.add(dao.selectOne(review.getId()));
			likecnt.add(lb.likecntRv(review.getReviewNo()));
			likechk.add(lb.chkRv(review.getReviewNo(),id, 1));
		}
		request.setAttribute("likecnt", likecnt);
		request.setAttribute("likechk", likechk);
		request.setAttribute("member", member);
		request.setAttribute("list", list);
		request.setAttribute("boardcnt", boardcnt);
		
		return new ActionForward();
	}
	public ActionForward writeForm(HttpServletRequest request, HttpServletResponse response) {
		if(logincheck(request)) {
			return new ActionForward();
		}else {
			return new ActionForward(false, "../alert.jsp");
		}
	}
	public ActionForward reviewInfo(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("login");
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		
		ReviewBoard list = rv.select(reviewNo);
		Member member = dao.selectOne(list.getId());
		int likecnt = lb.likecntRv(reviewNo);
		int likechk = lb.chkRv(reviewNo, id, 1);
		
		request.setAttribute("likecnt", likecnt);
		request.setAttribute("likechk", likechk);
		request.setAttribute("member", member);
		request.setAttribute("list", list);
		
		return new ActionForward();
	}
	public ActionForward comment(HttpServletRequest request, HttpServletResponse response) throws ParseException {
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		List<Comment> list = cm.select(reviewNo);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat format2 = new SimpleDateFormat("HH:mm");
		List<String> regdate = new ArrayList<String>();
		List<Member> mem = new ArrayList<Member>();
		int commentCnt = cm.cnt(reviewNo);
		for(int i=0; i<list.size(); i++) {
			Comment comment = list.get(i);
			Member me = dao.selectOne(comment.getId());
			mem.add(me);
			Date reg = comment.getRegdate();
			Date date = new Date();
			
			String d1 = format.format(reg);
			String d2 = format.format(date);
			
			int result = format.parse(d1).compareTo(format.parse(d2));
			if(result==0) {
				regdate.add(format2.format(reg));
			}else {
				regdate.add(d1);
			}
		}
		request.setAttribute("mem", mem);
		request.setAttribute("regdate", regdate);
		request.setAttribute("list", list);
		request.setAttribute("cnt", commentCnt);
		return new ActionForward();
	}

	public ActionForward commentAdd(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
			request.setCharacterEncoding("UTF-8");
			int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
			String comment =request.getParameter("comment");
			String id = request.getParameter("id");

			int maxnum = cm.maxnum();
			
			Comment com = new Comment();
			com.setCommentNo(++maxnum);
			com.setComment(comment);
			com.setId(id);
			com.setRegdate(new Date());
			com.setReviewNo(reviewNo);
			
			int result = cm.insert(com);
			request.setAttribute("result", result);
			return new ActionForward();
	}
	public ActionForward commentUpdate(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		String comment = request.getParameter("comment");
		
		int result = cm.update(commentNo,comment);
		request.setAttribute("result", result);
		return new ActionForward();
	}
	public ActionForward commentDelete(HttpServletRequest request, HttpServletResponse response) {
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		int result = cm.delete(commentNo);
		request.setAttribute("result", result);
		return new ActionForward();
	}
	
	public ActionForward mypage(HttpServletRequest request, HttpServletResponse response) {
		if(logincheck(request)) {
			String id = request.getParameter("id");
			String login = (String)request.getSession().getAttribute("login");
			if(!id.equals(login)) {
				request.setAttribute("msg", "본인의 마이페이지만 접근 가능합니다.");
				request.setAttribute("url", "../main/main.do");
				return new ActionForward(false, "../alert.jsp");
			}
			
			int tripcnt = tp.tripcnt(id);
			int reviewcnt = rv.reviewcnt(id);
			int bookcnt = lb.bookcnt(id);
			Member mem = dao.selectOne(id);
			
			request.setAttribute("mem", mem);
			request.setAttribute("tripcnt", tripcnt);
			request.setAttribute("reviewcnt", reviewcnt);
			request.setAttribute("bookcnt", bookcnt);
			
			return new ActionForward();
		}else {
			return new ActionForward(false, "../alert.jsp");
		}

	}
	public ActionForward getTrip(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		
		List<Trip> list = tp.list(id);		
		request.setAttribute("list", list);
		
		return new ActionForward();
	}
	public ActionForward getReview(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		List<ReviewBoard> list = rv.list(id);
//		int reviewcnt = rv.reviewcnt(id);
		request.setAttribute("list", list);
//		request.setAttribute("reviewcnt", reviewcnt);
		return new ActionForward();
	}
	public ActionForward getBook(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		List<LikeBook> list = lb.list(id);
		List<Trip> trip = new ArrayList<Trip>();
		for(int i=0; i<list.size(); i++) {
			LikeBook li = list.get(i);
			Trip t  = tp.select(li.getTripNo());
			trip.add(t);
		}
		request.setAttribute("list", trip);
		return new ActionForward();
	}
	
	public ActionForward updateMemberForm(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		Member mem = dao.selectOne(id);
		request.setAttribute("mem", mem);
		return new ActionForward();
	}
	public ActionForward updateMember(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String nick = request.getParameter("nick");
		String profile = request.getParameter("profile");
		Member mem = new Member();
		mem.setId(id);
		mem.setNick(nick);
		mem.setProfile(profile);
		
		int result = dao.update(mem);
		
		String msg = "수정 실패";
		String url = "updateMemberForm.do?id="+id;
		
		if(result>0) {
			msg="수정 성공";
			url="mypage.do?id="+id;
			Member mem2 = dao.selectOne(id);
			request.getSession().removeAttribute("mem");
			request.getSession().setAttribute("mem", mem2);
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
	public ActionForward updatePw(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		
		Member mem = new Member();
		mem.setId(id);
		mem.setPw(request.getParameter("pw"));
		
		int result = dao.updatePw(mem);
		
		String msg = "수정 실패";
		String url = "updatePwForm.do?id="+id;
		
		if(result>0) {
			msg="수정 성공";
			url="mypage.do?id="+id;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
	public ActionForward sendMail(HttpServletRequest request, HttpServletResponse response) {
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		
		String host = "smtp.naver.com";
		String user = "ka7900x@naver.com";
		String password = "rhdiddlcna22*";
		
		Properties props = new Properties();
		props.put("mail.smtp.host",host);
		props.put("mail.smtp.port",587);
		props.put("mail.smtp.auth","true");
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user,password);
			}
		});
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			
			message.setSubject("MODU 비밀번호 찾기 결과");
			message.setText("회원님의 비밀번호는  "+pw+"  입니다.");
			Transport.send(message);
			System.out.println("메일발송성공");
		}catch(MessagingException e) {
			e.printStackTrace();
		}
		return new ActionForward(false,"findPwResult.do");
	}
	
	public ActionForward findId(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String id = dao.findid(email);
		String msg="";
		String url="";
		if(id==null) {
			msg="조회된 아이디가 없습니다. 다시 시도해주세요";
			url="findFormId.do";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}else {
			request.setAttribute("id", id);
			request.setAttribute("email", email);
			return new ActionForward();
		}
		
	}
	public ActionForward findPw(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		String pw = dao.findpw(email,id);
		if(pw==null) {
			String msg="조회된 비밀번호가 없습니다. 다시 시도해주세요";
			String url="findFormPw.do";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}else{
			//request.setAttribute("pw", pw);
			return new ActionForward(true,"sendMail.do?pw="+pw+"&email="+email);
		}
		
	}
	public ActionForward withdraw(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		int result = dao.delete(id);
		String msg="탈퇴 실패";
		String url="updateMemberForm.do?id="+id;
		if(result>0) {
			msg="탈퇴 성공";
			url="../main/main.do";
			request.getSession().invalidate();
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
	public ActionForward updateFormReview(HttpServletRequest request, HttpServletResponse response) {
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		ReviewBoard review = rv.select(reviewNo);
		String address = review.getAddress();
		String city = address.substring(0, address.indexOf(","));
		request.setAttribute("review", review);
		request.setAttribute("city", city);
		return new ActionForward();
	}
	public ActionForward updateReview(HttpServletRequest request, HttpServletResponse response) {
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		String city = request.getParameter("city");
		String fileName = (String)request.getSession().getAttribute("fileName");

		ReviewBoard review = new ReviewBoard();
		if(fileName==null) {
			review.setFile(request.getParameter("file"));
		}else {
			review.setFile(fileName);
		}
		review.setCategory(Integer.parseInt(request.getParameter("category")));
		review.setContent(request.getParameter("content"));
		review.setPlace(request.getParameter("place"));
		review.setRegdate(new Date());
		review.setSubject(request.getParameter("subject"));
		review.setUrl(request.getParameter("url"));
		review.setAddress(city+","+request.getParameter("address"));
		review.setReviewNo(reviewNo);
		
		String msg="수정 실패";
		String url="updateFormReview.do?reviewNo="+reviewNo;

		if(rv.update(review)){
			msg="수정 성공";
			url="review.do?type=1";
			request.getSession().removeAttribute("fileName");
		}
			
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
	public ActionForward deleteReview(HttpServletRequest request, HttpServletResponse response) {
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		int result = rv.delete(reviewNo); 
		String msg="삭제 실패";
		String url="reviewInfo.do?reviewNo="+reviewNo;
		if(result>0) {
			msg="삭제 성공";
			url="review.do?type=1";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
	
	public ActionForward updateplanForm(HttpServletRequest request, HttpServletResponse response) {
		int planSeq = Integer.parseInt(request.getParameter("planSeq"));
		Plan plan = pn.select(planSeq);
		request.setAttribute("plan", plan);
		return new ActionForward();
	}
	
	public ActionForward deleteplan(HttpServletRequest request, HttpServletResponse response) {
		int planSeq = Integer.parseInt(request.getParameter("planSeq"));
		int tripNo = Integer.parseInt(request.getParameter("tripNo"));
		int result = pn.delete(planSeq);
		String msg="삭제 실패";
		String url="updateplanForm.do?planSeq="+planSeq;
		if(result>0) {
			msg="삭제 성공";
			url="schedule.do?tripNo="+tripNo;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
	
	public ActionForward updateplan(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, ParseException {
		request.setCharacterEncoding("euc-kr");
		
		int planSeq = Integer.parseInt(request.getParameter("planSeq"));
		int tripNo = Integer.parseInt(request.getParameter("tripNo"));
	
		double lat = Double.parseDouble(request.getParameter("lat"));
		double lng = Double.parseDouble(request.getParameter("lng"));
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");

		Plan plan = new Plan();

		plan.setPlanSeq(planSeq);
		plan.setPlanDate(fm.parse(request.getParameter("planDate")));
		plan.setPlanTime(request.getParameter("planTime"));
		plan.setMemo(request.getParameter("memo"));
		plan.setPlace(request.getParameter("place"));
		plan.setLat(lat);
		plan.setLng(lng);
		System.out.println(plan);
		String msg = "일정 수정 실패";
		String url = "updateplanForm.do?planSeq="+planSeq;
		
		int result = pn.update(plan); //model.Member 이름의 클래스가 매개변수
		
		if(result>0){
			msg="일정 수정 완료";
			url="schedule.do?tripNo="+tripNo;
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return new ActionForward(false, "../alert.jsp");
	}
}
