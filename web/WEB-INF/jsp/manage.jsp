<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.amakawa.pojo.User"%>

<%--这里不能够跳转，因为WEB-INF里面的页面不能这样跳转的。--%>
<%--<%--%>
<%--	User user = (User)request.getSession().getAttribute("user");--%>
<%--	if(user == null){--%>
<%--		response.sendRedirect("./mainPage.jsp");--%>
<%--	}else{--%>
<%--	    //用于判定是否是管理员--%>
<%--        if(user.getUserLevel() != 1){--%>
<%--            response.sendRedirect("./mainPage.jsp");--%>
<%--        }--%>
<%--    }--%>
<%--%>--%>

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
    <link rel="icon" type="image/x-icon" href="../../../static/images/logo.ico"/>
    <link rel="stylesheet" type="text/css" href="../../../static/css/header.css">
    <link rel="stylesheet" type="text/css" href="../../../static/css/main.css">
    <link rel="stylesheet" type="text/css" href="../../../static/css/manage.css">
    <link rel="stylesheet" type="text/css" href="../../../static/css/footer.css">
    <script src="../../../static/js/header.js" charset="utf-8"></script>
    <script src="../../../static/js/echarts.js"></script>
    <script src="../../../static/js/Api.js"></script>
    <script src="../../../static/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="../../../static/layui/css/layui.css" media="all">
    <title>电影系统-后台管理</title>
</head>
<body>
    <!-- ------------------------------------------------------------------- -->
    <!-- 导航栏 -->
    <jsp:include page="header.jsp"/>

    <!-- 占位符 -->
    <div style="margin-top: 110px;"></div>

    <!-- 主体 bootstrap布局 -->
    <div class="container">
        <div class="contents">
            <div class="nav-next">
                <div class="nav-title">
                    <h3>后台管理</h3>
                </div>
                <a class="cardId">用户管理</a>
                <a class="cardId">电影管理</a>
                <a class="cardId">电影院管理</a>
                <a class="cardId">场次管理</a>
                <a class="cardId">评论管理</a>
                <a class="cardId">订单管理</a>
                <a class="cardId">票房统计</a>
            </div>
            <%--这里是右侧主体--%>
            <div class="nav-body">
                <!-- 用户管理 -->
                <div class="one card" style="display: block;">
                    <div>
                        <div class="title">用户管理</div>
                        <hr/>
                    </div>
                    <!-- 用户列表，使用layui-hide进行隐藏 -->
                    <div class="userlist">
                        <table class="layui-hide" id="user_table_id" lay-filter="UserTable" style="margin-right: 5%;"></table>
                    </div>
                </div>
                <!-- 电影管理 -->
                <div class="two card" style="display: none;">
                    <div>
                        <div class="title">电影管理</div>
                        <hr/>
                    </div>
                    <!-- 点击添加电影的+号即可添加电影 -->
                    <div class="main-inner">
                        <div class="addMovie">
                            <img alt="" src="../../../static/images/addMovie.png" onclick="addConfirm(-1)">
                            <span>添加电影</span>
                        </div>
                        <!-- 猜测应该是用来显示已添加的电影 -->
                        <div class="movie-grid">
                            <div class="panel-header">
                                <span class="panel-title">
                                </span>
                            </div>
                            <div class="panel-content">
                                <ul class="movies-list">
                                </ul>
                            </div>
                            <div class="panel-header">
                                <span class="panel-title2">
                                </span>
                            </div>
                            <div class="panel-content">
                                <ul class="movies-list2">
                                </ul>
                            </div>
                            <div class="panel-header">
                                <span class="panel-title3">
                                </span>
                            </div>
                            <div class="panel-content">
                                <ul class="movies-list3">
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- 电影院管理 -->
                <div class="three card" style="display: none;">
                    <div>
                        <div class="title">电影院管理</div>
                        <hr/>
                    </div>
                    <!-- 点击添加电影的+号即可添加电影 -->
                    <div class="main-inner">
                        <div class="addCinema">
                            <img alt="" src="../../../static/images/addMovie.png" onclick="addCinemaConfirm(-1)">
                            <span>添加电影院</span>
                        </div>
                        <!-- 猜测应该是用来显示已添加的电影 -->
                        <div class="cinema-grid">
                            <div class="panel-header">
                                <span class="panel-title">
                                </span>
                            </div>
                            <div class="panel-content">
                                <ul class="cinemas-list">
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 场次管理 -->
                <div class="four card" style="display: none;">
                    <div>
                        <div class="title">场次管理</div>
                        <hr/>
                    </div>
                    <!-- 场次列表 用layui-hide进行隐藏-->
                    <div class="schedulelist" >
                        <table class="layui-hide" id="schedule_table_id" lay-filter="ScheduleTable" style="margin-right: 5%;"></table>
                    </div>
                </div>
                <!-- 评论管理 -->
                <div class="five card" style="display: none;">
                    <div>
                        <div class="title">评论管理</div>
                        <hr/>
                    </div>
                    <!-- 评论列表 用layui-hide进行隐藏-->
                    <div class="commentlist">
                        <table class="layui-hide" id="comment_table_id" lay-filter="CommentTable" style="margin-right: 5%;"></table>
                    </div>
                </div>
                <!-- 订单管理 -->
                <div class="six card" style="display: none;">
                    <div>
                        <div class="title">订单管理</div>
                        <hr/>
                    </div>
                    <!-- 订单列表 用layui-hide进行隐藏-->
                    <div class="ticketlist">
                        <table class="layui-hide" id="ticket_table_id" lay-filter="TicketTable" style="margin-right: 5%;"></table>
                    </div>
                </div>
                <!-- 票房统计 -->
                <div class="seven card" style="display: none;">
                    <div>
                        <div class="title">票房统计</div>
                        <hr/>
                    </div>
                    <!-- id，aaa暂时不知道如何实现 -->
                    <div id="aaa"></div>
                </div>
            </div>
        </div>
    </div>

    <!-- 脚 -->
    <jsp:include page="footer.jsp"/>

    <!-- ------------------------------------------------------------------- -->

    <!--这里的script实际上可以看做是一些功能拆件，但是需要用id来获取才能显示。-->
    <!--     用户管理      -->
    <script type="text/html" id="userbar">
        <!--layui 原始迷你按钮-->
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
        <a class="layui-btn layui-btn-xs" lay-event="edit">保存</a>
    </script>
    <script type="text/html" id="usertoolbar">
        <!--layui 按钮容器，增加一个添加用户的按钮-->
        <div class="layui-btn-container adduserbtn">
            <button class="layui-btn layui-btn-warm layui-btn-sm" lay-event="useradd">添加用户</button>     
        </div>
        <!--layui 用户搜索功能-->
        <div class="usercheck">
            <input id="userfindtext" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入用户账号" class="layui-input">
            <button class="layui-btn layui-btn-sm" lay-event="finduserbtn">搜索</button> 
        </div>
    </script>

    <!--     场次管理      -->
    <script type="text/html" id="schedulebar">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
        <a class="layui-btn layui-btn-xs" lay-event="edit">下架</a>
    </script>
    <script type="text/html" id="scheduletoolbar">
        <div class="layui-btn-container addbtn">
            <button class="layui-btn layui-btn-warm layui-btn-sm" lay-event="scheduleadd">添加场次</button>     
        </div>
        <div class="schedulecheck">
            <input id="scheduletext" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入电影名" class="layui-input">
            <button class="layui-btn layui-btn-sm" lay-event="findschedulebtn">搜索</button> 
        </div>
        <div class="scheduleonall">
            <button class="layui-btn layui-btn-sm" lay-event="scheduleonallbtn">显示上映</button>
        </div>
        <div class="scheduledownall">
            <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="scheduledownallbtn">显示下架</button>
        </div>
    </script>
    <script type="text/html" id="scheduledownbar">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    </script>

    <!--     评论管理      -->
    <script type="text/html" id="commentbar">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
        <a class="layui-btn layui-btn-xs" lay-event="edit">保存</a>
        <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除</a>
    </script>
    <script type="text/html" id="commenttoolbar">
        <div class="commentcheck">
            <input id="commentfindtext" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入用户账号" class="layui-input">
            <button class="layui-btn layui-btn-sm" lay-event="findcommentbtn">搜索</button>
        </div>
        <div class="commentall">
            <button class="layui-btn layui-btn-sm" lay-event="findcommentall">显示全部</button>
        </div>
    </script>

    <!--     订单管理      -->
    <script type="text/html" id="ticketbar">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    </script>
    <script type="text/html" id="tickettoolbar">
        <div class="ticketcheck">
            <input type="button" class="layui-btn-primary layui-btn-sm changeticketBtn" style="width:70px;" lay-event="changeticketbtn" value="用户帐号">
            <input id="ticketfindtext" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入用户账号" class="layui-input">
            <button class="layui-btn layui-btn-sm" lay-event="findticketbtn">搜索</button>
        </div>
        <div class="orderall">
            <button class="layui-btn layui-btn-sm" lay-event="findorderall">显示全部</button>
        </div>
        <div class="backorder">
            <button class="layui-btn layui-btn-sm layui-btn-normal changeorderBtn" lay-event="backorderbtn">退票审核</button>
        </div>
    </script>
    <script type="text/html" id="backticketbar">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
        <a class="layui-btn layui-btn-xs" lay-event="pass">通过</a>
    </script>


    <!--这里才是真正的js代码-->
    <script>
        var clientHeight = document.documentElement.clientHeight;
        var AddUserHtml;
        var MoviesListHtml;
        var addScheduleContent;
        var AddMoviesHtml;
        var AddCinemasHtml;
        var ActorNum = 1;
        var temp, flag,cinemaFlag;
        var changeticketbtn1 = $('.changeticketBtn');
        var selectmovieName;
        var movieArr = [];
        var cinemaArr = [];
        var cinemaJsonArr = [];
        var boxOffice = []; //票房数组
        var movieArray = []; //电影数组
        var movieType = []; //电影类型数组
        var movieTypeBoxOffice = []; //电影类型票房数组
        var type = [];
        //初始化所有
        window.onload = function(){
            initHeader(); //所有需要头部的页面都需要初始化header
            initHtml(); //初始化html
            initCard(); //选项卡
            initUser(); //用户界面
            initMovies(); //电影界面
            initCinemas(); //电影院界面
            initSchedule(); //场次界面
            initComment(); //评论界面
            initTicket();  //订单界面
            initBoxOffice();//票房统计
        }

        //选项卡
        function initCard(){
            //分别找到对应的左边导航栏
            var aArr = $(".nav-next").find(".cardId");
            //找到导航栏每个对应的右边框
            var divArr = $(".nav-body").find(".card");
            //建立一个持久化本地保存数据
            if(localStorage.getItem("cardId")==null){
                localStorage.setItem("cardId",0);
            }
            //遍历左边全部导航栏，然后将导航栏和右边框进行匹配
            for(var i=0; i<aArr.length; i++){
                aArr[i].index = i;
                //绑定一个左边导航栏点击事件
                //遍历右边框内容，选择相对应的那个进行显示，并且把自己的边框进行变色。
                aArr[i].onclick = function(){
                    localStorage.setItem("cardId",this.index);
                    for(var j=0;j<divArr.length;j++){
                        divArr[j].style.display = "none";
                        aArr[j].style.cssText = "background-color: #f4f3f4; color: #333;";
                    }
                    divArr[this.index].style.display = "block";
                    aArr[this.index].style.cssText = "background-color: #ed3931; color: #fff;";
                }
            }
            //这里的主要作用是进行初始化，把所有右边框全部置为”none“不显示
            for(var p=0;p<aArr.length;p++){
                divArr[p].style.display = "none";
                aArr[p].style.cssText = "background-color: #f4f3f4; color: #333;";
                if(localStorage.getItem("cardId",this.index)==p){
                    divArr[p].style.display = "block";
                    aArr[p].style.cssText = "background-color: #ed3931; color: #fff;";
                }
            }
        }


        //初始化html（一般是初始化一些弹出框的信息）
        function initHtml(){
            //这里是给添加用户的html代码
            AddUserHtml =
            "<h3 class=\"addusertitle\">用户信息</h3>" +
            "<div class=\"layui-form-item\">" +
                "<label class=\"layui-form-label\">账号</label>" +
                "<div class=\"layui-input-block addusertext\">" +
                    "<input id=\"user_name\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"username\" class=\"layui-input\">" +
                "</div>" +
            "</div>" +
            "<div class=\"layui-form-item\">" +
                "<label class=\"layui-form-label\">密码</label>" +
                "<div class=\"layui-input-block addusertext\">" +
                    "<input id=\"user_pwd\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"password\" class=\"layui-input\">" +
                "</div>" +
            "</div>" +
            "<div class=\"layui-form-item\">" +
                "<label class=\"layui-form-label\">邮箱</label>" +
                "<div class=\"layui-input-block addusertext\">" +
                    "<input id=\"user_email\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"email\" class=\"layui-input\">" +
                "</div>" +
            "</div>";

            //这里是给添加电影的html代码，需要修改
            AddMoviesHtml =
            "<h3 class=\"addusertitle\">电影信息</h3>" +
            "<div class=\"textside\">" +
                "<div class=\"layui-form-item\">" +
                    "<label class=\"layui-form-label\">电影名</label>" +
                    "<div class=\"layui-input-block addusertext\">" +
                        "<input id=\"movie_cn_name\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"MovieCnName\" class=\"layui-input\">" +
                    "</div>" +
                "</div>" +
                "<div class=\"layui-form-item\">" +
                    "<label class=\"layui-form-label\">电影外名</label>" +
                    "<div class=\"layui-input-block addusertext\">" +
                        "<input id=\"movie_fg_name\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"MovieFgName\" class=\"layui-input\">" +
                    "</div>" +
                "</div>" +
                "<div class=\"layui-form-item\">" +
                    "<label class=\"layui-form-label\">导演</label>" +
                    "<div class=\"layui-input-block addusertext\">" +
                        "<input id=\"movie_director\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"MovieDirector\" class=\"layui-input\">" +
                    "</div>" +
                "</div>" +
                "<div class=\"layui-form-item\">" +
                    "<label class=\"layui-form-label\" style=\"display:inline-block;\">演职人员</label>" +
                    "<div class=\"layui-input-block addusertext\" style=\"display:inline-block; margin-left: 10px !important; width: 118px;\">" +
                        "<input id=\"movie_actor1\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"MovieActor1\" class=\"layui-input\">" +
                    "</div>" +
                    "<span style=\"margin-left:10px\">饰</span>" +
                    "<div class=\"layui-input-block addusertext\" style=\"display:inline-block; margin-left: 10px !important; width: 118px;\">" +
                        "<input id=\"movie_role1\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"MovieRole1\" class=\"layui-input\">" +
                    "</div>" +
                    "<button type=\"button\" class=\"layui-btn layui-btn-xs\" onclick=\"addActor()\">+</button>" +
                    "<button type=\"button\" class=\"layui-btn layui-btn-xs\" onclick=\"deleteActor()\">-</button>" +
                "</div>" +
                "<div class=\"layui-form-item temp\">" +
                    "<label class=\"layui-form-label\">电影详情</label>" +
                    "<div class=\"layui-input-block addusertext\">" +
                        "<textarea id=\"movie_detail\" placeholder=\"MovieDetail\" class=\"layui-textarea\"></textarea>" +
                    "</div>" +
                "</div>" +
                "<div class=\"layui-form-item\">" +
                    "<label class=\"layui-form-label\">电影时长</label>" +
                    "<div class=\"layui-input-block addusertext\">" +
                        "<input id=\"movie_duration\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"MovieDuration\" class=\"layui-input\">" +
                    "</div>" +
                "</div>" +
                "<div class=\"layui-form-item\">" +
                    "<label class=\"layui-form-label\">电影类型</label>" +
                    "<div class=\"layui-input-block addusertext\">" +
                        "<input id=\"movie_type\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"MovieType\" class=\"layui-input\">" +
                    "</div>" +
                "</div>" +
                "<div class=\"layui-form-item\">" +
                    "<label class=\"layui-form-label\">上映时间</label>" +
                    "<div class=\"layui-input-block addusertext\">" +
                        "<input id=\"movie_releaseDate\" type=\"date\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"MovieReleaseDate\" class=\"layui-input\">" +
                    "</div>" +
                "</div>" +
                "<div class=\"layui-form-item\">" +
                    "<label class=\"layui-form-label\">制片地区</label>" +
                    "<div class=\"layui-input-block addusertext\">" +
                        "<input id=\"movie_country\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"MovieCountry\" class=\"layui-input\">" +
                    "</div>" +
                "</div>" +
                "<div class=\"layui-form-item\">" +
                    "<label class=\"layui-form-label\">电影语言</label>" +
                    "<div class=\"layui-input-block addusertext\">" +
                        "<input id=\"movie_language\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"MovieLanguage\" class=\"layui-input\">" +
                    "</div>" +
                "</div>" +
                "<div style=\"display: none\">" +
                    "<input id=\"movie_status\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"MovieStatus\" class=\"layui-input\">" +
                "</div>" +
            "</div>" +
            "<div class=\"pictureside\">" +
                "<div class=\"layui-upload\">" +
                    "<p class=\"movie-picture\">电影海报</p>" +
                    "<div class=\"layui-upload-list\">" +
                        "<img class=\"layui-upload-img\" id=\"demo1\">" +
                        "<p id=\"demoText\"></p>" +
                    "</div>" +
                    "<a href=\"javascript:;\" class=\"file\">选择文件" +
                        "<input type=\"file\" name=\"file\" id=\"file\">" +
                    "</a>" +
                "</div>" +
            "</div>";


            // 添加电影院的HTML代码
            AddCinemasHtml =
                "<h3 class=\"addusertitle\">电影院信息</h3>" +
                "<div class=\"textside\">" +
                    "<div class=\"layui-form-item\">" +
                        "<label class=\"layui-form-label\">电影院名称</label>" +
                        "<div class=\"layui-input-block addusertext\">" +
                            "<input id=\"cinema_name\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"CinemaName\" class=\"layui-input\">" +
                        "</div>" +
                    "</div>" +
                    "<div class=\"layui-form-item\">" +
                        "<label class=\"layui-form-label\">电影院所属城市</label>" +
                        "<div class=\"layui-input-block addusertext\">" +
                            "<select id=\"cinema_city\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" class=\"layui-select\" >" +
                                "<option value =\"广州\">广州</option>"+
                                "<option value =\"深圳\">深圳</option>"+
                                "<option value =\"上海\">上海</option>"+
                                "<option value =\"北京\">北京</option>"+
                            "</select>" +
                        "</div>" +
                    "</div>" +
                    "<div class=\"layui-form-item temp\">" +
                        "<label class=\"layui-form-label\">电影院详情地址</label>" +
                        "<div class=\"layui-input-block addusertext\">" +
                            "<textarea id=\"cinema_address\" placeholder=\"CinemaAddress\" class=\"layui-textarea\"></textarea>" +
                        "</div>" +
                    "</div>" +
                "</div>" +
                "<div class=\"pictureside\">" +
                    "<div class=\"layui-upload\">" +
                        "<p class=\"cinema-picture\">电影院宣传图</p>" +
                        "<div class=\"layui-upload-list\">" +
                            "<img class=\"layui-upload-img\" id=\"demo1\">" +
                            "<p id=\"demoText\"></p>" +
                        "</div>" +
                        "<a href=\"javascript:;\" class=\"file\">选择文件" +
                            "<input type=\"file\" name=\"file\" id=\"file\">" +
                        "</a>" +
                    "</div>" +
                "</div>";

            //这里是给添加场次的html代码
            addScheduleContent =
            "<h3 class=\"addtitle\">场次信息</h3>" +
            "<div class=\"layui-form-item schedule-div aaaaaaa\">" +
                "<label class=\"scheduleLabel\">电影</label>" +
                "<div class=\"layui-form layui-input-inline addselect drop-cinema\" lay-filter=\"selectMovie\">" + 
                    "<select id=\"select_movie_name\" name=\"modules\" lay-verify=\"required\" lay-search=\"\">" +
                        "<option>选择电影</option>" +
                    "</select>" +
                "</div>" +
            "</div>" +
            "<div class=\"layui-form-item schedule-div\">" +
                "<label class=\"scheduleLabel\">影院</label>" +
                "<div class=\"layui-form layui-input-inline addselect drop-cinema\">" + 
                    "<select id=\"select_cinema_name\" name=\"modules\" lay-verify=\"required\" lay-search=\"\" lay-filter=\"selectCinema\">" +
                        "<option >选择影院</option>" +
                    "</select>" +
                "</div>" +
            "</div>" +
            "<div class=\"layui-form-item schedule-div\">" +
                "<label class=\"scheduleLabel\">放映厅</label>" +
                "<div class=\"layui-form layui-input-inline addselect drop-hall\" lay-filter=\"select\">" + 
                    "<select id=\"select_schedule_hall\" name=\"modules\" lay-verify=\"required\" lay-search=\"\">" +
                        "<option>选择放映厅</option>" +
                    "</select>" +
                "</div>" +
            "</div>" +
            "<div class=\"layui-form-item schedule-div\">" +
                "<label class=\"scheduleLabel\">场次时间</label>" +
                "<div class=\"layui-input-inline addselect\">" +
                    "<input type=\"text\" class=\"layui-input\" id=\"schedule_startTime_Text\" placeholder=\"yyyy-MM-dd HH:mm\">" +
                "</div>" +
            "</div>" +
            "<div class=\"layui-form-item schedule-div\">" +
                "<label class=\"scheduleLabel\">价格</label>" +
                "<div class=\"layui-input-inline addselect\">" +
                    "<input id=\"schedule_price_Text\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"money\" class=\"layui-input\">" +
                "</div>" +
            "</div>";
        }

        //初始化用户管理界面
        function initUser(){
            var actionUrl = "";
            //用户列表，layui.use同时载入多个模块
            //layui.laypage 分页
            //layui.layer 弹出层
            //layui.table 数据表格
            layui.use(['laypage', 'layer', 'table'], function(){
                var laypage = layui.laypage;
                var layer = layui.layer;
                var table = layui.table;

                //绑定上面HTML写的表格，然后用url来进行请求数据。
                //用上上面定义的工具栏usertoolbar和userbar的按钮
                //用parseData规定返回的数据格式
                //注意，异步请求里面url默认会传递两个参数，一个是page，一个是limit，一个代表当前页码，另外一个是每页的数量。
                //下面的page的layout，采用的是laypage的属性。
                //limits这个选项是可以让用户来选择每页显示多少
                table.render({
                    elem: '#user_table_id'
                    ,url: '/user/findAllUser'
                    ,method: 'post'
                    ,toolbar: '#usertoolbar'
                    ,title: '用户列表'
                    ,cols: [[
                        {field:'userId', title:'用户ID', width:102, unresize: true, sort: true}
                        ,{field:'userAccount', title:'用户账号', width:270, unresize: true,sort: true}
                        ,{field:'userPassword', title:'密码', width:270, unresize: true, edit: "text"}
                        ,{field:'userEmail', title:'邮箱', width:270, unresize: true, sort: true, edit: "text"}
                        ,{title:'操作', width:300, unresize: true, align:'center', toolbar: '#userbar'}
                    ]]
                    ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                        ,curr: 1 //设定初始在第 1 页
                        ,groups: 5 //只显示 5 个连续页码
                        ,first: false //显示首页
                        ,last: false //显示尾页
                        ,limits: [10,15,20]
                    }
                    ,response: {
                        statusCode: 0 //重新规定成功的状态码为 200，table 组件默认为 0
                    }
                    ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                        return {
                            "code": res.code, //解析接口状态
                            "msg": res.msg, //解析提示文本
                            "count": res.count, //解析数据长度
                            "data": res.data //解析数据列表
                        };
                    }
                });

                //layui监听工具条,这里引用的是lay-filter这个属性里面的值
                table.on('tool(UserTable)', function(obj){
                    var data = obj.data;   //这里是获取监听的当前行数据
                    //这里对应的是userbar里面的lay-event
                    if(obj.event === 'detail'){
                        //显示详细信息
                        layer.msg('ID：'+ data.userId + '</br>账号：'+ data.userAccount + '</br>密码：'+ data.userPassword  + '</br>邮箱：'+ data.userEmail, {offset: clientHeight/4,area: '300px;'});
                    }
                    else if(obj.event === 'edit'){
                        //编辑用户信息
                        layer.alert('确定要对id为“'+ JSON.stringify(data.userId) + '”的用户修改进行保存吗？',{icon: 0,offset: clientHeight/5},
                            function () {
                                $.ajax({
                                    type:'post',
                                    url: "/user/updateUser",
                                    dataType:'json',
                                    data: {
                                        userId: data.userId,
                                        userAccount: data.userAccount,
                                        userPassword: data.userPassword,
                                        userEmail: data.userEmail,
                                    },
                                    success:function (date) {
                                        if(date.msg == "success"){
                                            layer.alert('修改成功！',{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                    location.reload();
                                                }
                                            );
                                        }else{
                                            layer.alert('错误发生，修改失败！',{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                }
                                            );
                                        }
                                    }
                                });
                            }
                        );
                    }
                });

                //监听 搜索框和添加用户的工具栏
                table.on('toolbar(UserTable)', function(obj){
                    var checkStatus = table.checkStatus(obj.config.id);
                    //判断obj的event有两种，一种是useradd，添加用户
                    //一种是finduserbtn，搜索用户功能
                    switch(obj.event){
                        case 'useradd':
                            //添加用户，弹出框
                            layer.open({
                                type: 1
                                ,title: "添加用户" //不显示标题栏
                                ,closeBtn: false
                                ,area: '400px;'
                                ,shade: 0.8
                                ,offset: clientHeight/5
                                ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                                ,btn: ['确认添加', '取消']
                                ,yes: function(){
                                    var user_name = $('#user_name').val(),
                                        user_pwd = $('#user_pwd').val()
                                        user_email = $('#user_email').val();
                                    if((user_name == "") || (user_pwd == "") || (user_email == "")){
                                        layer.alert('添加信息不能存在空，添加失败！',{icon: 0,offset: clientHeight/5},
                                            function (){
                                                layer.close(layer.index);
                                            }
                                        );
                                    }
                                    else{
                                        $.ajax({
                                            type:'post',
                                            url: "/user/register",
                                            dataType:'json',
                                            data: {
                                                user_name: user_name,
                                                user_pwd: user_pwd,
                                                user_email: user_email,
                                            },
                                            success:function (date) {
                                                if(date.msg == "success"){
                                                    layer.alert('添加成功！',{icon: 0,offset: clientHeight/5},
                                                        function (){
                                                            layer.closeAll();
                                                            location.reload();
                                                        }
                                                    );
                                                }else{
                                                    layer.alert('增添用户失败！',{icon: 0,offset: clientHeight/5},
                                                        function (){
                                                            layer.closeAll();
                                                        }
                                                    );
                                                }
                                            }
                                        });
                                    }

                                }
                                ,btnAlign: 'c'
                                ,moveType: 0 //拖拽模式，0或者1
                                ,content: AddUserHtml  //这里就是弹出框显示的内容
                                ,success: function(layero){
                                    //弹出成功后的回调
                                    var btn = layero.find('.layui-layer-btn');
                                    btn.find('.layui-layer-btn0').attr({
                                    });
                                }
                            });
                        break;
                        case 'finduserbtn':
                            var user_name = $('#userfindtext').val();
                            //刷新table,使用table.reload方法。
                            table.reload('user_table_id', {
                                url: '/user/findUserInfosByName'
                                ,method: "POST"
                                ,where: {
                                    user_name: user_name
                                }
                                ,page: {
                                    curr: 1 //重新从第 1 页开始
                                }
                            });
                        break;
                            
                    };
                });
            });
        }

        //初始化电影管理界面
        function initMovies(){
            var MoviesNum = $(".two").find(".panel-title");
            var MovieLi =  $(".two").find(".movies-list");
            var MoviesUnNum = $(".two").find(".panel-title2");
            var MovieUnLi =  $(".two").find(".movies-list2");
            var MoviesOutNum = $(".two").find(".panel-title3");
            var MovieOutLi =  $(".two").find(".movies-list3");

            //ajax异步请求全部电影
            //返回json格式的obj，里面包含后台传输过来的数据。
            $.ajax({
                type:'post',
                url: "/movie/findAllMovies",
                dataType:'json',
                data: {},
                success:function (obj) {
                    MoviesNum.append("<span class=\"textcolor_red\">正在热映（" + obj.data.length + "部）</span>");
                    MoviesUnNum.append("<span class=\"textcolor_red\">尚未上映（" + obj.data2.length + "部）</span>");
                    MoviesOutNum.append("<span class=\"textcolor_red\">下架电影（" + obj.data3.length + "部）</span>");

                    //这里遍历的是正在热映的数据
                    for(var i=0;i<obj.data.length;i++){
                        MoviesListHtml =
                        "<li>" +
                            "<div class=\"movie-item\">" +
                                "<a>" +
                                    "<div class=\"movie-poster\">" +
                                        "<img src=\""+ obj.data[i].moviePoster +"\" onclick=\"movieDetail("+obj.data[i].movieId+")\" >" +
                                        "<div class=\"movie-overlay movie-overlay-bg\">" +
                                            "<div class=\"movie-info\">" +
                                                "<div class=\"movie-score\"><i class=\"integer\">"+ obj.data[i].movieScore +"</i></div>" +
                                                "<div class=\"movie-title movie-title-padding\" title=\"\">"+ obj.data[i].movieName +"</div>\"" +
                                            "</div>" +
                                        "</div>" +
                                    "</div>" +
                                "</a>" +
                                "<div class=\"moive-btn\">" +
                                    "<div class=\"movies-detail movie-detail-strong movie-sale\">" +
                                        "<a class=\"active\" onclick=\"addConfirm("+ obj.data[i].movieId +")\" target=\"_blank\" data-act=\"salePlayingMovie-click\" data-val=\"\">修改</a>" +
                                    "</div>" +
                                    "<div class=\"movies-detail movie-detail-strong movie-sale\">" +
                                        "<span id=\"deleteId\" style=\"display:none;\">${u.id}</span>" +
                                        "<a class=\"active\" onclick=\"rmConfirm("+ obj.data[i].movieId +")\" data-act=\"salePlayingMovie-click\" id=\"delete\">下架</a>" +
                                    "</div>" +
                                "</div>" +
                            "</div>" +
                        "</li>";
                        //添加这样的一个列表项进去。
                        MovieLi.append(MoviesListHtml);
                    }

                    //这里遍历的是尚未上映的数据
                    for(var i=0;i<obj.data2.length;i++){
                        MoviesUnListHtml =
                            "<li>" +
                                "<div class=\"movie-item\">" +
                                    "<a>" +
                                        "<div class=\"movie-poster\">" +
                                            "<img src=\""+ obj.data2[i].moviePoster +"\" onclick=\"movieDetail("+obj.data2[i].movieId+")\">" +
                                            "<div class=\"movie-overlay movie-overlay-bg\">" +
                                                "<div class=\"movie-info\">" +
                                                    "<div class=\"movie-score\"><i class=\"integer\">"+ obj.data2[i].movieScore +"</i></div>" +
                                                    "<div class=\"movie-title movie-title-padding\" title=\"\">"+ obj.data2[i].movieName +"</div>\"" +
                                                "</div>" +
                                            "</div>" +
                                        "</div>" +
                                    "</a>" +
                                "<div class=\"moive-btn\">" +
                                    "<div class=\"movies-detail movie-detail-strong movie-sale\">" +
                                        "<a class=\"active\" onclick=\"addConfirm("+ obj.data2[i].movieId +")\" target=\"_blank\" data-act=\"salePlayingMovie-click\" data-val=\"\">修改</a>" +
                                    "</div>" +
                                    "<div class=\"movies-detail movie-detail-strong movie-sale\">" +
                                        "<span id=\"deleteId\" style=\"display:none;\">${u.id}</span>" +
                                        "<a class=\"active\" onclick=\"upConfirm("+ obj.data2[i].movieId +")\" data-act=\"salePlayingMovie-click\" id=\"delete\">上架</a>" +
                                    "</div>" +
                                "</div>" +
                            "</div>" +
                        "</li>";
                        //添加这样的一个列表项进去。
                        MovieUnLi.append(MoviesUnListHtml);
                    }


                    //这里遍历的是下架的数据
                    for(var i=0;i<obj.data3.length;i++){
                        MoviesOutListHtml =
                            "<li>" +
                                "<div class=\"movie-item\">" +
                                    "<a>" +
                                        "<div class=\"movie-poster\">" +
                                            "<img src=\""+ obj.data3[i].moviePoster +"\" onclick=\"movieDetail("+obj.data3[i].movieId+")\">" +
                                            "<div class=\"movie-overlay movie-overlay-bg\">" +
                                                "<div class=\"movie-info\">" +
                                                    "<div class=\"movie-score\"><i class=\"integer\">"+ obj.data3[i].movieScore +"</i></div>" +
                                                    "<div class=\"movie-title movie-title-padding\" title=\"\">"+ obj.data3[i].movieName +"</div>\"" +
                                                "</div>" +
                                            "</div>" +
                                        "</div>" +
                                    "</a>" +
                                "<div class=\"moive-btn\">" +
                                    "<div class=\"movies-detail movie-detail-strong movie-sale\">" +
                                        "<a class=\"active\" onclick=\"addConfirm("+ obj.data3[i].movieId +")\" target=\"_blank\" data-act=\"salePlayingMovie-click\" data-val=\"\">修改</a>" +
                                    "</div>" +
                                    "<div class=\"movies-detail movie-detail-strong movie-sale\">" +
                                        "<span id=\"deleteId\" style=\"display:none;\">${u.id}</span>" +
                                        "<a class=\"active\" onclick=\"reUpConfirm("+ obj.data3[i].movieId +")\" data-act=\"salePlayingMovie-click\" id=\"delete\">重新上架</a>" +
                                    "</div>" +
                                "</div>" +
                            "</div>" +
                        "</li>";
                        //添加这样的一个列表项进去。
                        MovieOutLi.append(MoviesOutListHtml);
                    }
                }
            });
        }

        //需要修改，这里是不能这样直接跳转的，这里跳转到电影详细页。
        function movieDetail(movie_id) {
            window.location.href = "/movieDetail?movie_id=" + movie_id;
        }

        function cinemaDetail(cinema_id) {
            window.location.href = "/cinemaDetail?cinema_id=" + cinema_id;
        }

        //电影添加&修改点击事件
        //FormData可以将name和value进行组合，实现表单数据的序列化。
        function addConfirm(movie_id){
            var file;
            var formData = new FormData();
            var tempurl;
            //添加电影，id=-1，跳转到添加电影的controller
            if(movie_id == -1){
                tempurl = "/movie/addMovie";
                temp = "添加";
                flag = 0;
            }
            //修改电影，否则跳转到修改电影的页面
            else{
                tempurl = "/movie/updateMovie";
                temp = "修改";
                flag = 1;
            }
            //这里的弹出框的内容是AddMoviesHtml设置
            layui.use(['laypage', 'layer', 'table'], function(){
                var laypage = layui.laypage;
                var layer = layui.layer;
                var table = layui.table
                //电影添加
                layer.open({
                    type: 1
                    ,title: temp + "电影" //不显示标题栏
                    ,closeBtn: false
                    ,area: '750px;'
                    ,shade: 0.8
                    ,offset: clientHeight/20
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: ['确认' + temp, '取消']
                    ,yes: function(){
                        var movie_cn_name = $('#movie_cn_name').val(),
                            movie_fg_name = $('#movie_fg_name').val(),
                            movie_director = $('#movie_director').val(),
                            movie_actor = "",
                            movie_detail = $('#movie_detail').val(),
                            movie_duration = $('#movie_duration').val(),
                            movie_type = $('#movie_type').val(),
                            movie_releaseDate = $('#movie_releaseDate').val(),
                            movie_country = $('#movie_country').val(),
                            movie_language = $('#movie_language').val(),
                            movie_status = $('#movie_status').val();

                        //演员数量，默认最小值为1，对演员姓名进行拼接
                        for(var i = 1;i<(ActorNum+1);i++){
                            movie_actor += $("#movie_actor" + i).val() + ":";
                            if(i==ActorNum){
                                movie_actor += $("#movie_role" + i).val();
                            }
                            else{
                                movie_actor += $("#movie_role" + i).val() + ",";
                            }
                        }
                        //如果存在某一项为空时，就弹出警告。
                        if((movie_cn_name == "") || (movie_director == "") || (movie_actor == "") ||
                            (movie_detail == "") || (movie_duration == "") || (movie_type == "") || 
                            (movie_fg_name == "") || (movie_releaseDate == "") || (movie_country == "") ||
                            (movie_language == "")){
                            layer.alert(temp + '信息不能存在空，' + temp + '失败！',{icon: 0,offset: clientHeight/5},
                                function (){
                                    layer.close(layer.index);
                                }
                            );
                        } else {
                            //flag=0就是添加电影
                            if(flag == 0){
                                if(file == null){
                                    layer.alert('图片信息不能存在空，' + temp + '失败！',{icon: 0,offset: clientHeight/5},
                                        function (){
                                            layer.close(layer.index);
                                        }
                                    );
                                }else{
                                    formData.append("movieName",movie_cn_name);
                                    formData.append("movieForeignName",movie_fg_name);
                                    formData.append("movieDirector",movie_director);
                                    formData.append("movieActors",movie_actor);
                                    formData.append("movieIntroduction",movie_detail);
                                    formData.append("movieLength",movie_duration);
                                    formData.append("movieTypes",movie_type);
                                    formData.append("movieRelease",movie_releaseDate);
                                    formData.append("movieRegion",movie_country);
                                    formData.append("movieLanguage",movie_language);
                                    formData.append("file",file);
                                    //异步请求，传输数据为formData
                                    $.ajax({
                                        type:'post',
                                        url: tempurl,
                                        data: formData,
                                        processData: false,
                                        contentType: false,
                                        success:function (obj) {
                                            //code=0就说明添加成功了
                                            if(obj.code == 0){
                                                layer.alert(temp + '成功！',{icon: 0,offset: clientHeight/5},
                                                    function (){
                                                        layer.closeAll();
                                                        location.reload();
                                                    }
                                                );
                                            }else{
                                                //否则失败
                                                layer.alert(temp + '失败！',{icon: 0,offset: clientHeight/5},
                                                    function (){
                                                        layer.closeAll();
                                                    }
                                                );
                                            }
                                        }
                                    });
                                }
                                //flag=1就是修改电影
                            } else{
                                //无论file有没有上传，都应该传过去，让后端自己判断。
                                formData.append("file",file);
                                formData.append("movieName",movie_cn_name);
                                formData.append("movieForeignName",movie_fg_name);
                                formData.append("movieDirector",movie_director);
                                formData.append("movieActors",movie_actor);
                                formData.append("movieIntroduction",movie_detail);
                                formData.append("movieLength",movie_duration);
                                formData.append("movieTypes",movie_type);
                                formData.append("movieRelease",movie_releaseDate);
                                formData.append("movieRegion",movie_country);
                                formData.append("movieLanguage",movie_language);
                                formData.append("movieStatus",movie_status);
                                formData.append("movieId",movie_id);

                                $.ajax({
                                    type:'post',
                                    url: tempurl,
                                    data: formData,
                                    processData: false,
                                    contentType: false,
                                    success:function (obj) {
                                        //code=0成功
                                        if(obj.code == 0){
                                            layer.alert(temp + '成功！',{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                    location.reload();
                                                }
                                            );
                                        }else{
                                            layer.alert(temp + '失败！',{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                }
                                            );
                                        }
                                    }
                                });
                            }
                        }
                    }
                    ,btnAlign: 'c movie-last'
                    ,moveType: 0 //拖拽模式，0或者1
                    ,content: AddMoviesHtml
                    ,success: function(layero){
                        if(flag == 1){
                            var TextSide = $(".textside").find(".temp");
                            var StrActor,StrRole;
                            //利用ajax异步请求findMovieById，找到电影的相关信息并赋值给对应的DOM元素
                            $.ajax({
                                type:'post',
                                url: "/movie/findMovieById",
                                dataType:'json',
                                data: {
                                    movie_id: movie_id
                                },
                                success:function (obj) {
                                    $('#movie_cn_name').val(obj.data.movieName);
                                    $('#movie_director').val(obj.data.movieDirector);
                                    ActorTemp = obj.data.movieActors;
                                    $('#movie_detail').val(obj.data.movieIntroduction);
                                    $('#movie_duration').val(obj.data.movieLength);
                                    $('#movie_type').val(obj.data.movieTypes);
                                    $('#movie_fg_name').val(obj.data.movieForeignName);
                                    $('#movie_releaseDate').val(obj.data.movieRelease);
                                    $('#movie_country').val(obj.data.movieRegion);
                                    $('#movie_language').val(obj.data.movieLanguage);
                                    $('#movie_status').val(obj.data.movieStatus);
                                    $('#demo1').attr('src', obj.data.moviePoster);

                                    //将演员和角色进行拼接
                                    StrActor = ActorTemp.split(',');
                                    $('#movie_actor1').val(StrActor[0].split(':')[0]);
                                    $('#movie_role1').val(StrActor[0].split(':')[1]);
                                    for(var i = 1;i<StrActor.length;i++){
                                        StrRole = StrActor[i].split(':');
                                        TextSide.before(
                                            "<div class=\"layui-form-item\">" +
                                                "<label class=\"layui-form-label\" style=\"display:inline-block;\">人员" + (i+1) + "</label>" +
                                                "<div class=\"layui-input-block addusertext actor\" style=\"display:inline-block; margin-left: 10px !important; width: 118px;\">" +
                                                    "<input id=\"movie_actor" + (i+1) + "\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"MovieActor" + (i+1) + "\" class=\"layui-input\">" +
                                                "</div>" +
                                                "<span style=\"margin-left:10px\">饰</span>" +
                                                "<div class=\"layui-input-block addusertext\" style=\"display:inline-block; margin-left: 10px !important; width: 118px;\">" +
                                                    "<input id=\"movie_role" + (i+1) + "\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"MovieRole" + (i+1) + "\" class=\"layui-input\">" +
                                                "</div>" +
                                            "</div>"
                                        );
                                        $('#movie_actor'+(i+1)).val(StrRole[0]);
                                        $('#movie_role'+(i+1)).val(StrRole[1]);
                                    }
                                    ActorNum = StrActor.length;
                                }
                            });
                        }
                        else{
                            //如果是添加电影的话，就将演员的数量置1
                            ActorNum = 1;
                        }
                        //图片上传
                        //绑定file元素
                        layui.use('upload', function(){
                            var $ = layui.jquery
                                ,upload = layui.upload;
                            //普通图片上传，注意#file指的是上面定义的id为file的input按钮
                            var uploadInst = upload.render({
                                elem: '#file',
                                auto: false,
                                choose: function (obj) {
                                    //预读本地文件。
                                    //index 文件索引
                                    //file 文件对象
                                    //result 文件base64编码
                                    obj.preview(function (index, file, result) {
                                        //将base64编码放入到#demo1这个DOM对象里面
                                        $('#demo1').attr('src', result); //图片链接（base64）
                                    })
                                    //这一步是最重要的，这一步才赋值给file，让file通过json传到后台。
                                    file = $('#file')[0].files[0];
                                }
                            });
                        });
                    }
                });
            });
        }


        //电影下架点击事件
        function rmConfirm(movie_id){
            layui.use(['layer'], function(){
                var layer = layui.layer;
                layer.alert('确定要对id为“'+ movie_id + '”的电影修改进行下架吗？',{icon: 0,offset: clientHeight/5},
                    function () {
                        $.ajax({
                            type:'post',
                            url: "/movie/rmMovie",
                            dataType:'json',
                            data: {
                                movieId: movie_id,
                            },
                            success:function (date) {
                                if(date.code == 0){
                                    layer.alert('下架成功！',{icon: 0,offset: clientHeight/5},
                                        function (){
                                            layer.closeAll();
                                            location.reload();
                                        }
                                    );
                                }else{
                                    layer.alert('下架失败！',{icon: 0,offset: clientHeight/5},
                                        function (){
                                            layer.closeAll();
                                        }
                                    );
                                }
                            }
                        });
                    }
                );
            });
        }

        //电影上映点击事件
        function upConfirm(movie_id){
            layui.use(['layer'], function(){
                var layer = layui.layer;
                layer.alert('确定要对id为“'+ movie_id + '”的电影修改状态为上映吗？',{icon: 0,offset: clientHeight/5},
                    function () {
                        $.ajax({
                            type:'post',
                            url: "/movie/upMovie",
                            dataType:'json',
                            data: {
                                movieId: movie_id,
                            },
                            success:function (date) {
                                if(date.code == 0){
                                    layer.alert('上映成功！',{icon: 0,offset: clientHeight/5},
                                        function (){
                                            layer.closeAll();
                                            location.reload();
                                        }
                                    );
                                }else{
                                    layer.alert('上映失败！',{icon: 0,offset: clientHeight/5},
                                        function (){
                                            layer.closeAll();
                                        }
                                    );
                                }
                            }
                        });
                    }
                );
            });
        }


        //电影重新上架点击事件
        function reUpConfirm(movie_id){
            layui.use(['layer'], function(){
                var layer = layui.layer;
                layer.alert('确定要对id为“'+ movie_id + '”的电影修改状态为上映吗？',{icon: 0,offset: clientHeight/5},
                    function () {
                        $.ajax({
                            type:'post',
                            url: "/movie/reUpMovie",
                            dataType:'json',
                            data: {
                                movieId: movie_id,
                            },
                            success:function (date) {
                                if(date.code == 0){
                                    layer.alert('重新上架成功！',{icon: 0,offset: clientHeight/5},
                                        function (){
                                            layer.closeAll();
                                            location.reload();
                                        }
                                    );
                                }else{
                                    layer.alert('重新上架失败！',{icon: 0,offset: clientHeight/5},
                                        function (){
                                            layer.closeAll();
                                        }
                                    );
                                }
                            }
                        });
                    }
                );
            });
        }

        //电影添加演员
        function addActor(){
            var TextSide = $(".textside").find(".temp");
            if(ActorNum<5){
                ActorNum++;
                TextSide.before(
                    "<div class=\"layui-form-item\">" +
                        "<label class=\"layui-form-label\" style=\"display:inline-block;\">人员" + ActorNum + "</label>" +
                        "<div class=\"layui-input-block addusertext actor\" style=\"display:inline-block; margin-left: 10px !important; width: 118px;\">" +
                            "<input id=\"movie_actor" + ActorNum + "\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"MovieActor" + ActorNum + "\" class=\"layui-input\">" +
                        "</div>" +
                        "<span style=\"margin-left:10px\">饰</span>" +
                        "<div class=\"layui-input-block addusertext\" style=\"display:inline-block; margin-left: 10px !important; width: 118px;\">" +
                            "<input id=\"movie_role" + ActorNum + "\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"MovieRole" + ActorNum + "\" class=\"layui-input\">" +
                        "</div>" +
                    "</div>"
                );
            }
            else{
                layui.use(['laypage', 'layer'], function(){
                var laypage = layui.laypage;
                var layer = layui.layer;
                    layer.alert('最多只能存在5个演职人员！',{icon: 0,offset: clientHeight/5},
                        function (){
                            layer.close(layer.index);
                        }
                    );
                });
            }
        }
        //电影删除演员
        function deleteActor(){
            console.log(ActorNum);
            if(ActorNum>1){
                var TextSide = $(".textside").find(".layui-form-item");
                TextSide[(ActorNum+2)].remove();
                ActorNum--;
            }
            else{
                layui.use(['laypage', 'layer'], function(){
                var laypage = layui.laypage;
                var layer = layui.layer;
                    layer.alert('最少要存在1个演职人员！',{icon: 0,offset: clientHeight/5},
                        function (){
                            layer.close(layer.index);
                        }
                    );
                });
            }
        }


        // 初始化电影院管理页面
        function initCinemas(){
            var CinemasNum = $(".three").find(".panel-title");
            var CinemaLi =  $(".three").find(".cinemas-list");

            $.ajax({
                type:'post',
                url: "/cinema/findAllCinemas",
                dataType:'json',
                data: {},
                success:function (obj) {
                    CinemasNum.append("<span class=\"textcolor_red\">电影院（" + obj.data.length + "家）</span>");
                    //这里遍历的是正在热映的数据
                    for(var i=0;i<obj.data.length;i++){
                        CinemasListHtml =
                            "<li>" +
                                "<div class=\"cinema-item\">" +
                                    "<a>" +
                                        "<div class=\"cinema-poster\">" +
                                            "<img src=\""+ obj.data[i].cinemaPoster +"\" onclick=\"cinemaDetail("+obj.data[i].cinemaId+")\" >" +
                                            "<div class=\"cinema-overlay cinema-overlay-bg\">" +
                                                "<div class=\"cinema-info\">" +
                                                    "<div class=\"cinema-score\"><i class=\"integer\">0</i></div>" +
                                                    "<div class=\"cinema-title cinema-title-padding\" title=\"\">"+ obj.data[i].cinemaName +"</div>\"" +
                                                "</div>" +
                                            "</div>" +
                                        "</div>" +
                                    "</a>" +
                                    "<div class=\"cinema-btn\">" +
                                        "<div class=\"cinemas-detail cinema-detail-strong cinema-sale\">" +
                                            "<a class=\"active\" onclick=\"addCinemaConfirm("+ obj.data[i].cinemaId +")\" target=\"_blank\" data-act=\"salePlayingCinema-click\" data-val=\"\">修改信息</a>" +
                                        "</div>" +
                                        "<div class=\"cinemas-detail cinema-detail-strong cinema-sale\">" +
                                            "<span id=\"deleteId\" style=\"display:none;\">${u.id}</span>" +
                                            "<a class=\"active\" onclick=\"rmCinemaConfirm("+ obj.data[i].cinemaId +")\" data-act=\"salePlayingCinema-click\" id=\"delete\">删除影院</a>" +
                                        "</div>" +
                                    "</div>" +
                                "</div>" +
                            "</li>";
                        CinemaLi.append(CinemasListHtml);
                    }
                }
            });
        }



        function addCinemaConfirm(cinema_id){
            var file;
            var formData = new FormData();
            var tempurl;
            //添加电影，id=-1，跳转到添加电影的controller
            if(cinema_id == -1){
                tempurl = "/cinema/addCinema";
                temp = "添加";
                cinemaFlag = 0;
            }
            //修改电影，否则跳转到修改电影的页面
            else{
                tempurl = "/cinema/updateCinema";
                temp = "修改";
                cinemaFlag = 1;
            }
            layui.use(['laypage', 'layer', 'table'], function(){
                var laypage = layui.laypage;
                var layer = layui.layer;
                var table = layui.table
                //电影添加
                layer.open({
                    type: 1
                    ,title: temp + "电影院" //不显示标题栏
                    ,closeBtn: false
                    ,area: '750px;'
                    ,shade: 0.8
                    ,offset: clientHeight/20
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: ['确认' + temp, '取消']
                    ,yes: function(){
                        var cinema_name = $('#cinema_name').val();
                        var cinema_city = $('#cinema_city').val();
                        var cinema_address = $('#cinema_address').val();

                        //如果存在某一项为空时，就弹出警告。
                        if( (cinema_name == "") ||  (cinema_city == "") || (cinema_address == "")  ){
                            layer.alert(temp + '信息不能存在空，' + temp + '失败！',{icon: 0,offset: clientHeight/5},
                                function (){
                                    layer.close(layer.index);
                                }
                            );
                        } else {
                            if(cinemaFlag == 0){
                                if(file == null){
                                    layer.alert('图片信息不能存在空，' + temp + '失败！',{icon: 0,offset: clientHeight/5},
                                        function (){
                                            layer.close(layer.index);
                                        }
                                    );
                                }else{
                                    formData.append("cinemaName",cinema_name);
                                    formData.append("cinemaCity",cinema_city);
                                    formData.append("cinemaAddress",cinema_address);
                                    formData.append("file",file);
                                    //异步请求，传输数据为formData
                                    $.ajax({
                                        type:'post',
                                        url: tempurl,
                                        data: formData,
                                        processData: false,
                                        contentType: false,
                                        success:function (obj) {
                                            //code=0就说明添加成功了
                                            if(obj.code == 0){
                                                layer.alert(temp + '成功！',{icon: 0,offset: clientHeight/5},
                                                    function (){
                                                        layer.closeAll();
                                                        location.reload();
                                                    }
                                                );
                                            }else{
                                                //否则失败
                                                layer.alert(temp + '失败！',{icon: 0,offset: clientHeight/5},
                                                    function (){
                                                        layer.closeAll();
                                                    }
                                                );
                                            }
                                        }
                                    });
                                }
                            } else{
                                //无论file有没有上传，都应该传过去，让后端自己判断。
                                formData.append("cinemaId",cinema_id);
                                formData.append("cinemaName",cinema_name);
                                formData.append("cinemaCity",cinema_city);
                                formData.append("cinemaAddress",cinema_address);
                                formData.append("file",file);

                                $.ajax({
                                    type:'post',
                                    url: tempurl,
                                    data: formData,
                                    processData: false,
                                    contentType: false,
                                    success:function (obj) {
                                        //code=0成功
                                        if(obj.code == 0){
                                            layer.alert(temp + '成功！',{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                    location.reload();
                                                }
                                            );
                                        }else{
                                            layer.alert(temp + '失败！',{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                }
                                            );
                                        }
                                    }
                                });
                            }
                        }
                    }
                    ,btnAlign: 'c movie-last'
                    ,moveType: 0 //拖拽模式，0或者1
                    ,content: AddCinemasHtml
                    ,success: function(layero){
                        if(cinemaFlag == 1){
                            $.ajax({
                                type:'post',
                                url: "/cinema/findCinemaById",
                                dataType:'json',
                                data: {
                                    cinema_id: cinema_id
                                },
                                success:function (obj) {
                                    $('#cinema_name').val(obj.data.cinemaName);
                                    $('#cinema_city').val(obj.data.cinemaCity);
                                    $('#cinema_address').val(obj.data.cinemaAddress);
                                    $('#demo1').attr('src', obj.data.cinemaPoster);
                                }
                            });
                        }
                        layui.use('upload', function(){
                            var $ = layui.jquery
                                ,upload = layui.upload;
                            //普通图片上传，注意#file指的是上面定义的id为file的input按钮
                            var uploadInst = upload.render({
                                elem: '#file',
                                auto: false,
                                choose: function (obj) {
                                    //预读本地文件。
                                    //index 文件索引
                                    //file 文件对象
                                    //result 文件base64编码
                                    obj.preview(function (index, file, result) {
                                        //将base64编码放入到#demo1这个DOM对象里面
                                        $('#demo1').attr('src', result); //图片链接（base64）
                                    })
                                    //这一步是最重要的，这一步才赋值给file，让file通过json传到后台。
                                    file = $('#file')[0].files[0];
                                }
                            });
                        });
                    }
                });
            });
        }



        //电影院删除点击事件
        function rmCinemaConfirm(cinema_id){
            layui.use(['layer'], function(){
                var layer = layui.layer;
                layer.alert('确定要对id为“'+ cinema_id + '”的电影院进行删除操作吗？',{icon: 0,offset: clientHeight/5},
                    function () {
                        $.ajax({
                            type:'post',
                            url: "/cinema/rmCinema",
                            dataType:'json',
                            data: {
                                cinemaId: cinema_id,
                            },
                            success:function (date) {
                                if(date.code == 0){
                                    layer.alert('删除成功！',{icon: 0,offset: clientHeight/5},
                                        function (){
                                            layer.closeAll();
                                            location.reload();
                                        }
                                    );
                                }else{
                                    layer.alert('删除失败！',{icon: 0,offset: clientHeight/5},
                                        function (){
                                            layer.closeAll();
                                        }
                                    );
                                }
                            }
                        });
                    }
                );
            });
        }





        //初始化场次管理界面      (未完成)
        function initSchedule(){
            //场次列表
            layui.use(['table'], function(){
                var table = layui.table;
                table.render({
                    id: "ScheduleTable"
                    ,elem: '#schedule_table_id'
                    ,url: url + ''
                    ,method: 'post'
                    ,toolbar: '#scheduletoolbar'
                    ,title: '场次列表'
                    ,cols: [[
                        {field:'schedule_id', title:'ID', width:102, unresize: true, sort: true}
                        ,{field:'schedule_cinema', title:'电影院', width:270, unresize: true,sort: true}
                        ,{field:'schedule_hall', title:'放映厅', width:270, unresize: true, sort: true, edit: "text"}
                        ,{field:'schedule_startTime', title:'放映时间', width:270, unresize: true, sort: true, edit: "text"}
                        ,{field:'schedule_price', title:'售价', width:270, unresize: true, edit: "text"}
                        ,{title:'操作', width:300, unresize: true, align:'center', toolbar: '#schedulebar'}
                    ]]
                    ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                        ,curr: 1 //设定初始在第 1 页
                        ,groups: 5 //只显示 5 个连续页码
                        ,first: false //显示首页
                        ,last: false //显示尾页
                        ,limit: 10
                    }
                    ,response: {
                        statusCode: 0 //重新规定成功的状态码为 200，table 组件默认为 0
                    }
                    ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                        return {
                            "code": res.code, //解析接口状态
                            "msg": res.msg, //解析提示文本
                            "count": res.count, //解析数据长度
                            "data": res.data //解析数据列表
                        };
                    }
                });
                //监听工具条
                table.on('tool(ScheduleTable)', function(obj){
                    var data = obj.data;
                    if(obj.event === 'detail'){
                        layer.msg('ID：'+ data.schedule_id + '</br>电影院：'+ data.schedule_cinema + '</br>放映厅：'+ data.schedule_hall  + '</br>放映时间：'+ data.schedule_startTime + '</br>售价：' + data.schedule_price, {offset: clientHeight/5});
                    }
                    else if(obj.event === 'edit'){
                        layer.alert('确定要对id为“'+ JSON.stringify(data.schedule_id) + '”的场次修改进行保存吗？',{icon: 0,offset: clientHeight/5},
                            function () {
                                $.ajax({
                                    type:'post',
                                    url: url + "",
                                    dataType:'json',
                                    data: {
                                        schedule_id: data.schedule_id,
                                        schedule_cinema: data.schedule_cinema,
                                        schedule_hall: data.schedule_hall,
                                        schedule_startTime: data.schedule_startTime,
                                        schedule_price: data.schedule_price,
                                    },
                                    success:function (date) {
                                        if(date == "success"){
                                            layer.alert('修改成功！',{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                    location.reload();
                                                }
                                            );
                                        }else{
                                            layer.alert('修改失败！',{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                }
                                            );
                                        }
                                    }
                                });
                            }
                        );
                    }
                });
                //头工具栏事件
                table.on('toolbar(ScheduleTable)', function(obj){
                    var checkStatus = table.checkStatus(obj.config.id);
                    switch(obj.event){
                        case 'scheduleadd':
                            //示范一个公告层
                            layer.open({
                                type: 1
                                ,title: '添加场次' //不显示标题栏
                                ,closeBtn: false
                                ,area: '400px;'
                                ,shade: 0.8
                                ,offset: clientHeight/5
                                ,id: 'scheduleadd' //设定一个id，防止重复弹出
                                ,btn: ['确认添加', '取消']
                                ,yes: function(){
                                    var schedule_cinema = $('#schedule_cinema').val();;
                                        schedule_hall = $('#schedule_hall').val();
                                        schedule_startTime = $('#schedule_startTime').val();
                                        schedule_price = $('#schedule_price').val();
                                    if((schedule_cinema == "直接选择或搜索选择") || (schedule_hall == "直接选择或搜索选择") || (schedule_startTime == "") || (schedule_price =="")){
                                        layer.alert('添加信息不能存在空，添加失败！',{icon: 0,offset: clientHeight/5},
                                            function (){
                                                layer.close(layer.index);
                                            }
                                        );
                                    }
                                    else{
                                        layer.alert(schedule_cinema +'</br>'+ schedule_hall + '</br>'+ schedule_startTime + '</br>'+ schedule_price,{icon: 0,offset: clientHeight/5},
                                            function (){
                                                layer.close(layer.index);
                                            }
                                        );
                                        // $.ajax({
                                        //     type:'post',
                                        //     url: url + "",
                                        //     dataType:'json',
                                        //     data: {
                                        //         schedule_cinema:schedule_cinema,
                                        //         schedule_hall:schedule_hall,
                                        //         schedule_startTime:schedule_startTime,
                                        //         schedule_price:schedule_price,
                                        //     },
                                        //     success:function (date) {
                                        //         if(date == "success"){
                                        //             layer.alert('添加成功！',{icon: 0,offset: clientHeight/5},
                                        //                 function (){
                                        //                     layer.closeAll();
                                        //                     location.reload();
                                        //                 }
                                        //             );
                                        //         }else{
                                        //             layer.alert('添加失败！',{icon: 0,offset: clientHeight/5},
                                        //                 function (){
                                        //                     layer.closeAll();
                                        //                 }
                                        //             );
                                        //         }
                                        //     }
                                        // });
                                    }

                                }
                                ,btnAlign: 'c'
                                ,moveType: 1 //拖拽模式，0或者1
                                ,content: addScheduleContent
                                ,success: function(layero){
                                    layui.use(['form','laydate','layedit'], function(){
                                        var form = layui.form, 
                                        layedit = layui.layedit, 
                                        laydate = layui.laydate;
                                        laydate.render({
                                          elem: '#schedule_startTime'
                                          ,type: 'datetime'
                                          ,format:'yyyy-MM-dd HH:mm'
                                        });
                                        //form.render();
                                        form.render('select' ,'select');
                                    });
                                
                                    // layer._indexTemp = layer._indexTemp||{};
                                    // $(document).on('click','.layui-table-view .layui-select-title, .layui-layer-content .layui-select-title, .select_option_in_layer .layui-select-title'
                                    //     ,function (event){
                                    //     layui.stope(event);
                                    //     top.layer.close(top.layer._indexTemp['selectInTable']);
                                    //     var titleElem = $(this);
                                    //     if(!titleElem.parent().hasClass('layui-form-selected')){
                                    //         return;
                                    //     }
                                    //     var dlElem = titleElem.next();
                                    //     var titleElemPosition = getPostiton(titleElem);
                                    //     var topTemp = titleElemPosition.top + titleElem.outerHeight();
                                    //     var leftTemp = titleElemPosition.left;
                                    // });
                                }
                            });
                        break;
                    };
                });
            });
        }

        //初始化评论管理界面
        function initComment(){
            //评论列表
            layui.use('table', function(){
                var table = layui.table;
                table.render({
                    elem: '#comment_table_id'
                    ,url: url + '/comment/findAllCommentsPage'
                    ,method: 'post'
                    ,toolbar: '#commenttoolbar'
                    ,title: '订单列表'
                    ,cols: [[
                        {field:'comment_id', title:'评论编号', width:102, unresize: true, sort: true}
                        ,{field:'comment_user', title:'用户账号', width:100, unresize: true,templet: '<div>{{d.comment_user.user_name}}</div>'}
                        ,{field:'comment_time', title:'评论时间', width:180, unresize: true, sort: true}
                        ,{field:'comment_content', title:'评论内容', width:590, unresize: true, edit: "text"}
                        ,{title:'操作', width:240, unresize: true, align:'center', toolbar: '#commentbar'}
                    ]]
                    ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                        ,curr: 1 //设定初始在第 1 页
                        ,groups: 5 //只显示 5 个连续页码
                        ,first: false //显示首页
                        ,last: false //显示尾页
                        ,limits: [10,15,20]
                    }
                    ,response: {
                        statusCode: 0 //重新规定成功的状态码为 200，table 组件默认为 00
                    }
                    ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                        return {
                            "code": res.code, //解析接口状态
                            "msg": res.msg, //解析提示文本
                            "count": res.count, //解析数据长度
                            "data": res.data //解析数据列表
                        };
                    }
                });
                //监听工具条
                table.on('tool(CommentTable)', function(obj){
                    var data = obj.data;
                    if(obj.event === 'detail'){
                        layer.msg('ID：'+ data.comment_id + '</br>账号：'+ data.comment_user.user_name + '</br>时间：'+ data.comment_time  + '</br>内容：'+ data.comment_content, {offset: clientHeight/4});
                    }
                    else if(obj.event === 'edit'){
                        console.log(obj);
                        layer.alert('确定要对id为“'+ JSON.stringify(data.comment_id) + '”的评论内容修改进行保存吗？',{icon: 0,offset: clientHeight/5},
                            function () {
                                $.ajax({
                                    type:'post',
                                    url: url + "/comment/updateComment",
                                    dataType:'json',
                                    data: {
                                        comment_id: data.comment_id,
                                        comment_content: data.comment_content
                                    },
                                    success:function (date) {
                                        if(date.code == 0){
                                            layer.alert('修改成功！',{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                }
                                            );
                                        }else{
                                            layer.alert('修改失败！',{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                }
                                            );
                                        }
                                    }
                                });
                            }
                        );
                    }
                    else if(obj.event === 'delete'){
                        layer.alert('确定要对id为“'+ JSON.stringify(data.comment_id) + '”的评论进行删除吗？',{icon: 0,offset: clientHeight/5},
                            function () {
                                $.ajax({
                                    type:'post',
                                    url: url + "/comment/deleteComemnt",
                                    dataType:'json',
                                    data: {
                                        comment_id: data.comment_id,
                                    },
                                    success:function (date) {
                                        if(date.code == 0){
                                            layer.alert('删除成功！',{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                    location.reload();
                                                }
                                            );
                                        }else{
                                            layer.alert('删除失败！',{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                }
                                            );
                                        }
                                    }
                                });
                            }
                        );
                    }
                });
                //监听头工具条
                table.on('toolbar(CommentTable)', function(obj){
                    var checkStatus = table.checkStatus(obj.config.id);
                    switch(obj.event){
                        case 'findcommentbtn':
                            var user_name = $('#commentfindtext').val();
                            table.reload('comment_table_id', {
                                url: url + '/comment/findCommentsByUserName'
                                ,method: "POST"
                                ,where: {
                                    user_name: user_name
                                }
                                ,page: {
                                    curr: 1 //重新从第 1 页开始
                                }
                            });
                        break;
                        case 'findcommentall':
                            table.render({
                                elem: '#comment_table_id'
                                ,url: url + '/comment/findAllCommentsPage'
                                ,method: 'post'
                                ,toolbar: '#commenttoolbar'
                                ,title: '订单列表'
                                ,cols: [[
                                    {field:'comment_id', title:'评论编号', width:102, unresize: true, sort: true}
                                    ,{field:'comment_user', title:'用户账号', width:100, unresize: true,templet: '<div>{{d.comment_user.user_name}}</div>'}
                                    ,{field:'comment_time', title:'评论时间', width:180, unresize: true, sort: true}
                                    ,{field:'comment_content', title:'评论内容', width:590, unresize: true, edit: "text"}
                                    ,{title:'操作', width:240, unresize: true, align:'center', toolbar: '#commentbar'}
                                ]]
                                ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                                    ,curr: 1 //设定初始在第 1 页
                                    ,groups: 5 //只显示 5 个连续页码
                                    ,first: false //显示首页
                                    ,last: false //显示尾页
                                    ,limits: [10,15,20]
                                }
                                ,response: {
                                    statusCode: 0 //重新规定成功的状态码为 200，table 组件默认为 00
                                }
                                ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                                    return {
                                        "code": res.code, //解析接口状态
                                        "msg": res.msg, //解析提示文本
                                        "count": res.count, //解析数据长度
                                        "data": res.data //解析数据列表
                                    };
                                }
                            });
                        break;
                    };
                });
            });
        }

        //初始化订单管理界面
        function initTicket(){
            var PageStatus=0;
            var actionUrl = "";
            //订单列表
            layui.use('table', function(){
                var table = layui.table;
                table.render({
                    elem: '#ticket_table_id'
                    ,url: url + "/order/findAllOrdersPage"
                    ,method: 'post'
                    ,toolbar: '#tickettoolbar'
                    ,title: '订单列表'
                    ,cols: [[
                        {field:'order_id', title:'订单编号', width:160,unresize:true,sort: true,fixed:'left'}
                        ,{field:'order_user', title:'用户账号', width:100, unresize: true,templet:'<div>{{d.order_user.user_name}}</div>'}
                        ,{field:'order_schedule', title:'场次', width:180, unresize: true,templet:'<div>{{d.order_schedule.schedule_startTime}}</div>'}
                        ,{field:'order_position',title:'位置',width:100,unresize:true}                       
                        ,{field:'order_schedule',title:'价格',width:80,unresize:true,templet:'<div>￥{{d.order_schedule.schedule_price}}</div>'}
                        ,{field:'order_schedule',title:'电影',width:240,unresize:true,templet:'<div>{{d.order_schedule.schedule_movie.movie_cn_name}}</div>'}
                        ,{field:'order_schedule', title:'影厅', width:100, unresize: true, templet:'<div>{{d.order_schedule.schedule_hall.hall_name}}</div>'}
                        ,{field:'order_schedule',title:'影院',width:240,unresize:true,templet:'<div>{{d.order_schedule.schedule_hall.hall_cinema.cinema_name}}</div>'}
                        ,{field:'order_state',title:'订单状态',width:100,unresize:true,align:'center',templet:function(d){if(d.order_state == 1) return '<div style="color:#337ab7">完成</div>';else if(d.order_state == 0) return '<div style="color:#ef4238">申请退票</div>';else return '<div style="color:#5cb85c">已退票</div>';}}
                        ,{title:'操作', width:100, unresize: true, align:'center', toolbar: '#ticketbar'}
                    ]]
                    ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                        ,curr: 1 //设定初始在第 1 页
                        ,groups: 5 //只显示 5 个连续页码
                        ,first: false //显示首页
                        ,last: false //显示尾页
                        ,limits: [10,15,20]
                    }
                    ,response: {
                        statusCode: 0 //重新规定成功的状态码为 200，table 组件默认为 0
                    }
                    ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                        return {
                            "code": res.code, //解析接口状态
                            "msg": res.msg, //解析提示文本
                            "count": res.count, //解析数据长度
                            "data": res.data //解析数据列表
                        };
                    },
                });
              
                //监听工具条
                table.on('tool(TicketTable)', function(obj){
                    var data = obj.data;
                    if(obj.event === 'detail'){
                        layer.msg('订单编号：'+ data.order_id + '&nbsp;&nbsp;&nbsp;用户：' + data.order_user.user_name + '<br>场次：'+ data.order_schedule.schedule_startTime + '&nbsp;&nbsp;&nbsp;位置：' + data.order_position + '<br>电影：《' + data.order_schedule.schedule_movie.movie_cn_name + '》&nbsp;&nbsp;&nbsp;价格：￥' + data.order_schedule.schedule_price + '<br>影院：'+ data.order_schedule.schedule_hall.hall_cinema.cinema_name + '&nbsp;&nbsp;&nbsp;影厅：' + data.order_schedule.schedule_hall.hall_name, {offset: clientHeight/4,area:['400px','140px']});
                    }
                    else if(obj.event === 'pass'){
                        layer.alert('确定要通过订单编号为“' + data.order_id + '”的退票申请吗？',{icon: 0,offset: clientHeight/5},
                            function () {
                                $.ajax({
                                    type:'post',
                                    url: url + "/order/agreeForRefund",
                                    dataType:'json',
                                    data: {
                                        order_id: data.order_id
                                    },
                                    success:function (data) {
                                        if(data.code == 0){
                                            layer.alert(data.msg,{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                    location.reload();
                                                }
                                            );
                                        }else{
                                            layer.alert(data.msg,{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                }
                                            );
                                        }
                                    }
                                });
                            }
                        );
                    }
                });
                //监听头工具条
                table.on('toolbar(TicketTable)', function(obj){
                    var checkStatus = table.checkStatus(obj.config.id);
                    var changeticketbtn = $('.changeticketBtn');
                    var ticketfindtext = $('#ticketfindtext');
                    switch(obj.event){
                        case 'findticketbtn':
                            var url_temp;
                            var find_temp = $('#ticketfindtext').val();
                            find_temp = find_temp.toString();
                            //订单管理
                            if(PageStatus == 0){
                                if(changeticketbtn.val()=="订单编号"){
                                    url_temp = '/order/findOrderById';
                                    table.reload('ticket_table_id', {
                                        url: url + url_temp
                                        ,method: "POST"
                                        ,where: {
                                            order_id: find_temp
                                        }
                                        ,page: {
                                            curr: 1 //重新从第 1 页开始
                                        }
                                    });
                                }
                                else{
                                    url_temp = '/order/findOrderByUserName';
                                    table.reload('ticket_table_id', {
                                        url: url + url_temp
                                        ,method: "POST"
                                        ,where: {
                                            user_name: find_temp
                                        }
                                        ,page: {
                                            curr: 1 //重新从第 1 页开始
                                        }
                                    });
                                }
                            }
                            //退票审核
                            else{
                                if(changeticketbtn.val()=="订单编号"){
                                    url_temp = '/order/findOrderById';
                                    table.reload('ticket_table_id', {
                                        url: url + url_temp
                                        ,method: "POST"
                                        ,where: {
                                            order_id: find_temp
                                        }
                                        ,page: {
                                            curr: 1 //重新从第 1 页开始
                                        }
                                    });
                                }
                                else{
                                    url_temp = '/order/findRefundOrderByUser';
                                    table.reload('ticket_table_id', {
                                        url: url + url_temp
                                        ,method: "POST"
                                        ,where: {
                                            user_name: find_temp
                                        }
                                        ,page: {
                                            curr: 1 //重新从第 1 页开始
                                        }
                                    });
                                }
                            }
                        break;
                        case 'changeticketbtn':
                            if(changeticketbtn.val()=="订单编号"){
                                changeticketbtn.val("用户帐号");
                                ticketfindtext.attr("placeholder","请输入用户帐号");
                            }
                            else{
                                changeticketbtn.val("订单编号");
                                ticketfindtext.attr("placeholder","请输入订单编号");
                            }
                        break;
                        case 'findorderall':
                            PageStatus = 0;
                            table.render({
                                elem: '#ticket_table_id'
                                ,url: url + "/order/findAllOrdersPage"
                                ,method: 'post'
                                ,toolbar: '#tickettoolbar'
                                ,title: '订单列表'
                                ,cols: [[
                                    {field:'order_id', title:'订单编号', width:160,unresize:true,sort: true,fixed:'left'}
                                    ,{field:'order_user', title:'用户账号', width:100, unresize: true,templet:'<div>{{d.order_user.user_name}}</div>'}
                                    ,{field:'order_schedule', title:'场次', width:180, unresize: true,templet:'<div>{{d.order_schedule.schedule_startTime}}</div>'}
                                    ,{field:'order_position',title:'位置',width:100,unresize:true}                       
                                    ,{field:'order_schedule',title:'价格',width:80,unresize:true,templet:'<div>￥{{d.order_schedule.schedule_price}}</div>'}
                                    ,{field:'order_schedule',title:'电影',width:240,unresize:true,templet:'<div>{{d.order_schedule.schedule_movie.movie_cn_name}}</div>'}
                                    ,{field:'order_schedule', title:'影厅', width:100, unresize: true, templet:'<div>{{d.order_schedule.schedule_hall.hall_name}}</div>'}
                                    ,{field:'order_schedule',title:'影院',width:240,unresize:true,templet:'<div>{{d.order_schedule.schedule_hall.hall_cinema.cinema_name}}</div>'}
                                    ,{field:'order_state',title:'订单状态',width:100,unresize:true,align:'center',templet:function(d){if(d.order_state == 1) return '<div style="color:#337ab7">完成</div>';else if(d.order_state == 0) return '<div style="color:#ef4238">申请退票</div>';else return '<div style="color:#5cb85c">已退票</div>';}}
                                    ,{title:'操作', width:100, unresize: true, align:'center', toolbar: '#ticketbar'}
                                ]]
                                ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                                    ,curr: 1 //设定初始在第 1 页
                                    ,groups: 5 //只显示 5 个连续页码
                                    ,first: false //显示首页
                                    ,last: false //显示尾页
                                    ,limits: [10,15,20]
                                }
                                ,response: {
                                    statusCode: 0 //重新规定成功的状态码为 200，table 组件默认为 0
                                }
                                ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                                    return {
                                        "code": res.code, //解析接口状态
                                        "msg": res.msg, //解析提示文本
                                        "count": res.count, //解析数据长度
                                        "data": res.data //解析数据列表
                                    };
                                },
                            });
                        break;
                        case 'backorderbtn':
                            PageStatus = 1;
                            table.render({
                                elem: '#ticket_table_id'
                                ,url: url + "/order/findAllRefundOrder"
                                ,method: 'post'
                                ,toolbar: '#tickettoolbar'
                                ,title: '订单列表'
                                ,cols: [[
                                    {field:'order_id', title:'订单编号', width:160,unresize:true,sort: true,fixed:'left'}
                                    ,{field:'order_user', title:'用户账号', width:100, unresize: true,templet:'<div>{{d.order_user.user_name}}</div>'}
                                    ,{field:'order_schedule', title:'场次', width:180, unresize: true,templet:'<div>{{d.order_schedule.schedule_startTime}}</div>'}
                                    ,{field:'order_position',title:'位置',width:100,unresize:true}                       
                                    ,{field:'order_schedule',title:'价格',width:80,unresize:true,templet:'<div>￥{{d.order_schedule.schedule_price}}</div>'}
                                    ,{field:'order_schedule',title:'电影',width:240,unresize:true,templet:'<div>{{d.order_schedule.schedule_movie.movie_cn_name}}</div>'}
                                    ,{field:'order_schedule', title:'影厅', width:100, unresize: true, templet:'<div>{{d.order_schedule.schedule_hall.hall_name}}</div>'}
                                    ,{field:'order_schedule',title:'影院',width:240,unresize:true,templet:'<div>{{d.order_schedule.schedule_hall.hall_cinema.cinema_name}}</div>'}
                                    ,{field:'order_state',title:'订单状态',width:100,unresize:true,align:'center',templet:function(d){if(d.order_state == 1) return '<div style="color:#337ab7">完成</div>';else if(d.order_state == 0) return '<div style="color:#ef4238">申请退票</div>';else return '<div style="color:#5cb85c">已退票</div>';}}
                                    ,{title:'操作', width:200, unresize: true, align:'center', toolbar: '#backticketbar'}
                                ]]
                                ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                                    ,curr: 1 //设定初始在第 1 页
                                    ,groups: 5 //只显示 5 个连续页码
                                    ,first: false //显示首页
                                    ,last: false //显示尾页
                                    ,limits: [10,15,20]
                                }
                                ,response: {
                                    statusCode: 0 //重新规定成功的状态码为 200，table 组件默认为 0
                                }
                                ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                                    return {
                                        "code": res.code, //解析接口状态
                                        "msg": res.msg, //解析提示文本
                                        "count": res.count, //解析数据长度
                                        "data": res.data //解析数据列表
                                    };
                                },
                            });
                        break;
                    };
                });
            });
        }

         //初始化场次管理界面
         function initSchedule(){
            var ScheduleStatus=0; //0：上映      1：下架
            //场次列表
            layui.use(['table','form'], function(){
                var table = layui.table;
                var form = layui.form;
                table.render({
                    elem: '#schedule_table_id'
                    ,url: url + '/schedule/findAllScheduleByState'
                    ,method: 'post'
                    ,where: {"schedule_state": 1}
                    ,toolbar: '#scheduletoolbar'
                    ,title: '场次列表'
                    ,cols: [[
                        {field:'schedule_id', title:'场次编号', width:100, unresize: true, sort: true}
                        ,{field:'schedule_hall', title:'影院', width:240, unresize: true,templet:'<div>{{d.schedule_hall.hall_cinema.cinema_name}}</div>'}
                        ,{field:'schedule_hall', title:'影院地址', width:300, unresize: true,templet:'<div>{{d.schedule_hall.hall_cinema.cinema_address}}</div>'}
                        ,{field:'schedule_hall', title:'影厅', width:100, unresize: true, templet:'<div>{{d.schedule_hall.hall_name}}</div>'}
                        ,{field:'schedule_movie', title:'电影', width:240, unresize: true,templet:'<div>{{d.schedule_movie.movie_cn_name}}</div>'}
                        ,{field:'schedule_startTime', title:'放映时间', width:180, unresize: true, sort: true}
                        ,{field:'schedule_price', title:'价格(￥)', width:100,align:'center', unresize: true}
                        ,{field:'orderList',title:'订单数量',width:100,unresize:true,align:'center',templet:'<div>{{d.orderList.length}}</div>'}
                        ,{field:'schedule_remain',title:'剩余票数',width:100,align:'center',unresize:true}
                        ,{field:'orderList',title:'场次收入(￥)',width:120,align:'center',unresize:true,templet:'<div>{{d.orderList.length * d.schedule_price}}</div>'}
                        ,{title:'操作', width:200, unresize: true, align:'center', toolbar: '#schedulebar'}
                    ]]
                    ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                        ,curr: 1 //设定初始在第 1 页
                        ,groups: 5 //只显示 5 个连续页码
                        ,first: false //显示首页
                        ,last: false //显示尾页
                        ,limits: [10,15,20]
                    }
                    ,response: {
                        statusCode: 0 //重新规定成功的状态码为 200，table 组件默认为 0
                    }
                    ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                        return {
                            "code": res.code, //解析接口状态
                            "msg": res.msg, //解析提示文本
                            "count": res.count, //解析数据长度
                            "data": res.data, //解析数据列表
                        };
                    }
                });
                //监听工具条
                table.on('tool(ScheduleTable)', function(obj){
                    var data = obj.data;
                    if(obj.event === 'detail'){
                        console.log(obj);
                        layer.msg('编号：'+ data.schedule_id + '</br>影院：'+ data.schedule_hall.hall_cinema.cinema_name + '&nbsp;&nbsp;&nbsp;放映厅：'+ data.schedule_hall.hall_name  + '</br>影院地址：'+ data.schedule_hall.hall_cinema.cinema_address + '</br>电影：'+ data.schedule_movie.movie_cn_name + '</br>场次：' + data.schedule_startTime + '&nbsp;&nbsp;&nbsp;价格：' + data.schedule_price, {offset: clientHeight/5});
                    }
                    else if(obj.event === 'edit'){
                        layer.alert('确定要对id为“'+ data.schedule_id + '”的场次进行下架吗？',{icon: 0,offset: clientHeight/5},
                            function () {
                                $.ajax({
                                    type:'post',
                                    url: url + "/schedule/offlineSchedule",
                                    dataType:'json',
                                    data: {
                                        schedule_id: data.schedule_id,
                                    },
                                    success:function (result) {
                                        console.log(data.schedule_id);
                                        if(result.code == 0){
                                            layer.alert(result.mgs,{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                    location.reload();
                                                }
                                            );
                                        }else{
                                            layer.alert(result.mgs,{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                }
                                            );
                                        }
                                    }
                                });
                            }
                        );
                    }
                });
                //头工具栏事件
                table.on('toolbar(ScheduleTable)', function(obj){
                    var checkStatus = table.checkStatus(obj.config.id);
                    switch(obj.event){
                        case 'scheduleadd':
                            //示范一个公告层
                            layer.open({
                                type: 1
                                ,title: '添加场次' //不显示标题栏
                                ,closeBtn: false
                                ,area: '400px;'
                                ,shade: 0.8
                                ,offset: clientHeight/10
                                ,id: 'scheduleadd' //设定一个id，防止重复弹出
                                ,btn: ['确认添加', '取消']
                                ,yes: function(){
                                    console.log("queding");
                                    var select_movie_name = $('#select_movie_name').val();
                                    var select_cinema_name = $("#select_cinema_name").val();
                                    var select_schedule_hall = $('#select_schedule_hall').val();
                                    var schedule_startTime_Text = $("#schedule_startTime_Text").val();
                                    var schedule_price_Text = $('#schedule_price_Text').val();
                                    if((select_movie_name == "选择电影") || (select_cinema_name == "选择影院") || (select_schedule_hall == "选择放映厅") ||
                                        (schedule_startTime_Text =="") || (schedule_price_Text =="")){
                                        layer.alert('添加信息不能存在空，添加失败！',{icon: 0,offset: clientHeight/5},
                                            function (){
                                                layer.close(layer.index);
                                            }
                                        );
                                    }
                                    else{
                                        $.ajax({
                                            type:'post',
                                            url: url + "/schedule/addSchedule",
                                            dataType:'json',
                                            data: {
                                                movie_name: select_movie_name,
                                                cinema_name: select_cinema_name,
                                                hall_name: select_schedule_hall,
                                                schedule_startTime: schedule_startTime_Text,
                                                schedule_price: schedule_price_Text,
                                            },
                                            success:function (result) {
                                                if(result.code == 0){
                                                    layer.alert(result.mgs,{icon: 0,offset: clientHeight/5},
                                                        function (){
                                                            layer.closeAll();
                                                            location.reload();
                                                        }
                                                    );
                                                }else{
                                                    layer.alert(result.mgs,{icon: 0,offset: clientHeight/5},
                                                        function (){
                                                            layer.closeAll();
                                                        }
                                                    );
                                                }
                                            }
                                        });
                                    }
                                }
                                ,end: function(){
                                    cinemaJsonArr = [];
                                }
                                ,btnAlign: 'c'
                                ,moveType: 1 //拖拽模式，0或者1
                                ,content: addScheduleContent
                                ,success: function(layero){
                                    layui.use(['form','laydate','layedit'], function(){
                                        var form = layui.form, 
                                        layedit = layui.layedit, 
                                        laydate = layui.laydate;
                                        laydate.render({
                                          elem: '#schedule_startTime_Text'
                                          ,type: 'datetime'
                                          ,format:'yyyy-MM-dd HH:mm'
                                        });
                                        form.render('select' ,'select');
                                    });
                                    $.ajax({
                                        type:'post',
                                        url: url + "/schedule/findAllSchedule",
                                        dataType:'json',
                                        data: {},
                                        success:function (objs) {
                                            movieArr = objs.movieName;
                                            cinemaArr = objs.cinema;
                                            //解析json数组 简化
                                            for(var i = 0;i < cinemaArr.length;i++){
                                                var cinemaJson = {};
                                                for(var key in cinemaArr[i]){
                                                    var cinemaName = key; 
                                                    var hallArr = [];
                                                    for(var j = 0;j < cinemaArr[i][key].length; j++){
                                                        hallArr.push(cinemaArr[i][key][j].hall_name);
                                                    }
                                                    cinemaJson.cinema = key;
                                                    cinemaJson.hallArr = hallArr;
                                                }
                                                cinemaJsonArr.push(cinemaJson);
                                            }

                                            console.log(cinemaJsonArr);
                                            for(var i=0;i<movieArr.length;i++){
                                               $("#select_movie_name").append(new Option(movieArr[i]));
                                               layui.form.render("select");
                                            }

                                            for(var i=0;i<cinemaJsonArr.length;i++){
                                                $("#select_cinema_name").append(new Option(cinemaJsonArr[i].cinema));
                                                layui.form.render("select");
                                            }
                                        }
                                    });
                                }
                            });
                        break;
                        case 'findschedulebtn':
                            var find_temp = $('#scheduletext').val();
                            //上映
                            if(ScheduleStatus==0){
                                table.reload('schedule_table_id', {
                                    url: url + "/schedule/findScheduleByMovieName"
                                    ,method: "POST"
                                    ,where: {
                                        movie_name: find_temp
                                    }
                                    ,page: {
                                        curr: 1 //重新从第 1 页开始
                                    }
                                });
                            }
                            //下架
                            else{
                                table.reload('schedule_table_id', {
                                    url: url + "/schedule/findOffScheduleByMovieName"
                                    ,method: "POST"
                                    ,where: {
                                        movie_name: find_temp
                                    }
                                    ,page: {
                                        curr: 1 //重新从第 1 页开始
                                    }
                                });
                            }
                        break;
                        case 'scheduleonallbtn':
                            ScheduleStatus = 0;
                            table.render({
                                elem: '#schedule_table_id'
                                ,url: url + '/schedule/findAllScheduleByState'
                                ,method: 'post'
                                ,where: {"schedule_state": 1}
                                ,toolbar: '#scheduletoolbar'
                                ,title: '场次列表'
                                ,cols: [[
                                    {field:'schedule_id', title:'场次编号', width:100, unresize: true, sort: true}
                                    ,{field:'schedule_hall', title:'影院', width:240, unresize: true,templet:'<div>{{d.schedule_hall.hall_cinema.cinema_name}}</div>'}
                                    ,{field:'schedule_hall', title:'影院地址', width:300, unresize: true,templet:'<div>{{d.schedule_hall.hall_cinema.cinema_address}}</div>'}
                                    ,{field:'schedule_hall', title:'影厅', width:100, unresize: true, templet:'<div>{{d.schedule_hall.hall_name}}</div>'}
                                    ,{field:'schedule_movie', title:'电影', width:240, unresize: true,templet:'<div>{{d.schedule_movie.movie_cn_name}}</div>'}
                                    ,{field:'schedule_startTime', title:'放映时间', width:180, unresize: true, sort: true}
                                    ,{field:'schedule_price', title:'价格(￥)', width:100,align:'center', unresize: true}
                                    ,{field:'orderList',title:'订单数量',width:100,unresize:true,align:'center',templet:'<div>{{d.orderList.length}}</div>'}
                                    ,{field:'schedule_remain',title:'剩余票数',width:100,align:'center',unresize:true}
                                    ,{field:'orderList',title:'场次收入(￥)',width:120,align:'center',unresize:true,templet:'<div>{{d.orderList.length * d.schedule_price}}</div>'}
                                    ,{title:'操作', width:200, unresize: true, align:'center', toolbar: '#schedulebar'}
                                ]]
                                ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                                    ,curr: 1 //设定初始在第 1 页
                                    ,groups: 5 //只显示 5 个连续页码
                                    ,first: false //显示首页
                                    ,last: false //显示尾页
                                    ,limits: [10,15,20]
                                }
                                ,response: {
                                    statusCode: 0 //重新规定成功的状态码为 200，table 组件默认为 0
                                }
                                ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                                    return {
                                        "code": res.code, //解析接口状态
                                        "msg": res.msg, //解析提示文本
                                        "count": res.count, //解析数据长度
                                        "data": res.data, //解析数据列表
                                        "income": res.income //解析数据列表
                                    };
                                }
                            });
                        break;
                        case 'scheduledownallbtn':
                            ScheduleStatus = 1;
                            table.render({
                                elem: '#schedule_table_id'
                                ,url: url + '/schedule/findAllScheduleByState'
                                ,method: 'post'
                                ,where: {"schedule_state": 0}
                                ,toolbar: '#scheduletoolbar'
                                ,title: '场次列表'
                                ,cols: [[
                                    {field:'schedule_id', title:'场次编号', width:100, unresize: true, sort: true}
                                    ,{field:'schedule_hall', title:'影院', width:240, unresize: true,templet:'<div>{{d.schedule_hall.hall_cinema.cinema_name}}</div>'}
                                    ,{field:'schedule_hall', title:'影院地址', width:300, unresize: true,templet:'<div>{{d.schedule_hall.hall_cinema.cinema_address}}</div>'}
                                    ,{field:'schedule_hall', title:'影厅', width:100, unresize: true, templet:'<div>{{d.schedule_hall.hall_name}}</div>'}
                                    ,{field:'schedule_movie', title:'电影', width:240, unresize: true,templet:'<div>{{d.schedule_movie.movie_cn_name}}</div>'}
                                    ,{field:'schedule_startTime', title:'放映时间', width:180, unresize: true, sort: true}
                                    ,{field:'schedule_price', title:'价格(￥)', width:100,align:'center', unresize: true}
                                    ,{field:'orderList',title:'订单数量',width:100,unresize:true,align:'center',templet:'<div>{{d.orderList.length}}</div>'}
                                    ,{field:'schedule_remain',title:'剩余票数',width:100,align:'center',unresize:true}
                                    ,{field:'orderList',title:'场次收入(￥)',width:120,align:'center',unresize:true,templet:'<div>{{d.orderList.length * d.schedule_price}}</div>'}
                                    ,{title:'操作', width:200, unresize: true, align:'center', toolbar: '#scheduledownbar'}
                                ]]
                                ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                                    ,curr: 1 //设定初始在第 1 页
                                    ,groups: 5 //只显示 5 个连续页码
                                    ,first: false //显示首页
                                    ,last: false //显示尾页
                                    ,limits: [10,15,20]
                                }
                                ,response: {
                                    statusCode: 0 //重新规定成功的状态码为 200，table 组件默认为 0
                                }
                                ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                                    return {
                                        "code": res.code, //解析接口状态
                                        "msg": res.msg, //解析提示文本
                                        "count": res.count, //解析数据长度
                                        "data": res.data, //解析数据列表
                                        "income": res.income //解析数据列表
                                    };
                                }
                            });
                        break;
                    };
                });
                //监听影院二级联动
                form.on('select(selectCinema)',function(data){
                    $("#select_schedule_hall").empty();
                    layui.form.render("select");
                    for(var i = 0;i < cinemaJsonArr.length;i++){
                        if(cinemaJsonArr[i].cinema == data.value){
                            for(var j=0;j<cinemaJsonArr[i].hallArr.length;j++){
                                $("#select_schedule_hall").append(new Option(cinemaJsonArr[i].hallArr[j]));
                                layui.form.render("select");
                            }
                        }
                    }
                });
            });
        }

        function sortUp(a,b){
                return a-b;
         }
         //初始化票房统计界面
        function initBoxOffice(){
            $.ajax({
                type:'post',
                url: "/movie/findAllMovies",
                dataType:'json',
                data: {},
                //获取数据  根据类型：统计票房   type:['喜剧','动作','爱情','动画','科幻','惊悚','冒险','犯罪','悬疑'] typeIncome: []  场次管理接口 下架之后数据更新    //头像为null时 默认设置为某一张 
                success:function (obj) {
                    if(obj.sort.length > 10){
                        obj.sort.length = 10;
                    }
                    for(var i = obj.sort.length - 1;i >= 0;i--){
                        movieArray.push(obj.sort[i].movie_cn_name);
                        boxOffice.push(Math.ceil(obj.sort[i].movie_boxOffice * 10000));
                    }
                    for(var i = 0;i < obj.type.length;i++){
                        var typeJson = {};
                        for(var key in obj.type[i]){
                            movieType.push(key);
                            movieTypeBoxOffice.push(obj.type[i][key]);
                            var num = parseFloat(obj.type[i][key]);
                            typeJson.value = Math.ceil(num * 10000);
                            typeJson.name = key;
                        }
                        type.push(typeJson);
                    }
                    console.log(movieArray);
                    console.log(boxOffice);
                     //扇形图
                    var aaa = $("#aaa");
                    aaa.append("<div id=\"main1\" style=\"width: 1100px;height:400px;\"></div>")
                    var myChart1 = echarts.init(document.getElementById('main1'));   
                    option1 = {
                        title : {
                            text: '类型统计',
                            x:'center'
                        },
                        tooltip : {
                            trigger: 'item',
                            formatter: "{a} <br/>{b} : {c} ({d}%)"
                        },
                        color: ['#6dd8da', '#b6a2de', '#58afed', '#9AC0CD','#ff99cc'],
                        legend: {
                            orient : 'vertical',
                            x : '10%',
                            y : '15%',
                            data:movieType
                        },
                        toolbox: {
                            show : true,
                            feature : {
                                mark : {show: true},
                                dataView : {show: true, readOnly: false},
                                magicType : {
                                    show: true, 
                                    type: ['pie', 'funnel'],
                                    option: {
                                        funnel: {
                                            x: '25%',
                                            width: '50%',
                                            funnelAlign: 'left',
                                            max: 1548
                                        }
                                    }
                                },
                                restore : {show: true},
                                saveAsImage : {show: true}
                            }
                        },
                        calculable : true,
                        series : [
                            {
                                name:'类型，票房',
                                type:'pie',
                                radius : '60%',
                                center: ['50%', '50%'],
                                data: type,
                            }
                        ]
                    };
                    myChart1.setOption(option1);

                    //统计图
                    var aaa = $("#aaa");
                    aaa.append("<div id=\"main2\" style=\"width: 1200px;height:450px;margin-top:100px;\"></div>")
                    var myChart2 = echarts.init(document.getElementById('main2'));  
                    option2 = {
                        title : {
                            text: '电影票房排名',
                            subtext: '排行前十'
                        },
                        tooltip : {
                            trigger: 'axis'
                        },
                        legend: {
                            data:['总体票房']
                        },
                        toolbox: {
                            show : true,
                            feature : {
                                mark : {show: true},
                                dataView : {show: true, readOnly: false},
                                magicType: {show: true, type: ['line', 'bar']},
                                restore : {show: true},
                                saveAsImage : {show: true}
                            }
                        },
                        calculable : true,
                        xAxis : [
                            {
                                type : 'value',
                                boundaryGap : [0, 0.01]
                            }
                        ],
                        
                        yAxis : [
                            {
                                type : 'category',
                                data : movieArray,
                            }
                        ],
                        series : [
                            {
                                name:'总体票房',
                                type:'bar',
                                data: boxOffice,
                                color:'#11EEC2'
                            },
                        ]
                    };
                    myChart2.setOption(option2);
                }
            });
        }

    </script>
    <!-- ------------------------------------------------------------------- -->
</body>
</html>