<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	table, tr, td {
		border: 1px solid black;
		border-collapse: collapse;
	}
	tr, td {
		padding: 5px;
	}
	*{
		text-align: center;
	}
	.valid, .invalid { 
	font-size: 11px;
	font-weight: bold; 
	}

	.valid { color: green; }
	
</style>
</head>
<body>
	
		<table>
			<tr>
				<th>ID</th>
				<td >
				<input type="text" id="id" maxlength="20">
				<div class='valid'>아이디를 입력하세요.</div>
				<input type="button" id="overlay"  value="아이디 중복체크" />
				</td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="text" id="password">
				<div class="valid">비밀번호를 입력하세요.</div>
				</td>
			</tr>
			<tr>
				<th>NAME</th>
				<td><input type="text" id="user_name">
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					남자:<input type="radio" name="gender" value="남자">&nbsp;&nbsp;&nbsp;
					여자:<input type="radio" name="gender" value="여자">
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="text" id="age">
				</td>
			</tr>
			<tr>
				<th>EMAIL</th>
				<td><input type="text" id="email">
				<div class="valid">이메일을 입력하세요.</div>
				</td>
			</tr>
			<tr>
				<th colspan="2"><input id="join" type="button" value="회원가입"></th>
			</tr>
		</table>
	
</body>
<script>
var overlayChk = false;

$('#join').click(function(){
	
	$id = $("#id");
	
	if (overlayChk) {
	$pw = $("#password");
	$name = $("#user_name");
	$age = $("#age");
	$gender = $("input[name='gender']:checked");
	$email = $("#email");
	
	if ($id.val()=='') {
		alert('아이디를 입력해 주세요');
		$id.focus();
	}else if ($pw.val()=='') {
		alert('패스워드를 입력해 주세요');
		$pw.focus();
	}else if($pw.val().length < 7 || $pw.val().length > 21){
		alert('비밀번호는 8~20자 사이여야 합니다')
		$pw.focus();
	}else if ($name.val()=='') {
		alert('이름을 입력해 주세요');
		$name.focus();
	}else if ($age.val()=='') {
		alert('나이를 입력해 주세요');
		$age.focus();
	}else if ($gender.val()==null) {
		alert('성별을 입력해 주세요');
		$gender.focus();
	}else if ($email.val()=='') {
		alert('이메일을 입력해 주세요');
		$email.focus();
	}else{
		console.log('서버로 전송');
		var param ={};
		param.id = $id.val();
		param.pw = $pw.val();
		param.name = $name.val();
		param.age = $age.val();
		param.gender = $gender.val();
		param.email = $email.val();
		console.log(param);
		
		$.ajax({
			type:'POST',
			url:'ajaxJoin',
			data:param,
			dataType:'JSON',
			success:function(data){
				console.log(data);
				if (data.success>0) {
					alert("회원가입에 성공 했습니다");
					location.href="./";
				}else{
					alert("회원 가입에 실패 했습니다");
				}
			},
			error:function(e){
				console.log(e);
			}
		});
		
	}
	
	
	}
	
	
	
});

$("#overlay").click(function(){
	var id = $("#id").val();
	console.log(id);
	$.ajax({
		type:'GET',
		url:'overlay',
		data:{'id':id},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			if (data.overlay) {
				alert('이미 사용중인 아이디 입니다')
				$('#id').val('');
			}else{
				overlayChk = true;
				alert('사용 가능한 아이디 입니다')
			}
		},
		error:function(e){
			console.log(e);
		}
	});
});


</script>
</html>