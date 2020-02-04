<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
 
 		
</head>
<body>
	<script type="text/javascript">
		var request = new XMLHttpRequest();
		request.onreadystatechange=function(event){
			if(request.readyState==4){
				if(request.status==200){
					//데이터가공
					alert(request.responseXML);
					console.log(request.responseXML);
					var xml = request.responseXML;
					var name1 = xml.getElementsByTagName('lClass');
					var name2 = xml.getElementsByTagName('facilName');
					var name3 = xml.getElementsByTagName('majorSeq');
					var name4 = xml.getElementsByTagName('mClass');
					var name5 = xml.getElementsByTagName('totalCount');

					
					for (var i =0;i<name1.length;i++){//name1의 배열길이만큼반복한다
						var name11 = name1[i].childNodes[0].nodeValue;//name11에 name1의i번째벨류를 반환해준다 
						var name22 = name2[i].childNodes[0].nodeValue;
						var name33 = name3[i].childNodes[0].nodeValue;
						var name44 = name4[i].childNodes[0].nodeValue;
						var name55 = name5[i].childNodes[0].nodeValue;

						document.body.innerHTML += name11+'<br>';
						document.body.innerHTML += name22+'<br>';
						document.body.innerHTML += name33+'<br>';
						document.body.innerHTML += name44+'<br>';
						document.body.innerHTML += name55+'<br><br>';

	
						
						
						};
					};
				};
			};
			request.open('get','./school.xml',true);
		request.send();
			 

	</script>
</body>
</html>