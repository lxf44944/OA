// JavaScript Document

function $(id){
	return document.getElementById(id);	
}

function checkALL(){
	var flag = true;
	var username = $("uname").value;
	var pwd = $("pwd").value;
	var code = $("code").value;
	var text = $("error");
	
	var reguname = /^[0-9a-zA-Z]{3,15}$/; 
	var rename = new RegExp(reguname); 
	
	var regupwd = /^[0-9a-zA-Z_]{3,15}$/; 
	var repwd = new RegExp(regupwd); 
	
	if(username=="" && pwd=="" && code==""){
		text.innerHTML="用户名、密码和验证码不能为空！";	
		return false;
	}else if(username=="" || pwd=="" || code==""){
		text.innerHTML="用户名、密码或验证码不能为空！";	
		return false;
	}else if(rename.test(username) && repwd.test(pwd)){	
		text.innerHTML="格式正确";	
		return flag;	
	}else if(!rename.test(username)){
		 text.innerHTML="用户名为3~15位的英文字母和数字任意组合";	
		 flag=false;
	}else if(!repwd.test(pwd)){
		text.innerHTML="密码为3~15位的英文字母、数字和下划线的任意组合";	
		 flag = false;
	}
	
	return flag;
}

function onlyNumber(e){
	var key=e.keyCode;	
	var key2=e.charCode;
    if(window.event){
		//IE
    	if(key!=13){
    		if(key<48||key>57){
    			e.returnValue=false;
    		}
    	}
	}else{
		//FF
		if(key!=13){
			if(key2<48||key2>57){
				e.preventDefault();
			}
		}
	}
}
