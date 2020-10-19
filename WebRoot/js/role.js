		window.onload=function(){
			
//			var dIn = document.getElementById('in');
			var links=role_contain.getElementsByTagName('a');
			readText(links);
			tab('role','box_contain',"click");
			tab('organization','o_tab',"click");
			
		}
		//链接 跳转
		function readText(links){
			
			for(var i=0;i<links.length;i++){
				links[i].index=i;
				links[i].onclick=function(){
					this.target="_blank";
					this.href="role_child.jsp?"+"index="+encodeURI(this.index);
					console.log(this.index);
					console.log(links.length);
				}
				
			}
		}
		function tab(Lid,BClass,event){
			var oBox=document.getElementById(Lid);
			// li
			var oLis  = oBox.getElementsByTagName('li');
			// tab
			var oTab = document.getElementsByClassName(BClass);

			for(var i=0;i<oLis.length;i++){
                (function(index){

					oLis[index].addEventListener(event,function(){
			        	for(var j=0;j<oLis.length;j++){
							oLis[j].className="";
						}
						for(var i=0;i<oTab.length;i++){
							oLis[0].style.background="";
							oTab[i].style.display="none";
						}
						oLis[index].className="tabColor";
						
						oTab[index].style.display="block";    
					});
		      	})(i)
		    }
		}