window.onload=function(){
	
	readComments(1);
	readVideo();
	var submit=document.getElementById('insertBtn');
	document.getElementById('insertmsg').innerHTML="";
	//发表言论
	submit.addEventListener("click", function(){
		var textComment = document.getElementById('textComments').value;
		if(textComment!=null||textComment!=""){
			insertComment(textComment);
		}else{
			document.getElementById('insertmsg').innerHTML="没有要发表的评论";
		}	
	}, false);
}
function readVideo(){
	ajax({
	    method: 'POST',
	    url: 'video.json',
	    data: null,
	    
	    success: function (response) {
	    	var resp = JSON.parse(response);
	    	var num = document.getElementById('listnum');
			var tab = document.getElementById('v_tab');
			var ul = tab.getElementsByTagName('ul');
		
			for(var i=0;i<resp.first.length;i++){
				var li = document.createElement("li");
				li.innerHTML="第"+(i+1)+"集";
				
				ul[0].appendChild(li);
			}
			var vedio = document.getElementById('player');

			
			var list = tab.getElementsByTagName("li");

			for(var i=0;i<list.length;i++){
				list[i].index = i;
				
				list[i].onclick=function(){
					for(var j=0;j<list.length;j++){
						list[j].innerHTML="第"+(j+1)+"集";
						list[j].className="";
						list[j].style.color="#669999";
					}
					num.innerHTML="秦时明月第"+(this.index+1)+"集"
					vedio.src="video/"+resp.first[0].src;
					list[this.index].className="playing";
					this.style.color="#f7f7f7";
					this.innerHTML="播放中";
					
					console.log(this.index);
					vedio.play();
					
				}
			}
	    }
	});

}

function readComments(pageIndex){
	
	ajax({
		
		url:'findByPage.do',
		data:{nowpage:pageIndex},
		method:'POST',
		success:function(response){
			document.getElementById('ov_ul').innerHTML="";
			var res = JSON.parse(response);
			console.log(res);
			if(res.list==null||res.list==""){
				document.getElementById('ov_ul').innerHTML="暂无数据";
			}
			show(res.list);
			if(res.pageCount>1){
				for(var n=1;n<=res.pageCount;n++){
					var ulbtn = document.getElementById("ulbtn");
					var  libtn = document.createElement('li');
					libtn.innerHTML = n;
					libtn.setAttribute("id","li_btn");
					ulbtn.appendChild(libtn);	
				}
				//翻页
				var insertBtn = document.getElementById("ulbtn");
				var pageBtn = insertBtn.getElementsByTagName('li');
//				console.log(pageBtn.length);
				
				pageBtn[0].style.background="#669999";
				pageBtn[0].style.color="#f7f7f7";
				for(var j=0;j<pageBtn.length;j++){
					pageBtn[j].index = j+1;
					pageBtn[j].addEventListener("click",function(){
						for(var i=0;i<pageBtn.length;i++){
							pageBtn[i].style.background="";
							pageBtn[i].style.color="#669999";
						}
						this.style.background="#669999";
						this.style.color="#f7f7f7";
						var ul = document.getElementById('ov_ul');
						ul.innerHTML="";
						var pageIndex = this.index;
//						console.log(pageIndex);
						ajax({
							
							url:'findByPage.do',
							data:{nowpage:pageIndex},
							method:'post',
							success:function(response){
								var resp = JSON.parse(response);
								
								show(resp.list);
								
							}
						})
						
					},false);
				}
			}
			//删除
			var del = document.getElementById("ov_ul").getElementsByTagName('button');
			var textId =document.getElementById("ov_ul").getElementsByTagName('span');
//			console.log(textId.length);
			for(var i=0;i<del.length;i++){
				del[i].index = i;
				del[i].addEventListener("click",function(){
					console.log(this);
					var cid=textId[this.index].innerHTML;
					var delNode = this.parentNode.parentNode;
					console.log(delNode);
					ajax({
						data:{cid:cid},
						method:'post',
						url:'deleteComment.do',
						success:function(response){
//							var res = JSON.parse(response);
							console.log(response);
							switch (response) {
							case "loginerror":break;
							case "error":document.getElementById('insertmsg').innerHTML="删除失败，这不是你的评论"; break;
							case "delsucc":{
								delNode.remove();
								document.getElementById('ov_ul').innerHTML="";
								document.getElementById('ulbtn').innerHTML="";	
									readComments(1);
							};
							break;
							default:
								break;
							}
						}
						
					})
				},false);
			}
			
		},
		error:function(response){
			document.getElementById('ov_ul').innerHTML="暂无数据";
		}
	})
}
//添加记录
function show(reslist){
	var ul = document.getElementById('ov_ul');
	for(var i=0;i<reslist.length;i++){
		var ovLi =document.createElement('li');
		ul.appendChild(ovLi);
		var ov_left = document.createElement('div');
		ov_left.setAttribute("class","ov_left");
		ovLi.appendChild(ov_left);
		var ovleft_a = document.createElement("a");
		ov_left.appendChild(ovleft_a);
		var ovleft_img =document.createElement('img');
		ovleft_a.appendChild(ovleft_img);
		var ov_right = document.createElement('div');
		ov_right.setAttribute("class","ov_right");
		 ovLi.appendChild(ov_right);
		 var h_name = document.createElement('h4');
		 h_name.setAttribute("id","uid");
		 h_name.innerHTML = reslist[i].user.username;
		 ov_right.appendChild(h_name);
		 var ov_text = document.createElement('p');
		 ov_text.style.fontSize="12px";
		 ov_text.innerHTML = reslist[i].c_text;
		 ov_text.setAttribute("id", "text");
		 //记录C_id的p标签内
		 var textId = document.createElement("span");
		 textId.innerHTML = reslist[i].c_id;
		 textId.setAttribute("id","textId");
		 textId.style.display="none";
		 //添加记录文本
		 ov_right.appendChild(textId);
		 ov_right.appendChild(ov_text);
		//删除按钮
		 var delbtn = document.createElement("button");
		 delbtn.type="button";
		 delbtn.setAttribute("id", "delbtn");
		 delbtn.innerHTML="删除";
		 
		 ov_right.appendChild(delbtn);
	}
}
//发表评论
function insertComment(textComment){
	
	ajax({
		url:'insertConmment.do',
		method:'POST',
		data:{"textComment":textComment},
		success:function(res){
			if(res==""||res==null){
				document.getElementById('insertmsg').innerHTML="请先登录或评论";
			}else{
				document.getElementById('insertmsg').innerHTML="评论成功";
				document.getElementById('ov_ul').innerHTML="";
				document.getElementById('ulbtn').innerHTML="";	
					readComments(1);
					
			}
			
			
		},
		error:function(response){
			document.getElementById('insertmsg').innerHTML="评论失败";
		}
		
	});

}
/* 封装ajax函数
 * @param {string}opt.type http连接的方式，包括POST和GET两种方式
 * @param {string}opt.url 发送请求的url
 * @param {boolean}opt.async 是否为异步请求，true为异步的，false为同步的
 * @param {object}opt.data 发送的参数，格式为对象类型
 * @param {function}opt.success ajax发送并接收成功调用的回调函数
 */
    function ajax(opt) {
        opt = opt || {};
        opt.method = opt.method.toUpperCase() || 'POST';
        opt.url = opt.url || '';
        opt.async = opt.async || true;
        opt.data = opt.data || null;
       
        opt.success = opt.success || function () {};
        opt.error = opt.error||function () {};
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
            }else{
            	opt.error(xmlHttp.status);
            }
        };
    }