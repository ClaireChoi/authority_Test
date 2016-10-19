<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 승인 처리 페이지</title>
<style>
	div#wrapper {
		width : 1000px;
		margin : 0 auto;
		text-align:center;
	}
 	table {
		width : 900px;
		margin:0 auto;
	} 
	table {
		border-top: 2px solid #00aefe;
		border-bottom: 2px solid #00aefe;
		border-collapse: collapse;
	}
	th, tr, td {
		border-top: 1px solid gray;
		border-bottom: 1px solid gray;
	}
	tr {
		text-align : center;
	}
	th, td {
		height : 30px;
	}
	th {
		background: #0091ef;
	}
	input[type="button"]  {
		text-decoration : none;
		color : white;
		font-weight:bolder;
		display : inline-block;
		width : 50%;
		height: 40px;
		background-color : #00aefe;
		font-size:1em;
		border-radius: 20px;
	}
	
</style>
<script src="script/jquery-3.1.1.min.js" type="text/javascript"></script>
<script>
//필요한 코드 작성할 것
	$(function(){
		$('#result').append(
				"<table>"+
					"<tr><th>아이디</th><th>이름</th><th>성별</th><th>이메일</th><th>생년월일</th><th>전화번호</th><th>승인여부</th></tr>"+
				"</table>"
		);//table setting
		
		$.ajax({
			url: 'start',
			method: 'post',
			dataType: 'json',
			success: function(resp){
				var data = resp.list_ses;
				$.each(data, function(index, val){
					if(data[index].authority==='0'){//미승인
						$('table').append(
							"<tr>"+
							"<td class='userId'>"+data[index].userId +"</td>"+
							"<td>"+data[index].userName +"</td>"+
							"<td>"+data[index].sex +"</td>"+
							"<td>"+data[index].email +"</td>"+
							"<td>"+data[index].birth +"</td>"+
							"<td>"+data[index].phone +"</td>"+
							"<td><img class='img' src='image/revoke.png'/></td>"+
							"</tr>"
							); //append
					}else{//승인
						$('table').append(
							"<tr>"+
							"<td class='userId'>"+data[index].userId +"</td>"+
							"<td>"+data[index].userName +"</td>"+
							"<td>"+data[index].sex +"</td>"+
							"<td>"+data[index].email +"</td>"+
							"<td>"+data[index].birth +"</td>"+
							"<td>"+data[index].phone +"</td>"+
							"<td><img class='img' src='image/grant.png'/></td>"+
							"</tr>"
						); //append
					}//else
				});//each
			}//success
		});//ajax
		
		$('table').on('click', '.img', function(){
			$(this).removeAttr('src');
			$(this).attr('src', 'image/grant.png');
			var id = $(this).parent().parent().children('.userId').text();
		 	var item = {"userId":id};
			$.ajax({
				url: 'grant',
				method: 'post',
				data: item,
				dataType: 'json'
			});//ajax 
		});//img clicked
		
		$('input[type="button"]').on('click', function(){
			location.href = 'backToIndex.action';
		});
		
	});//onload

</script>

</head>
<body>
<div id="wrapper">
	<h2>[ 회원 목록 ] </h2>
	<div id="result"></div>
	<p><input type="button" value="첫 화면으로" /></p>
</div>	
</body>
</html>