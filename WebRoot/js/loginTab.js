window.onload=function(){

			tab();
			showSentence();
			
			
			loginAndRegiste('login',"login_box");
//			console.log(document.getElementById('namemsg'));
			
}
function loginAndRegiste(btnId,parentId){
	var box = document.getElementById(parentId);
	
	var btn = document.getElementById(btnId);
	var usermsg = box.getElementsByTagName('p')[0];
	var pwdmsg = box.getElementsByTagName('p')[1];
	
	var username =box.getElementsByTagName('input')[0];
	var password = box.getElementsByTagName('input')[1];
	console.log(password);
	btn.addEventListener("click",function(){
		if(username==""||username==null||username.value.length!=9){
			
			usermsg.style.color="red";
			usermsg.innerHTML="用户名不能为空,账号长度必须为9";
			
			return false;
		}else if(password==""||password==null||password.value.length!=7){
			
			pwdmsg.style.color="red";
			pwdmsg.innerHTML="密码不能为空，账号长度必须为7";
			return false;
		}else{
			usermsg.innerHTML="";
			pwdmsg.innerHTML="";
			if(btnId=='login'){
				login(username,password);
			}else{
				registe(username,password);
			}
		}
	},false)
}
function registe(regname,regpwd){
	var useridS = regname.value;
	var passwordS = regpwd.value;
	var usernameS = document.getElementById("rusername").value;
	ajax({
		url:'registe.do',
		method:'POST',
		data:{registeid:useridS,registepwd:passwordS,registename:usernameS},
		success:function(response){
			switch (response) {
			case "regsucc":
				window.location.href = '/graduate/index.jsp';
				break;
			case "iderror":
				document.getElementById('regidmsg').innerHTML = "账号不能为空,账号长度必须为9";
				break;
			case "pwderror":
				document.getElementById('regpwdmsg').innerHTML = "密码不能为空，账号长度必须为7";
				break;
			case "regerror":
				document.getElementById('regmsg').innerHTML = "注册失败";
				break;
			case "nameerror":
				document.getElementById('regnamemsg').innerHTML = "用户名不能为空";
				break;
			default:
				break;
			}
		}
	})
}
function login(uname,pwd){
	var usernameS = uname.value;
	var passwordS = pwd.value;
	
	ajax({
		url:'login.do',
		method:'POST',
		data:{'userid':usernameS,'userpwd':passwordS},
		success:function(response){
			switch (response) {
			case "succ":
				window.location.href = '/graduate/index.jsp';
				break;
			case "用户名不能为空,账号长度必须为9":
				document.getElementById('namemsg').innerHTML = response;
				break;
			case "密码不能为空，账号长度必须为7":
				document.getElementById('pwdmsg').innerHTML = response;
				break;
			case "error":
				document.getElementById('loginmsg').innerHTML = "该用户尚未注册或密码账号错误";
				break;
			default:
				break;
			}
		}
	})
}
function tab(){
	var loginTab = document.getElementById('login_tab');
	var registeTab = document.getElementById('registe_tab');
	var ILoginBox = document.getElementById('login_box');
	var IRegisteBox = document.getElementById('registe_box');

	
	loginTab.classList.add("tabColor");

	registeTab.addEventListener("click",function(){
		ILoginBox.style.display="none";
		loginTab.classList.remove("tabColor");
		
		this.classList.add("tabColor");
		IRegisteBox.style.display="block";
		loginAndRegiste('registe',"registe_box");
	})

	loginTab.addEventListener("click",function(){
		IRegisteBox.style.display="none";
		registeTab.classList.remove("tabColor");
		
		this.classList.add("tabColor");
		ILoginBox.style.display="block";
		loginAndRegiste('login',"login_box");
		
	})

}
function showSentence(){
	// 文字切换效果
	var sentence = ['横剑攻于计，以求其利，是为捭；纵剑攻于势，以求其实，是为阖。捭阖者，天地之道。',
	'解决问题的最好办法就是找到问题的源头',
	'当一个人的心中有着更高的山峰想去攀登时，他就不会在意脚下的泥沼！他才可能用最平静的方式，去面对一般人难以承受的痛苦！',
	'有些梦想虽然遥不可及，但不是不可能实现。只要我足够的强。'];
	var person=['鬼谷子','卫庄','张良','少年盖聂'];
	var s_content=document.getElementById('s_content');
	var s_speaker=document.getElementById('s_speaker');

	play(s_content,s_speaker,person,sentence);
}
// 文字切换
function play(content,speaker,per,sen){
	var index=0;
	setInterval(function(){
			content.innerHTML=sen[index];
			speaker.innerHTML="———"+per[index];
			index++;
			if(index==per.length){
				index=0;
			}
	},6000)

}

function ajax(opt) {
    opt = opt || {};
    opt.method = opt.method.toUpperCase() || 'POST';
    opt.url = opt.url || '';
    opt.async = opt.async || true;
    opt.data = opt.data || null;
    opt.success = opt.success || function () {};
    var xmlHttp = null;
    if (XMLHttpRequest) {
        xmlHttp = new XMLHttpRequest();
    }
    else {
        xmlHttp = new ActiveXObject('Microsoft.XMLHTTP');
    }var params = [];
    for (var key in opt.data){
        params.push(key + '=' + opt.data[key]);
    }
    var postData = params.join('&');
    if (opt.method.toUpperCase() === 'POST') {
        xmlHttp.open(opt.method, opt.url, opt.async);
        xmlHttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=utf-8');
        xmlHttp.send(postData);
    }
    else if (opt.method.toUpperCase() === 'GET') {
        xmlHttp.open(opt.method, opt.url + '?' + postData, opt.async);
        xmlHttp.send(null);
    } 
    xmlHttp.onreadystatechange = function () {
        if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
            opt.success(xmlHttp.responseText);
        }
    };
}