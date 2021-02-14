<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
	img = opener.document.getElementById("Userprofile");
	img.src = "picture/${fname}"; 
	opener.document.f.profile.value="${fname}";
	self.close();
</script>