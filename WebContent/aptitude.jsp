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
		<input type='button' name='button' id='button' value='����'>
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
	alert("�̻����");	
	$("#button").click(function() {
		var data
		alert("��ưŬ��");
		$.ajax({
			type:"GET",//��� get put delete����
			headers:{"Content-Type":"application/json"}, 
			url: "http://inspct.career.go.kr/openapi/test/questions?apikey=961f47ce54cb960e4f6929a39c6b83dc&q=21",//������ ����url
				     
			success : function(data){
				
				for(var i=0 ;i<data.RESULT.length ; i++){
					var qNo = data.RESULT[i].qitemNo;
					$("#ss").append(i+1);
					$("#ss").append("<strong>"+data.RESULT[i].question+"</strong>"+"<br>");
					$("#ss").append("<input type='radio' id='"+qNo+"' name='"+qNo+"' value = '1'>�ſ츸�� "+
								    "<input type='radio' id='"+qNo+"' name='"+qNo+"' value = '2'>����"+
								    "<input type='radio' id='"+qNo+"' name='"+qNo+"' value = '3'>����"+
								    "<input type='radio' id='"+qNo+"' name='"+qNo+"' value = '4'>�Ҹ��� "+
								    "<input type='radio' id='"+qNo+"' name='"+qNo+"' value = '5' checked >�ſ�Ҹ���"+"<br>");
				}
				

			},
			
			error : function(e){
				console.log(e);
			}
		
			});
			
		});
	
	
	$("#send").click(function() {
		alert("��ưŬ��");
		var a = sendAnswer();
		$.ajax({
			type:"POST",//��� get put delete����
			headers:{"Content-Type":"application/json"}, 
			url: "http://inspct.career.go.kr/openapi/test/report",//������ ����url
			
			data : JSON.stringify({ "apikey": "961f47ce54cb960e4f6929a39c6b83dc",//����Ű
				     "qestrnSeq": "21",//�˻��ȣ 4������̰˻�(k) 18������̰˻�(h), ���������˻� ����л� 21
				     "trgetSe": "100207",//�˽���Ÿ�� 100205 �ʵ�,110206 �ߵ�,110207 ���,100208 �н�
				     "name": "������",//�̸�
				     "gender": "100324",//����
				     "school": "��Ʈ����б�",//�б���
				     "grade": "1",//�г�
				     "email" : "tingtjddlf@naver.com",//�̸���
				     "startDtm": "1550466291034",//��¥(�������𸣰���)
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
			<input type="button" id="send"  value="������">
		</form>
		<form name="sss" id="sss" method='POST'></form>
</body>
</html>