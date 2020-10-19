window.onload = function() {

	var date =decodeURI(getUrlParam('date'));
	var src=decodeURI(getUrlParam('src'));
	var str = decodeURI(getUrlParam('author'));
	
	var dateH =document.getElementById('date');
	var authorH =document.getElementById('authorH');
	var authorS =document.getElementById('authorS');
	var  img= document.getElementById('detail_img');
	
	dateH.innerHTML=date;
	authorH.innerHTML=str;
	authorS.innerHTML=str;
	img.src=src;
	


}
function getUrlParam(name) {
    //构造一个含有目标参数的正则表达式对象
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
    var r = window.location.search.substr(1).match(reg); //匹配目标参数
    if (r != null) {
    	console.log(unescape(r[2]));
        return unescape(r[2]);
    } else {
        return null; //返回参数值
    }

}