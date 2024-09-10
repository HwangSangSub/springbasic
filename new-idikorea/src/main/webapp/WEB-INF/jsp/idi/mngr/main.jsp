<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ReDoc</title>
<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,700|Roboto:300,400,700" rel="stylesheet">

</head>
<body>
mngrmain
${levelList }
<button type="button" id="search">
��ư
</button>

<button type="button" id="emoney">
�����ݹ�ư
</button>

<button type="button" id="orderSearch">
�ֹ��˻�
</button>
<div id = "1650379848105159">
	<button type="button" id="orderItemSearch">
	�ֹ���ǰ�˻�
	</button>
</div>
<div id = "40489">
	<button type="button" id="memberOrderListSearch">
	ȸ�����ֹ������˻�
	</button>
</div>

<form id="excelForm" name="excelForm">
	<input id="excelFile" name="excelFile" type="file">
	<input id="fileName" name="fileName" readonly="readonly">
</form>
 <a href="/api/v1/file/1" download="">�׽�Ʈ ���� �ٿ�ε�</a>
</body>
<!-- <script>
location.href="/cafe24/test";
//	fetch("/cafe24/test").then(x=>alert("??"));

</script> -->
<script type="text/javascript">

document.getElementById('search').addEventListener("click",x=>{
	let obj={
/* 		'searchValue': 'family',
		'pageNum' :	 1,
		'lastLogin' : ['2024-03-01 09:11:27' , '2024-03-29 09:11:27'] */
		'pageNum' :	 1,
	}
	
	fetch("/api/v1/mngr/member?"+new URLSearchParams(obj))
	.then(resp=>resp.json())
	.then(x=>{
		console.log(x)
	})
})

document.getElementById('emoney').addEventListener("click",x=>{
	let obj={
/* 		'searchValue': 'family',
		'pageNum' :	 1,
		'lastLogin' : ['2024-03-01 09:11:27' , '2024-03-29 09:11:27'] */
		'pageNum' :	 1,
	}
	
	fetch("/api/v1/mngr/member/1/emoney?"+new URLSearchParams(obj))
	.then(resp=>resp.json())
	.then(x=>{
		console.log(x)
	})
})

document.getElementById('orderSearch').addEventListener("click",x=>{
	let obj={
		'pageNum' :	 1,
		//'receiverName' : '�ѵ���'		
	}
	
	fetch("/api/v1/mngr/order?"+new URLSearchParams(obj))
	.then(resp=>resp.json())
	.then(x=>{
		console.log(x);
	})
})

document.getElementById('memberOrderListSearch').addEventListener("click",event=>{
	let obj={
		'pageNum' :	 1,
		'memberNo' : 	event.target.closest('div').id
	}
	
	fetch("/api/v1/mngr/order?"+new URLSearchParams(obj))
	.then(resp=>resp.json())
	.then(x=>{
		console.log(x);
	})
})

document.getElementById('orderItemSearch').addEventListener("click",event=>{
	console.log(event.target)
	console.log(event.target.closest('div').id);
 	fetch("/api/v1/mngr/order/"+event.target.closest('div').id+"/item")
	.then(resp=>resp.json())
	.then(x=>{
		console.log(x);
	}) 
})

 document.getElementById('excelFile').addEventListener("change",event=>{
	document.getElementById('fileName').value=event.target.files[0].name;
	
    let formData = new FormData(document.getElementById('excelForm'));
	 fetch('/api/v1/mngr/delivery/excel',{
		method:'POST',
		body : new FormData(document.getElementById('excelForm'))
	}).then(resp=>resp.json())
	.then(data=>{
		if(data.code==400)
			return alert(data.message);
	})
}) 

</script>
</html>