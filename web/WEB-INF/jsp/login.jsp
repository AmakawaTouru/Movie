<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link href="../../../static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../../static/bootstrap/css/bootstrap.css" rel="stylesheet">
    <script src="../../../static/bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="../../../static/bootstrap/js/bootstrap.min.js"></script>
    <script src="../../../static/js/Api.js"></script>
    <link rel="icon" type="image/x-icon" href="../../../static/images/logo.ico"/>
    <link href="../../../static/css/login.css" rel="stylesheet">

    <script></script>
    <title>电影系统-登录注册</title>
</head>
<body>

    <!-- ------------------------------------------------------------------- -->、
    <%--注册页左边logo--%>
    <div class="screen">
        <img class="big_logo"><br/>
        <label class="title">电 影 系 统</label><br/>
        <label class="ineer_one">要么忙着生活，要么忙着死去</label><br/>
        <label class="ineer_two">——肖申克的救赎</label>
    </div>
    <!-- 登录页 -->
    <div class="content" style="float: left;">
        <ul class="tab">
            <li class="login">登录</li>
            <li class="register">注册</li>
        </ul>
        <div class="page">
            <!-- 登录界面 -->
            <div class="childpage" style="display: block">
                <div>
                    <label class="login_title">用户登录</label><br/>
                </div>
                <div class="login_page">
                    <div>
                        <label>帐号</label><br/>
                        <input id="UserName" type="text"/>
                    </div>
                    <div>
                        <label>密码</label><br/>
                        <input id="PassWord" type="password"/>
                    </div>
                </div>
                <div class="lo_error">
                    <label class="login_error"></label>
                </div>
                <div>
                    <input type="button" value="登录" class="btn btn-success login_btn" onclick="loginbtn()"/>
                </div>
                <div>
                    <label class="login_version">@朱浩良 毕业设计</label>
                </div>
            </div>
            <!-- 注册界面 -->
            <div class="childpage" style="display: none">
                <div>
                    <label class="register_title">用户注册</label><br/>
                </div>
                <div class="register_page">
                    <div>
                        <label>帐号</label><br/>
                        <input id="UserName" type="text"/>
                    </div>
                    <div>
                        <label>密码</label><br/>
                        <input id="PassWord" type="password"/>
                    </div>
                    <div>
                        <label>邮箱</label><br/>
                        <input id="Email" type="text"/>
                    </div>
                    <div>
                        <label>验证码</label><br/>
                        <input id="Test" type="text"/>
                        <input id="TestNum" type="button"/>
                    </div>
                </div>
                <div class="re_error">
                    <label class="register_error"></label>
                </div>
                <div>
                    <input type="button" value="注册" class="btn btn-warning register_btn" onclick="registerbtn()"/>
                </div>
                <div>
                    <label class="register_version">@朱浩良 毕业设计</label>
                </div>
            </div>
        </div>
        
    </div>

    <!-- ------------------------------------------------------------------- -->
    <script>
        //初始化
        window.onload = function(){ 
            initWindow(); //初始化登录框位置
            initLogin(); //初始化登录界面
    　　}; 

        //初始化登录框位置（垂直居中、水平4/7）
        function initWindow(){
            var middle = 3;
            var colorNum = 200;
            var clientHeight = document.documentElement.clientHeight;
            var clientWidth = document.documentElement.clientWidth;
            var content = document.getElementsByClassName('content')[0];
            var screen = document.getElementsByClassName('screen')[0];
            var title = document.getElementsByClassName('title')[0];
            var bodys = document.getElementsByTagName('body')[0];
            bodys.style.cssText = "background-size: " + clientWidth + "px auto;";
            content.style.cssText = "margin:" + (clientHeight - content.clientHeight)/2 +"px " + 
            clientWidth*4/7 + "px " +
            (clientHeight - content.clientHeight)/2 + "px;";
            screen.style.cssText = "margin:" + (content.clientHeight - screen.clientHeight)/2 +"px " + 
            (clientWidth*4/7 - screen.clientWidth)/2 + "px " +
            (content.clientHeight - screen.clientHeight)/2 + "px;";
            setInterval(function(){
                colorNum += middle;
                if(colorNum>185){
                    middle = -3;
                }else if(colorNum<80){
                    middle = 3;
                }
                title.style.cssText = "color:rgb(255," + colorNum + ", 0)";
            },30);
        }

        //初始化登录界面
        function initLogin(){
            //验证码的框
            var textNum = document.getElementById('TestNum');
            //注册和登录两个页面
            var liArr = document.getElementsByTagName('li');
            //注册和登录两个div
    		var divArr = document.getElementsByClassName("page")[0].getElementsByClassName("childpage");
            //验证码框按下去的反应函数，产生随机验证码
    		textNum.onclick = function(){
                textNum.value = TestNum();
            }
    		for(var i=0;i<liArr.length;i++){
    			liArr[i].index = i;
    			//按下去“登录”，“注册”两个按钮时
    			liArr[i].onclick = function(){
                    textNum.value = TestNum();
                    //隐藏
    				for(var j=0;j<divArr.length;j++){
                        liArr[j].style.cssText = "background-color:rgba(255, 255, 255, 0.2);";
    					divArr[j].style.display = "none";
    				}
    				//显示
                    liArr[this.index].style.cssText = "background-color:rgba(255, 255, 255, 0);";
    				divArr[this.index].style.display = "block";
    			}
    		}
        }
        
        //更新验证码
        function TestNum(){
            var testNum = "";
            var selectChar = new Array(0,1,2,3,4,5,6,7,8,9,'a','b','c','d','e','f','g','h','i','j','k','l',
                'm','n','o','p','q','r','s','t','u','v','w','x','y','z');
            for(var i=0;i<4;i++){
                //在36位数里面随机挑一个
                var charIndex = Math.floor(Math.random()*36);
                testNum +=selectChar[charIndex];
            }
            return testNum;
        }

         //登录账号和密码信息验证
         function loginbtn(){
            //类选择器找到login_page,再这个类里面找到ID UserName的值，下面同理
            var user_name = $(".login_page").find("#UserName").val();
            var user_pwd = $(".login_page").find("#PassWord").val();
            var login_error = $(".login_error");
            //前端处理账号或者密码为空。
            if((user_name == "") || (user_pwd == "")){
                login_error.text("账号和密码不能为空");
            }
            else{
                //两者都不为空时，进入这个逻辑
                login_error.text("");
                //异步请求"/user/login"
                //发送user_name,user_pwd两个参数
                //回传：失败，就会显示账号密码错误。
                //登录成功，跳转回主页面./mainPage.jsp
                //补充：
                //localStorage允许长时间保存整个网站的数据（键值对）
                //JSON.stringify()的作用是将 JavaScript 对象转换为 JSON 字符串，将传过来的data转换成json字符串。
                $.ajax({
                    type: "post",
                    url: "/user/login",
                    data: {
                        user_name: user_name,
                        user_pwd: user_pwd
                    },
                    dataType: "json",
                    success: function(obj){
                        if(obj.msg == "fail"){
                           // sessionStorage.removeItem('userJson');
                            login_error.text('账号或密码错误!');
                        }
                        else{
                            localStorage.setItem("userJson",JSON.stringify(obj.data));
                          // sessionStorage.set
                            //跳转
                            window.location.href="/";
                        }
                    },
                    error:function(){
                        //错误提醒。
                        alert("network error!");
                    }
                });
            }
        }

        //注册账号和密码逻信息验证
        function registerbtn(){
            //验证码
            var textNum = document.getElementById('TestNum');
            //获取注册信息
            var user_name = $(".register_page").find("#UserName").val();
            var user_pwd = $(".register_page").find("#PassWord").val();
            var user_email = $(".register_page").find("#Email").val();
            var register_error = $(".register_error");
            var test = $("#Test").val();
            //验证码按钮的值
            var testbtn = $("#TestNum").val();
            if((user_name == "") || (user_pwd == "") || (user_email == "")){
                //账号密码邮箱都不能为空
                register_error.text("账号和密码和邮箱不能为空");
                textNum.value = TestNum();
            }
            else if((test == "") || test!=testbtn){
                //验证码错误
                register_error.text("验证码错误");
                textNum.value = TestNum();
            }
            else{
                //注册
                register_error.text("");
                $.ajax({
                    type: "post",
                    url: "/user/register",
                    data: {
                        user_name: user_name,
                        user_pwd: user_pwd,
                        user_email: user_email
                    },
                    dataType: "json",
                    success: function(data){
                        console.log(data.msg);
                        if(data.msg == "success"){
                            //成功就重新会跳自己的页面，并且提示注册成功
                            window.alert("注册成功！");
                            window.location.href="../../index.jsp";
                        }else{
                            //不成功就提示账号已经被注册
                            register_error.text('该账号已被注册!');
                        }
                    }
                });
            }
        }

    </script>
    <!-- ------------------------------------------------------------------- -->
</body>
</html>