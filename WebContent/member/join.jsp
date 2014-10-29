<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
<script type="text/javascript">
function createXMLHttpRequest(){
	  // See http://en.wikipedia.org/wiki/XMLHttpRequest
	  // Provide the XMLHttpRequest class for IE 5.x-6.x:
	  if( typeof XMLHttpRequest == "undefined" ) XMLHttpRequest = function() {
	    try { return new ActiveXObject("Msxml2.XMLHTTP.6.0") } catch(e) {}
	    try { return new ActiveXObject("Msxml2.XMLHTTP.3.0") } catch(e) {}
	    try { return new ActiveXObject("Msxml2.XMLHTTP") } catch(e) {}
	    try { return new ActiveXObject("Microsoft.XMLHTTP") } catch(e) {}
	    throw new Error( "This browser does not support XMLHttpRequest." )
	  };
	  return new XMLHttpRequest();
}
//생성된 xml 개체를 AJAX라는 변수에 저장
var AJAX = createXMLHttpRequest();

function handler() {
	if(AJAX.readyState == 4 && AJAX.status == 200) {
	    // AJAX success시 결과값 result라는 변수에 저장
	    result = JSON.parse(AJAX.responseText);
	    $("#ajax_show").html(result);
	}else if (AJAX.readyState == 4 && AJAX.status != 200) {
		// AJAX status fail
	  	alert('Something went wrong...');
	}
}
//아이디 입력시 아이디 입력값을 인자값으로 받아 동작하는 show()함수
function ajax_show(){
	AJAX.onreadystatechange = handler;
	// 입력받은 아이디를 id 파라미터값으로 설정하여 checkId.jsp 호출
	AJAX.open("POST", "checkId.jsp?id="+id, "true");
	AJAX.send("");
}

function onlyNum(event, type) {
	if(type == "numbers") {
		if(event.keyCode < 47 || event.keyCode > 56) return false;
	}
}

function onlyNum_han(obj) {
	if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 38  || event.keyCode == 39 || event.keyCode == 40) return;
	obj.value = obj.value.replace(/[ㄱ-ㅎㅏ-ㅣ가-힣]/g,'');
}
</script>
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<%@ include file="../inc/top.jsp" %>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Join us</a></li>
<li><a href="#">Privacy policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>Join Us</h1>
<form action="joinPro.jsp" id="join" method="post">
<fieldset>
<legend>Basic Info</legend>
<label>User ID</label>
<input type="text" name="id" class="id" onkeyup="ajax_show()">
<!-- <input type="button" value="dup. check" class="dup"> -->
<span id="ajax_id"></span><br>
<label>Password</label>
<input type="password" name="passwd"><br>
<label>Retype Password</label>
<input type="password" name="passwd2"><br>
<label>Name</label>
<input type="text" name="name"><br>
<label>E-Mail</label>
<input type="email" name="email"><br>
<label>Retype E-Mail</label>
<input type="email" name="email2"><br>
<label>Gender</label>
<input type="radio" name="gender" id="txtGender" value="남">Male
<input type="radio" name="gender" id="txtGender" value="여">Female<br>
</fieldset>

<fieldset>
<legend>Optional</legend>
<label>Address</label>
<input type="text" name="address"><br>
<label>Phone Number</label>
<input type="text" name="tel"><br>
<label>Mobile Phone Number</label>
<input type="text" name="mtel"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="Submit" class="submit">
<input type="reset" value="Cancel" class="cancel">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<%@ include file="../inc/bottom.jsp" %>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>