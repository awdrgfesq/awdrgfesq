<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type = "text/javascript"
			src= "http://
			code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
	<p></p>
		<input type='button' name='button' id='button' value='으앙'>
		<form id="ss">
			<script type="text/javascript">
	$(document).ready(function(){
	
		function oneCheckbox(a){

	        var obj = document.getElementsByName("anwser");

	        for(var i=0; i<obj.length; i++){

	            if(obj[i] != a){

	                obj[i].checked = false;
	            }
	        }
	    }
	alert("이상없음");	
	$("#button").click(function() {
		var data
		alert("버튼클릭");
		$.ajax({
			type:"GET",//방식 get put delete있음
			headers:{"Content-Type":"application/json"}, 
			url: "http://inspct.career.go.kr/openapi/test/questions?apikey=961f47ce54cb960e4f6929a39c6b83dc&q=21",//데이터 보낼url
				     
			success : function(data){
				
				for(var i=0 ;i<data.RESULT.length ; i++){
					var qNo = data.RESULT[i].qitemNo;
					$("#ss").append(i+1);
					$("#ss").append("<strong>"+data.RESULT[i].question+"</strong>"+"<br>");
					$("#ss").append("<input type='radio' id='"+qNo+"' name='"+qNo+"' value = '1'>매우만족 "+
								    "<input type='radio' id='"+qNo+"' name='"+qNo+"' value = '2'>만족"+
								    "<input type='radio' id='"+qNo+"' name='"+qNo+"' value = '3'>보통"+
								    "<input type='radio' id='"+qNo+"' name='"+qNo+"' value = '4'>불만족 "+
								    "<input type='radio' id='"+qNo+"' name='"+qNo+"' value = '5' checked >매우불만족"+"<br>");
				}
				

			},
			
			error : function(e){
				console.log(e);
			}
		
			});
			
		});
	
	
	$("#send").click(function() {
		alert("버튼클릭");
		var a = sendAnswer();
		$.ajax({
			type:"POST",//방식 get put delete있음
			headers:{"Content-Type":"application/json"}, 
			url: "http://inspct.career.go.kr/openapi/test/report",//데이터 보낼url
			
			data : JSON.stringify({ "apikey": "961f47ce54cb960e4f6929a39c6b83dc",//인증키
				     "qestrnSeq": "21",//검사번호 4직업흥미검사(k) 18직업흥미검사(h), 직업적성검사 고등학생 21
				     "trgetSe": "100207",//검시자타입 100205 초딩,110206 중딩,110207 고딩,100208 학식
				     "name": "정성일",//이름
				     "gender": "100324",//성별
				     "school": "비트고등학교",//학교명
				     "grade": "1",//학년
				     "email" : "tingtjddlf@naver.com",//이메일
				     "startDtm": "1550466291034",//날짜(기준을모르겠음)
				     "answers": a
				     }),
				     
			success : function(data){
				console.log(data);
				console.log(data.RESULT.url);
				//location.href=data.RESULT.url;
				
				window.open("","pop","width=1000,height=1000");
				$("#sss")
				.attr("action", data.RESULT.url)
				.attr("target","pop")
				.submit();
			},
			
			error : function(e){
				console.log(e);
			}
		
			})
			
		});
	
	});

	function sendAnswer(){
			console.log($('#8').attr('id'));
			console.log($('input[id="1"]:checked').val()); 
			$('input[id="1"]:checked').val();
			var answer = "";
			var id = "";
			var val = "";
			for(var i=1;i<=88;i++){
				id=$('#'+i).attr('id');
				val = $('input[id='+i+']:checked').val();
				str = id+"="+val+" ";
				answer += str;
			}
			console.log(answer);
		return answer;
	}
	
	
	
	
	</script>
			<input type="button" id="send"  value="보내기">
		</form>
		<form name="sss" id="sss" method='POST'></form>
</body>
</html>