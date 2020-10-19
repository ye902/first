		window.onload=function () {
			// imgLocation("img_container","box");
			load();	
			 
		}

		function scroll(imgData){
		

		    // 加载图片
		    readImg(imgData);
		    imgLocation("img_container","box");
		    window.onscroll = function(){ 
			    if(checkFlag()){ // 判断是否到底部要加载新的数据
			       // 把所有图片数据重新定位一次
			       imgLocation("img_container", "box"); 
			      	 // initHeight();
			    } 
			}
		}
		function imgLocation(parent,content){
			// container
			var cparent = document.getElementById(parent);
			// box
			var ccontent = getChildElement(cparent,content);
			// 根据当前浏览器窗口的快读，确定每行图片数并固定，居中
			var imgWidth = ccontent[0].offsetWidth;
			// console.log(imgWidth);
			// offsetWidth = width+padding+border
			var num = Math.floor(document.documentElement.clientWidth/imgWidth);

			/*
			 * document.documentElement.clientWidth 获取浏览器窗口文档显示区域的宽度，不包括滚动条。
			 */
			cparent.style.cssText = "width:"+imgWidth*num+"px;margin:0px auto";
			// 设置一个数组来承载第一行图片信息
			var BoxHeightArr = [];

			for(var i=0;i<ccontent.length;i++){
				// console.log(ccontent[i].offsetHeight);
				if(i<num){
					// 第一行图片的高度记录
					BoxHeightArr[i] = ccontent[i].offsetHeight;
					// offsetHeight=height+padding+border
					ccontent[i].style.position="static";
				}else{

					// 获得一行图片中的最小高度
					var minHeight = Math.min.apply(null,BoxHeightArr);

					var minIndex = getminheightLocation(BoxHeightArr,minHeight);
					// console.log(minHeight,minIndex);
					// 把图放在第一行图索引值最小的下面
					ccontent[i].style.position="absolute";
					ccontent[i].style.top = minHeight+"px";
					ccontent[i].style.left= ccontent[minIndex].offsetLeft+"px";

					 // 图片放好位置后更新“第一行图片信息的最小高度”，
     			  // 然后利用for循环重复这个动作到结束
     			  BoxHeightArr[minIndex] = BoxHeightArr[minIndex] + ccontent[i].offsetHeight; 

     			}
     		}
     		var c_parent = document.getElementById('contain');
     		var c_h = document.getElementById('cos_title');
     		var c_sym = document.getElementById('cos_symbol');
     		var maxHeight;
     		for(var n =0;n<BoxHeightArr.length;n++){

     			maxHeight= Math.max.apply(null,BoxHeightArr);

     		}
     		c_parent.style.height = maxHeight+c_h.offsetHeight+c_sym.offsetHeight+"px";
     		// console.log(maxHeight);

     	}
		// 加载数据
		function readImg(imgData){
			var cparent = document.getElementById("img_container"); 
			       // 把ajax数据加载进页面
			       for(var i=0; i<imgData.data.length; i++){ 
			       	var ccontent = document.createElement("div"); 
			       	ccontent.className="box"; 
			       	cparent.appendChild(ccontent); 
			       	var boximg = document.createElement("div"); 
			       	boximg.className = "box_img"; 
			       	ccontent.appendChild(boximg);
			       	
			       
			       	var href="";
			       	var a =document.createElement('a');
			       	a.setAttribute('href',href);
			       	boximg.appendChild(a); 
			       	var img = document.createElement("img"); 
			       	img.src = "images/"+imgData.data[i].src; 
			       	a.appendChild(img); 
			       	
			       	var intro = document.createElement('div');
			       	intro.className='cos_intro';
			       	boximg.appendChild(intro);
			       	var intro_p = document.createElement('p');
			       	intro_p.className="intro_author";
			       	intro.appendChild(intro_p);
			       	intro_p.setAttribute('name',"author");
			       	intro_p.innerHTML="【作者】"+imgData.data[i].author;
			       	var intro_date = document.createElement('span');
			       	intro_date.className="intro_date";
			       	intro_date.setAttribute('name',"date");
			       	intro.appendChild(intro_date);
			       	intro_date.innerHTML=imgData.data[i].date;
			       	var intro_click = document.createElement('span');
			       	intro_click.className="intro_click";
			       	intro.appendChild(intro_click);
			       	intro_click.innerHTML="点击数："+imgData.data[i].num;
			       } 
			   }
			   function getChildElement(parent,content){
			   	contentArr = parent.getElementsByClassName(content);
			   	return contentArr;
			   }
			   function getminheightLocation(BoxHeightArr,minHeight){
			   	for(var i in BoxHeightArr){
			   		if(BoxHeightArr[i]==minHeight){
			   			return i;
			   		}
			   	}
			   }
			   function checkFlag(){ 
			   	var cparent = document.getElementById("img_container"); 
			   	var ccontent = getChildElement(cparent, "box"); 

	     	// 得到最后一张图距顶部的高度，滚动高度，窗口高度
	     	var lastContentHeight = ccontent[ccontent.length-1].offsetTop; 
	     	var scrollTop = document.documentElement.scrollTop || document.body.scrollTop; 
	     	var pageHeight = document.documentElement.clientHeight || document.body.clientHeight; 
	    	// console.log(lastContentHeight+":"+scrollTop+":"+pageHeight);


	        // console.log(pageHeight);
	        if(lastContentHeight < scrollTop + pageHeight){ 
	        	return true; 
	        } 

	    }
	    // 按点击数排序
	    function compare(property){
	    	return	function sortnum(arr,brr){
	    		var value1 = arr[property];
	    		var value2 = brr[property];
	    		return value2 - value1;

	    	}
	    }
	    // 按日期排序
	    function dateToTime (str){
			return (Date.parse(str.replace(/-/g,'/'))); // 用/替换日期中的-是为了解决Safari的兼容
		}
		function arrToTime(array){
			for(var i=0; i < array.data.length; i++){
				array.data[i].dateNew = dateToTime(array.data[i].date);
			}
			return array;
		}
	    
	    function compareDate(property){

	    	return	function sortDate(a, b) {
				return b.dateNew - a.publishTimeNew;
			};
	    }
	    
	    // 链接跳转
		function readText(){
			
			var contain =document.getElementById("contain");
			var links = contain.getElementsByTagName('a');
			var src = getSrc();
			// 截取html中的src值
			for(var i=0;i<src.length;i++){
				var index=src[i].lastIndexOf("i");
				src[i]=src[i].substring(index,src[i].length);
				
			}
			var author = getName();
			var date = getDate();
			for(var i=0;i<links.length;i++){
				
					
					links[i].href="comic_cos_child.jsp?"+"src="+encodeURI(src[i]+
							"&author="+encodeURI(author[i])+"&date="+encodeURI(date[i]));
				
			}
		}
		// 获取图片路径
		function getSrc(){
			var contain =document.getElementById("contain");
			var srcs = contain.getElementsByTagName('img');

			var srcArr=new Array();
			for(var i=0;i<srcs.length;i++){
				srcArr[i]=srcs[i].src;
			}
			return srcArr;
		}
		// 获取作者名
		function getName(){
			
			var name =document.getElementsByName("author");
			var authors=new Array();
			for(var i=0;i<name.length;i++){
				authors[i]=name[i].innerHTML;
				
			}
			return authors;
		}
		// 获取日期
		function getDate(){
			var date =document.getElementsByName("date");
			var dates=new Array();
			
			for(var i=0;i<date.length;i++){
				
					dates[i]=date[i].innerHTML;
				
				
			}
			return dates;
		}
		//将时间戳转换为yyyy-MM-dd格式
		function timestampToTime(timestamp) {
	        var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
	        var Y = date.getFullYear() + '-';
	        var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
	        var D = date.getDate() + ' ';
//	        var h = date.getHours() + ':';
//	        var m = date.getMinutes() + ':';
//	        var s = date.getSeconds();
	        return Y+M+D;
	    }
		// 加载
		function load(){
		var container = document.getElementById("img_container");
		var hottest =document.getElementById('hottest');
	    var rdata=[];
		var imgData = [];
		ajax({
			url:"showImages.do",
			method:'post',
			data:{},
			success:function(response){
				
				
				 var json = JSON.parse(response);
				 console.log( );
				 for(var i=0;i<json.length;i++){
				 	rdata.push({
						src: json[i].src,
						author : json[i].author,
						date : timestampToTime(new Date(json[i].date)),
						num : json[i].num
				 	});
				 	
				 }
				imgData.data=rdata;
				arrToTime(imgData);
				imgData.data.sort(compare("dateNew"));
				console.log(imgData);
				
				hottest.onclick=function(){
// container.innerHTML="真的刷新过了";
					recent.style.background="";
					recent.style.color="#669999";
					imgData.data.sort(compare("num"));
					container.innerHTML="";
					readImg(imgData);
					 imgLocation("img_container","box");
					container.innerHTML=container.innerHTML;
				   
					readText();
					console.log(imgData.data.sort(compare("num")));
					this.style.background="#669999";
					this.style.color="#f7f7f7";

					
				}	
				recent.onclick=function(){
// container.innerHTML="真的刷新过了";
					hottest.style.background="";
					hottest.style.color="#669999";
					imgData.data.sort(compare("dateNew"));
					container.innerHTML="";
					readImg(imgData);
					 imgLocation("img_container","box");
					container.innerHTML=container.innerHTML;
					readText();
					
					this.style.background="#669999";
					this.style.color="#f7f7f7";

					
				}	
				scroll(imgData);
				readText();
			}
		
		})
		}
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
