window.onload = function() {
	var loc = location.href;
	console.log(loc);
	var n1 = loc.length;
	var n2 = loc.indexOf("=");
	var index = decodeURI(loc.substr(n2 + 1, n1 - n2));// 等号后面的字符串，即参数列

	console.log(index);
	// console.log(n2);

	// jsons文件读取
	var jsonData = [];
	var url = "roleChild.json";/* json文件url，本地的就写本地的位置，如果是服务器的就写服务器的路径 */
	var request = new XMLHttpRequest();
	request.open("get", url);/* 设置请求方法与路径 */
	request.send(null);/* 不发送数据到服务器 */
	request.onload = function() {/* XHR对象获取到返回信息后执行 */
		if (request.status == 200) {/* 返回状态为200，即为数据获取成功 */
			var json = JSON.parse(request.responseText);
			for ( var i = 0; i < json.length; i++) {
				jsonData.push({
					name : json[i].name,
					age : json[i].age,
					personal : json[i].personal,
					arms : json[i].arms,
					experience : json[i].experience,
					url : json[i].url,
					urlb : json[i].urlb
				});

			}

			var title = document.getElementById('tlt');
			var age = document.getElementById('age');
			var personal = document.getElementById('personal');
			var experience = document.getElementById('experience');
			var arms = document.getElementById('arms');
			var pho = document.getElementById('photo');
			var pho2 = document.getElementById('photob');
			//console.log(photo);

			// 往页面中添加内容
			tlt.innerHTML = jsonData[index].name;
			age.innerHTML = jsonData[index].age;
			personal.innerHTML = jsonData[index].personal;
			experience.innerHTML = jsonData[index].experience;
			arms.innerHTML = jsonData[index].arms;
			pho.src = jsonData[index].url;
			pho2.src = jsonData[index].urlb;

		}
	}

}