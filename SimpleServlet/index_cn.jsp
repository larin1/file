<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Sugar Factory</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/simple.css">
	<script type="text/javascript" src="moban/js/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="js/leaderlist.js"></script>
	<link href="css/simple2.css" rel="stylesheet" type="text/css" />
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
	
	<link rel="stylesheet" href="css/introjs.css"/>
    <script type="text/javascript" src="js/intro.js"></script>

  </head>
  
  
<body onkeydown="keyLogin();"> 
	
	<div class="home-container" style="text-align:center;">
		
		<div class="User_score" style="text-align:center;font-weight:bold">
			<div data-step="4" data-intro="这里展示目前的总分。" style="margin:auto;width:100px;height:35px;">			
			<div style="float:left">分数:</div>			
			<div id="div_score" style="float:left">0</div>
		   	</div>
		</div>
		<div class="User_grade_container">		
			<div class="User_ratings User_grade" id="div_fraction0">
			   	<div data-step="1" data-intro="通过滑动条设置当月工人数量。" class="ratings_bars">
					
					<span class="bars_10">1</span>
					<div class="scale" id="bar0">
						<div></div>
						<span id="btn0"></span>
					</div>
					<span class="bars_10">12</span>
					<div  class="notestyle" >工人数量 <span id="title0">1</span></div>
				</div>
				<button  data-step="2" data-intro="点击按钮确认工人数量。" onclick="nextstep()" class="next-btn" id="btn_next" disabled="disabled">下一步</button>
				<a data-step="5" data-intro="可以随时查看游戏排行榜。" href="#" onclick="checklb();return false" class="checklb-btn" id="btn_checklb" >排行榜</a>
				
			</div>
		</div>
		
		<div data-step="3" data-intro="每一步的结果在这里展示。" class="echart-container" id="echartcontainer" style="text-algin:left;">
		</div>
		
		<!-- -----------result view------------ -->
		<div id="tryagain-out" class="tryagain-background" style="display:none;text-align:center">
			
		    <div id="tryagain-in" class="tryagain" style="display:block;margin-top: 25%">
		    	<p class="fontstyle" style="font-size:40" id="p_score">您的得分是 </p>
		    	<br>
				<p class="fontstyle">再来一次？</p>
				<button onclick="tryagain()" class="try-btn" id="btn_confirm">确定</button>
				<button onclick="nottryagain()" class="try-btn" id="btn_cansel">取消</button>		 
			</div>
			<div id="getreward-in" class="tryagain" style="display:none">
				<p class="fontstyle">得分超过阈值. 可以向管理员获取奖励.</p>
				<!--<button onclick="getReward()" class="try-btn" id="btn_confirm">Confirm</button>
				<button onclick="nottryagain()" class="try-btn" id="btn_cansel">Cancel</button>	-->	 
			</div>
		</div>
		<!-- index result view -->		
		<div id="leaderboardbg" class="tryagain-background" style="display:none;text-align:center">
			<!-- daily Leader Board -->
			<div class="leaderlist" style="margin-top:100px;">
    
		    <div class="header">
		        <div class="switch" id="switch"><a class="switch_btn_focus" id="switch_qleaderlist" href="javascript:void(0);" tabindex="7">日榜</a>
					<a class="switch_btn" id="switch_leaderlist" href="javascript:void(0);" tabindex="8">月榜</a><div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>
		        </div>
		    </div>    
		  
		    
		    <div class="web_qr_leaderlist" id="web_qr_leaderlist" style="display: block; height: 255px;">    
		
		            <!--daliy-->
		            <div class="web_leaderlist" id="web_leaderlist">
		               
		               
		               <div class="leaderlist-box">
		    
		            
						<table class="table table-striped" style="text-align:center">
						   <caption> </caption>
						   <thead>
						      <tr>
						         <th>昵称</th>
						         <th>得分</th>
						         
						         
						      </tr>
						   </thead>
						   <tbody id="index-tbody-leader">
						      
						     
						      
						   </tbody>
						</table>

			           
			          </div>
			               
			         </div>
			         <!--daliy end-->
			  </div>
			
			 
			    <div class="qleaderlist" id="qleaderlist" style="display: none; height: 255px;">
			   
			    <div class="web_leaderlist">
			           <table class="table table-striped" style="text-align:center">
						   <caption> </caption>
						   <thead>
						      <tr>
						         <th>昵称</th>
						         <th>得分</th>
						         
						         
						      </tr>
						   </thead>
						   <tbody id="index-tbody-leader-monthly">
						      
						   </tbody>
						</table>
			    
			    </div>
			   
			    
			    </div>
			   
			</div>
		    <div id="confirmboard-in" class="tryagain" style="display:block">				
				<button onclick="confirmboard()" class="try-btn" id="btn_confirm">Confirm</button>					 
			</div>
			
		</div>
		
		<!-- end index result view -->
		
		
	</div>
	<div id="instructions-out" class="tryagain-background" style="display:block" >
			<div id="instructions-in" class="instructions-in" style="display:block">
				<p class="fontstyle-2" id="inst_1">				</p>
				<div style="margin-left:40%;float:left;display:none" id="instruction-step1-display">
				<button onclick="instruction_step1()" class="instruction-btn" id="btn_confirm">继续</button>	
				<button onclick="instruction_skip()" class="instruction-btn" id="btn_confirm">跳过</button>	
				</div>		 
			</div>
			
		</div>	
		
		<div id="instructions-out-2" class="tryagain-background" style="display:none">
			<div id="instructions-in-2" class="instructions-in" style="display:block">
				<p class="fontstyle-2" id="inst_2">				</p>
				<div style="margin-left:40%;float:left">
				<button onclick="instruction_step2()" class="instruction-btn" id="btn_confirm">继续</button>	
				</div>		 
			</div>
			
		</div>	
		
		<div id="instructions-out-3" class="tryagain-background" style="display:none">
			<div id="instructions-in-3" class="instructions-in" style="display:block">
				<p class="fontstyle-2" id="inst_3">				</p>
				<div style="margin-left:40%;float:left">
				<button onclick="instruction_step3()" class="instruction-btn" id="btn_confirm">继续</button>
				</div>
			</div>
			
		</div>
		
		<div id="instructions-out-4" class="tryagain-background" style="display:none">
			<div id="instructions-in-4" class="instructions-in" style="display:block">
				<p class="fontstyle-2" id="inst_4">				</p>
				<div style="margin-left:40%;float:left">
				<button onclick="instruction_step4()" class="instruction-btn" id="btn_confirm">继续</button>
				</div>
			</div>
			
		</div>
	
	<!-- <form name="form2" id="regUser" accept-charset="utf-8"  action="instruction" method="post">
		<input type="submit" id="reg_inst"  style="margin-top:10px;margin-left:65px;"  value="Submit now"/>
	</form>	 -->
	
	
</body> 

<script src="http://echarts.baidu.com/build/dist/echarts.js"  charset="utf-8"></script>
<script type = "text/javascript">
	var work_n = 1;
	var proc_c = 6000;
	var data = new Array();
	var stepnum = 0;
	var steptotal = 20;
	var para = new Array();
	var minOut = 1000;
	var maxOut = 12000;
	var target = 9000;
	var score = 0;
	var flag = 0;
	var threshold = 50000;
	
	
	/*
	 * 从url中获取参数
	 */
	window.onload = function(){
		//document.write(document.referrer); http://localhost:8080/SimpleServlet/index_1
		if(!document.referrer){
		    location.href = "Login_cn.jsp";
		}
		
		echart(1);
		var url = location.search;
	
		if(url.indexOf("?")!=-1)
		{
			var str = url.substr(1);
			var strs= str.split("&");
					
			for(var i=0;i<strs.length;i++)
			{
					
			//Request[strs[i].split("=")[0]]=unescape(strs[ i].split("=")[1]);
				para.push(strs[i].split("=")[1]);	//解析url获取用户参数
				//alert(v[i]);
			}
			
			steptotal = parseInt(para[1]);
			minOut = parseInt(para[2]);
			maxOut = parseInt(para[3]);
			target = parseInt(para[4]);
			threshold = parseInt(para[5]);
			
		}
		var ins_1 = "你在发展中国家管理运营一家糖果工厂。 你通过调整工人的数量来影响工厂的产量, 忽略其他可能影响产量的因素。初始设定是上个月你有600名工人，产量是6000吨。";
	    var ins_2 = "你的任务是达到并维持稳定的目标产量"+target+"吨.为了帮助你完成任务，产量的最大值不会超过"+maxOut+"吨。最小不会低于"+minOut+"吨。";
	    var ins_3 = "你将经营工厂 "+steptotal+"个月。 每月你需要设定一个1到12的数字用来确定当月的工人数量。计算机会将这个数字扩大100倍作为真实的工人数量。例如:6 代表 600 个工人.";
		var ins_4 = "你将从图上看到你之前的表现，同时也会显示你的得分, 得分的多少取决于你距离目标值的远近。得分将会显示在屏幕上方。 越靠近目标值你的单次得分会越高, 如果连续命中目标值，你将会获得额外的加分，连续命中越多得分越高。\n"
					+"如果你的得分超过 "+threshold+"，你将有可能获得一份奖励.";
		var obj_p_1 = document.getElementById("inst_1");
		var obj_p_2 = document.getElementById("inst_2");
		var obj_p_3 = document.getElementById("inst_3");
		var obj_p_4 = document.getElementById("inst_4");
		
		obj_p_1.innerText = ins_1;
		obj_p_2.innerText = ins_2;
		obj_p_3.innerText = ins_3;
		obj_p_4.innerText = ins_4;
		var obj_step1button_display = document.getElementById("instruction-step1-display");
		obj_step1button_display.style.display = "block";
		
	};
	
	
	/*
	 * 实现滑动条获取分数
	 */
	scale = function (btn, bar, title) {
		this.btn = document.getElementById(btn);
		this.bar = document.getElementById(bar);
		this.title = document.getElementById(title);
		this.step = this.bar.getElementsByTagName("DIV")[0];
		this.init();
	};
	scale.prototype = {
		init: function () {
			var f = this, g = document, b = window, m = Math;
			f.btn.onmousedown = function (e) {
				var x = (e || b.event).clientX;
				var l = this.offsetLeft;
				var max = f.bar.offsetWidth - this.offsetWidth;
				g.onmousemove = function (e) {
					var thisX = (e || b.event).clientX;
					var to = m.min(max, m.max(-2, l + (thisX - x)));
					f.btn.style.left = to + 'px';
					f.ondrag(m.max(0, to / max) * 10, to);
					
					
					b.getSelection ? b.getSelection().removeAllRanges() : g.selection.empty();
				};
				g.onmouseup = new Function('this.onmousemove=null');
			};
		},
		ondrag: function (pos, x) {
			this.step.style.width = Math.max(0, x) + 'px';
			this.title.innerHTML = Math.round(11*pos/10) +1 + '';
			
			work_n=Math.round(document.getElementById("title0").innerHTML);				
		}
	};
	new scale('btn0', 'bar0', 'title0');

	/*
	 * 处理点击下一步按钮事件
	 */
	function nextstep(){
		var obj_btn = document.getElementById("btn_next");
		obj_btn.disabled = "disabled";

		if(stepnum % steptotal == 0){
			proc_c = 6000;
			flag = 0;
			score = 0;
		}
						
		
			
		var queryStr="name="+para[0]+"&worker="+work_n+"&proc="+proc_c+"&stepnum="+stepnum+"&oldscore="+score+"&flag="+flag+"&target="+target;
		//alert(queryStr);//115.28.33.155
		var url = "http://localhost:8080/SimpleServlet/servlet/sugar?"+queryStr;	
		if(window.XMLHttpRequest){
			req = new XMLHttpRequest();
	    }else if(window.ActiveXObject){
	        req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		req.open("POST",url,false);
		req.onreadystatechange = Callback;
		req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		req.send(null);
	}
	
	function checklb(){
		
		//alert(queryStr);//115.28.33.155
		var url = "http://localhost:8080/SimpleServlet/leaderboard";
		if(window.XMLHttpRequest){
			req = new XMLHttpRequest();
	    }else if(window.ActiveXObject){
	        req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		req.open("POST",url,false);
		req.onreadystatechange = Callbacklb;
		req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		req.send(null);
	};
	
	function Callbacklb(){
        if(req.readyState == 4){
            if(req.status == 200){
                        	            	
                var str = req.responseText;
               // alert(str);
                var temstr = str.split("/");
              
				var obj_leaderboard_bg = document.getElementById("leaderboardbg");
				var stamp = document.getElementById("btn_next");
				
				stamp.disabled = true;
				var ttable = document.getElementById("index-tbody-leader");
				var leaderlistcon = "";
				//alert("Sdg");
				for(var i=0; i<5; i++){//默认列表是5个人
					var st = temstr[i+1].split("=");
					leaderlistcon = leaderlistcon+"<tr><td>"+st[0]+"</td><td>"+st[1]+"</td></tr>";								
				}
				ttable.innerHTML = leaderlistcon;
				
				var ttable_monthly = document.getElementById("index-tbody-leader-monthly");
				var leaderlistcon_monthly = "";
				//alert("Sdg");
				for(var i=5; i<10; i++){//默认列表是5个人
					var st_monthly = temstr[i+1].split("=");
					leaderlistcon_monthly = leaderlistcon_monthly+"<tr><td>"+st_monthly[0]+"</td><td>"+st_monthly[1]+"</td></tr>";								
				}
				ttable_monthly.innerHTML = leaderlistcon_monthly;
				
				
				
				if(obj_leaderboard_bg)
				{
				    if(obj_leaderboard_bg.style.display=="none")
				    {
				        obj_leaderboard_bg.style.display="block";
				    }            
				}
				
				
					
                	
            }else{
                          
				alert("Access Failure!"+req.status);
            }
        }else{
           //var str = req.responseText;               
				//alert("3"+str);
        }
    };
    
    /*
     * 确认排行榜
     */
    
    function confirmboard(){
    	var obj_leaderboard_bg = document.getElementById("leaderboardbg");
    	if(obj_leaderboard_bg)
		{
		    if(obj_leaderboard_bg.style.display=="block")
		    {
		        obj_leaderboard_bg.style.display="none";
		    }            
		}
    };
	
	/*
	 * 用户决定进行下一次实验
	 */
	function tryagain(){
		var obj_tryagain_bg = document.getElementById("tryagain-out");
		var obj_tryagain = document.getElementById("tryagain-in");
		var stamp = document.getElementById("btn_next");
						
		stamp.disabled = false;
		
		if(obj_tryagain_bg)
		{
		    if(obj_tryagain_bg.style.display=="block")
		    {
		        obj_tryagain_bg.style.display="none";
		    }            
		}
		data = [];
        score = 0;//数据初始化
        flag = 0;
        echart(0);
        var obj_div = document.getElementById("div_score");	
        obj_div.innerHTML = score;
		
	}
	
	/*
	 * 用户拒绝进行下一次实验
	 */
	function nottryagain(){
		location.href = "Login_cn.jsp";
	}
	
	function instruction_skip(){
		var obj_tryagain_bg_1 = document.getElementById("instructions-out");
		var obj_tryagain_bg_2 = document.getElementById("instructions-out-2");
		var obj_tryagain_bg_3 = document.getElementById("instructions-out-3");
		var obj_tryagain_bg_4 = document.getElementById("instructions-out-4");
		
		if(obj_tryagain_bg_1)
		{
		    if(obj_tryagain_bg_1.style.display=="block")
		    {
		        obj_tryagain_bg_1.style.display="none";
		    }            
		}
		
		if(obj_tryagain_bg_2)
		{
		    if(obj_tryagain_bg_2.style.display=="block")
		    {
		        obj_tryagain_bg_2.style.display="none";
		    }            
		}
		
		if(obj_tryagain_bg_3)
		{
		    if(obj_tryagain_bg_3.style.display=="block")
		    {
		        obj_tryagain_bg_3.style.display="none";
		    }            
		}
		
		if(obj_tryagain_bg_4)
		{
		    if(obj_tryagain_bg_4.style.display=="block")
		    {
		        obj_tryagain_bg_4.style.display="none";
		    }            
		}
		
		introJs().start();
	}
	
	function instruction_step1(){
		var obj_tryagain_bg = document.getElementById("instructions-out");
		var obj_tryagain_bg_2 = document.getElementById("instructions-out-2");
			
		
		if(obj_tryagain_bg)
		{
		    if(obj_tryagain_bg.style.display=="block")
		    {
		        obj_tryagain_bg.style.display="none";
		    }            
		}
		
		if(obj_tryagain_bg_2)
		{
		    if(obj_tryagain_bg_2.style.display=="none")
		    {
		        obj_tryagain_bg_2.style.display="block";
		    }            
		}

	}
	
	function instruction_step2(){
		var obj_tryagain_bg_2 = document.getElementById("instructions-out-2");
		var obj_tryagain_bg_3 = document.getElementById("instructions-out-3");							
		
		
		if(obj_tryagain_bg_2)
		{
		    if(obj_tryagain_bg_2.style.display=="block")
		    {
		        obj_tryagain_bg_2.style.display="none";
		    }            
		}
		
		if(obj_tryagain_bg_3)
		{
		    if(obj_tryagain_bg_3.style.display=="none")
		    {
		        obj_tryagain_bg_3.style.display="block";
		    }            
		}

	}
	
	function instruction_step3(){
		var obj_tryagain_bg_3 = document.getElementById("instructions-out-3");
		var obj_tryagain_bg_4 = document.getElementById("instructions-out-4");							
		
		
		if(obj_tryagain_bg_3)
		{
		    if(obj_tryagain_bg_3.style.display=="block")
		    {
		        obj_tryagain_bg_3.style.display="none";
		    }            
		}
		
		if(obj_tryagain_bg_4)
		{
		    if(obj_tryagain_bg_4.style.display=="none")
		    {
		        obj_tryagain_bg_4.style.display="block";
		    }            
		}

	}
	
	function instruction_step4(){
		var obj_tryagain_bg_4 = document.getElementById("instructions-out-4");
			
		
		if(obj_tryagain_bg_4)
		{
		    if(obj_tryagain_bg_4.style.display=="block")
		    {
		        obj_tryagain_bg_4.style.display="none";
		    }            
		}		
		introJs().start();
	}
	
	function Callback(){
        if(req.readyState == 4){
            if(req.status == 200){
             	            	            	
                var str = req.responseText;
                //alert(str);
                if(str != null && str.length < 256){//后台返回数据为有效数据
                	stepnum = stepnum % steptotal;
                	
                	if(stepnum ==0){
                		data = [];
                		score = 0;//数据初始化
                		flag = 0;
                	}
                	var temstr = str.split("/");
                	
                	proc_c = parseInt(temstr[0]);
                	data.push(proc_c);
                	echart(stepnum+1);
                	
                	if(proc_c == target){
                		flag++;
                		score += 1000*flag;                		
                	}
                	else{
                	    flag = 0;
                	    if(Math.abs(proc_c-target) <= 1000)
                	    	score += 500;//只能得到一半分数
                	    else if(Math.abs(proc_c-target) <= 2000)
                	    	score += 100;
                	}
                	var obj_div = document.getElementById("div_score");	
                	obj_div.innerHTML = score;               	
                	stepnum++;
                	if(stepnum == steptotal){
						var obj_tryagain_bg = document.getElementById("tryagain-out");
						var obj_tryagain = document.getElementById("getreward-in");
						var stamp = document.getElementById("btn_next");
						var p_score = document.getElementById("p_score");
						
						stamp.disabled = true;
						p_score.innerHTML = "您的得分是 "+ score+".";
						
						
						if(obj_tryagain_bg)
						{
						    if(obj_tryagain_bg.style.display=="none")
						    {
						        obj_tryagain_bg.style.display="block";
						    }            
						}
						
						if(score > threshold){
							if(obj_tryagain)
							{
							    if(obj_tryagain.style.display=="none")
							    {
							        obj_tryagain.style.display="block";
							    }            
							}
						}else{
							if(obj_tryagain)
							{
							    if(obj_tryagain.style.display=="block")
							    {
							        obj_tryagain.style.display="none";
							    }            
							}
						}
					}
                }
                	
            }else{
                          
				alert("Access Failure!"+req.status);
            }
        }else{
           //var str = req.responseText;
               
				//alert("3"+str);
        }
    }
    
    
    function echart(v){
		//var total = v1+v2+v3+v4+v5+v6;
        // 路径配置
        require.config({
            paths: {
                echarts: 'http://echarts.baidu.com/build/dist'
            }
        });
        
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/line', // 使用柱状图就加载bar模块，按需加载
                'echarts/chart/bar'
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('echartcontainer')); 
                
               option = {
				    tooltip : {
				        trigger: 'axis'
				    },
				    /*legend: {
				        data:['Output']
				    },*/
				    
				    calculable : false,
				    /*dataZoom : {
				        show : true,
				        realtime : true,
				        start : 40,
				        end : 60
				    },*/
				    xAxis : [
				        {
				            axisLabel: {
                               rotate: 45,
                            },
				        	name:'Turn',
				        	splitLine:{show: false}, 
				            type : 'category',
				            boundaryGap : false,
				            data : function (){
				                var list = [];
				                
				                for (var i = 0; i <= steptotal; i++) {
				                    list.push(i);
				                }
				                return list;
				            }()
				        }
				    ],
				    yAxis : [
				        {
				        	name : 'Output',
				            type : 'value',
				            splitNumber:(maxOut-minOut)/1000
				        }
				    ],
				    series : [
				        {
				            name:'Output',
				            type:'line',
				            data:function (){
				                var list = [];
				                list.push(6000);
				                for (var i = 0; i < v; i++) {
				                    list.push(data[i]);
				                }
				                return list;
				            }(),
				             /*markLine : {
				                data : [[
				                    {name: '平均值', value:12, x:80,y:300},
				                    {name:'平均值', x:1000,y:300}
				                ]]
				            }*/
				        },
				        {
				            name:'Target',
				            type:'line',
				            data:function (){
				                var list = [];
				                for (var i = 0; i <= steptotal; i++) {
				                    list.push(target);
				                }
				                return list;
				            }(),
				            markLine : {
				                data : [
				                    {type : 'average', name : 'Target'}
				                ]
				            }
				        }
    
				    ]
				};
				option.yAxis[0].min=minOut;
       			option.yAxis[0].max= maxOut;
       			
				//var ecConfig = require('echarts/config');
				//function eConsole(param) {
				    /*var mes = '【' + param.type + '】';
				    if (typeof param.seriesIndex != 'undefined') {
				        mes += '  seriesIndex : ' + param.seriesIndex;
				        mes += '  dataIndex : ' + param.dataIndex;
				    }
				    if (param.type == 'hover') {
				        document.getElementById('hover-console').innerHTML = 'Event Console : ' + mes;
				    }
				    else {
				        document.getElementById('console').innerHTML = mes;
				    }
				    console.log(param);*/
				//}
				/*
				// -------全局通用
				REFRESH: 'refresh',
				RESTORE: 'restore',
				RESIZE: 'resize',
				CLICK: 'click',
				DBLCLICK: 'dblclick',
				HOVER: 'hover',
				MOUSEOUT: 'mouseout',
				// -------业务交互逻辑
				DATA_CHANGED: 'dataChanged',
				DATA_ZOOM: 'dataZoom',
				DATA_RANGE: 'dataRange',
				DATA_RANGE_HOVERLINK: 'dataRangeHoverLink',
				LEGEND_SELECTED: 'legendSelected',
				LEGEND_HOVERLINK: 'legendHoverLink',
				MAP_SELECTED: 'mapSelected',
				PIE_SELECTED: 'pieSelected',
				MAGIC_TYPE_CHANGED: 'magicTypeChanged',
				DATA_VIEW_CHANGED: 'dataViewChanged',
				TIMELINE_CHANGED: 'timelineChanged',
				MAP_ROAM: 'mapRoam',
				*/
				/*myChart.on(ecConfig.EVENT.CLICK, eConsole);
				myChart.on(ecConfig.EVENT.DBLCLICK, eConsole);
				//myChart.on(ecConfig.EVENT.HOVER, eConsole);
				myChart.on(ecConfig.EVENT.DATA_ZOOM, eConsole);
				myChart.on(ecConfig.EVENT.LEGEND_SELECTED, eConsole);
				myChart.on(ecConfig.EVENT.MAGIC_TYPE_CHANGED, eConsole);
				myChart.on(ecConfig.EVENT.DATA_VIEW_CHANGED, eConsole);*/
                    
        
            // 为echarts对象加载数据 
            myChart.setOption(option); 
        }
    );
  }

//绑定回车键
	function keyLogin(){
	 if (event.keyCode==13)  //回车键的键值为13
	   document.getElementById("btn_next").click(); //调用登录按钮的登录事件
	}

//等待echart重新绘制
	function enable_nextstep(){
		var obj_btn = document.getElementById("btn_next");
		if(obj_btn){			
				obj_btn.disabled = "";			
		}
		
		//setTimeout(enable_nextstep,800);
	}
	
	setInterval("enable_nextstep()","1600");
	
	function getReward(){
		alert("You are a genius.");
	}
</script>
<script type="text/javascript">
	function skip(){
		var url = "Login.jsp";	
		location.href=url;
	}
	document.onmousedown = function(event){
		clearInterval(t1);
		t1 = window.setInterval(skip,600000);
	};
	document.onkeydown = function(event){
		
		clearInterval(t1);
		t1 = window.setInterval(skip,600000);
	};
	
	var t1 = window.setInterval(skip,600000);
</script>

 
</html>
