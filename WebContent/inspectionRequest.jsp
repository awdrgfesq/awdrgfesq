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
	
	<script type="text/javascript">
	$(document).ready(function(){
	alert("�̻����");	
	$("#button").click(function() {
		alert("��ưŬ��");
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
				     "answers": "i=anser+i.val() 2=1 3=1 4=1 5=1 6=1 7=1 8=1 9=1 10=1 11=1 12=1 13=1 14=1 15=1 16=1 17=1 18=2 19=1 20=1 21=1 22=1 23=1 24=1 25=1 26=1 27=1 28=1 29=1 30=1 31=1 32=1 33=1 34=1 35=1 36=1 37=1 38=1 39=1 40=1 41=1 42=1 43=1 44=1 45=1 46=1 47=1 48=1 49=1 50=1 51=1 52=1 53=1 54=1 55=1 56=1 57=1 58=1 59=1 60=1 61=1 62=1 63=1 64=1 65=1 66=1 67=1 68=1 69=1 70=1 71=1 72=1 73=1 74=1 75=1 76=1 77=1 78=1 79=1 80=1 81=1 82=1 83=1 84=1 85=1 86=1 87=1 88=1"
				     }),
				     
			success : function(data){
				console.log(data);
			},
			
			error : function(e){
				console.log(e);
			}
		
			})
			
		});
	
	});
	
	
	</script>
		<input type='button' name='button' id='button' value='����'>
</body>
</html>