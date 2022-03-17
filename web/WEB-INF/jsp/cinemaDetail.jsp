<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link href="../static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../static/bootstrap/css/bootstrap.css" rel="stylesheet">
    <script src="../static/bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="../static/bootstrap/js/bootstrap.min.js"></script>

    <link rel="icon" type="image/x-icon" href="../static/images/logo.ico"/>
    <link rel="stylesheet" type="text/css" href="../static/css/header.css">
    <link rel="stylesheet" type="text/css" href="../static/css/main.css">
    <link rel="stylesheet" type="text/css" href="../static/css/footer.css">
    <link rel="stylesheet" type="text/css" href="../static/css/buyTickets.css">
    <link rel="stylesheet" type="text/css" href="../static/css/movieDetail.css">
    <script src="../static/js/header.js" charset="utf-8"></script>
    <script src="../static/js/Api.js"></script>

    <script src="../static/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
    <title>电影系统-电影院详细</title>
</head>
<body>
<!-- ------------------------------------------------------------------- -->
<!-- 导航栏 -->
<jsp:include page="header.jsp"/>

<!-- 占位符 -->
<div style="margin-top: 80px;"></div>

<!-- 巨幕 -->
<div class="banner2">
    <div class="wrapper clearfix">
        <div class="celeInfo-left">
            <div class="avatar-shadow">
                <!-- 图片 -->
            </div>
        </div>

        <div class="celeInfo-right clearfix">
            <div class="movie-brief-container">
                <!-- 上 -->
            </div>
        </div>
    </div>
</div>

<!-- 占位符 -->
<div style="margin-top: 50px;"></div>


<!-- 脚 -->
<jsp:include page="footer.jsp"/>

<!-- ------------------------------------------------------------------- -->
<script>
    var clientHeight = document.documentElement.clientHeight;
    var cinema_id;

    window.onload = function(){
        initHeader();
        initBanner(); //巨幕
    }


    //初始化巨幕
    function initBanner(){
        cinema_id = getUrlParams('cinema_id');
        var avatar = $(".avatar-shadow");
        var movieBriefContainer = $(".movie-brief-container");

        $.ajax({
            type:'post',
            url: "/cinema/findCinemaById",
            dataType:'json',
            data: {
                cinema_id: cinema_id
            },
            success: function (obj) {
                //电影院图片
                avatar.append("<img class=\"avatar\" src=\"" + obj.data.cinemaPoster + "\" alt=\"\">");
                movieBriefContainer.append(
                    "<h3 class=\"name\">" + obj.data.cinemaName + "</h3>" +
                    "<div class=\"ename ellipsis\">" + obj.data.cinemaCity + "</div>" +
                    "<div class=\"ename ellipsis\">" + obj.data.cinemaAddress + "</div>"
                );
            }
        });
    }

    //获取url参数
    function getUrlParams(name) { // 不传name返回所有值，否则返回对应值
        var url = window.location.search;
        if (url.indexOf('?') == 1) { return false; }
        url = url.substr(1);
        url = url.split('&');
        var name = name || '';
        var nameres;
        // 获取全部参数及其值
        for(var i=0;i<url.length;i++) {
            var info = url[i].split('=');
            var obj = {};
            obj[info[0]] = decodeURI(info[1]);
            url[i] = obj;
        }
        // 如果传入一个参数名称，就匹配其值
        if (name) {
            for(var i=0;i<url.length;i++) {
                for (const key in url[i]) {
                    if (key == name) {
                        nameres = url[i][key];
                    }
                }
            }
        } else {
            nameres = url;
        }
        // 返回结果
        return nameres;
    }

</script>
<!-- ------------------------------------------------------------------- -->

</body>
</html>