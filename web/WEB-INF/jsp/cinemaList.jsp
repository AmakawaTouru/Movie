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
    <link rel="stylesheet" type="text/css" href="../static/css/movieList.css">
    <link rel="stylesheet" type="text/css" href="../static/css/footer.css">
    <script src="../static/js/header.js" charset="utf-8"></script>
    <script src="../static/js/Api.js"></script>

    <script src="../static/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
    <title>电影系统-电影院列表</title>
</head>
<body>
<!-- ------------------------------------------------------------------- -->
<!-- 导航栏 -->
<jsp:include page="header.jsp"/>


<!-- 占位符 -->
<div style="margin-top: 80px;"></div>

<!-- 副导航栏 -->
<ul class="layui-nav fu-nav">
    <div id="yui"></div>
    <li class="layui-nav-item" id="now"><a>热门电影院</a></li>
</ul>

<!-- 主体 -->
<div class="main">
    <div class="main-Tagsz main-inner movieList">

        <div class="movies-channel">
            <div class="tags-panel">
                <ul class="tags-lines">
                    <li class="tags-line">
                        <div class="tags-title">城市 :</div>
                        <ul class="tags tags-type">
                        </ul>
                    </li>
                </ul>
            </div>
        </div>

        <div class="movies-panel">
            <div class="movies-sorter">
            </div>
            <div class="cinemas-list">
                <ul class="cinema-list">
                </ul>
            </div>
        </div>
    </div>
</div>

<!-- 脚 -->
<jsp:include page="footer.jsp"/>

<!-- ------------------------------------------------------------------- -->
<script>
    var clientHeight = document.documentElement.clientHeight;
    var clientWidth = document.documentElement.clientWidth;
    var city;
    var movielist = $(".cinema-list");
    window.onload = function(){
        initHeader();
        initParams(); //参数
        initTags(); //标签
        initMovieList();
        $("#now").addClass("layui-this");
        initClass(); //布局

    }

    //初始化布局
    function initClass(){
        mainTagsz = $(".main-Tagsz")[0];

        mainTagsz.style.cssText = "width:1170px !important; margin: 0 0 0 " + (clientWidth - 1170)/2 + " !important;";
    }

    //初始化电影列表
    function initMovieList(){
        movielist.empty();
        //如果没有参数，就是直接排序即可。
        if(getUrlParams("city") == "全部" || getUrlParams("city") == null){
            $.ajax({
                type: "post",
                url: "/cinema/findAllCinemas",
                data: {},
                dataType: "json",
                success: function(obj){
                    for(var i = 0;i < obj.count; i++){
                        movielist.append(
                            "<li> <div class=\"movie-item\"> <a onclick=\"cinemaDetail("+obj.data[i].cinemaId+")\" > <div class=\"movie-poster\"> <img src=\""+ obj.data[i].cinemaPoster +"\">  </a> </div>" +
                                "<div class=\"channel-action channel-action-sale\"> <a>购票<a/> </div> <div class=\"movie-ver\"></div> </div>" +
                                "<div class=\"channel-detail movie-item-title\" title=\""+ obj.data[i].cinemaName +"\">" +
                                "<a onclick=\"cinemaDetail("+obj.data[i].cinemaId+")\" >"+ obj.data[i].cinemaName +"</a> </div>" +
                                "<div class=\"channel-detail channel-detail-orange\"> <i class=\"integer\">0</i> </div>" +
                            "</li>"
                        );
                    }
                },
                error: function(){
                    alert("电影院查询失败！");
                }
            });
        }else{
            //如果是有类型的话，那么就应该找相对应的类型数据
            $.ajax({
                type: "post",
                url: "/cinema/findCinemasByCity",
                data: {
                    city:city
                },
                dataType: "json",
                success:function(obj){
                    if(obj.count > 0){
                        for(var i = 0;i < obj.count; i++){
                            movielist.append(
                                "<li> <div class=\"movie-item\"> <a onclick=\"cinemaDetail("+obj.data[i].cinemaId+")\"> <div class=\"movie-poster\"> <img src=\""+ obj.data[i].cinemaPoster +"\" > </div> </a>" +
                                "<div class=\"channel-action channel-action-sale\"> <a>购票<a/> </div> <div class=\"movie-ver\"></div> </div>" +
                                "<div class=\"channel-detail movie-item-title\" title=\""+ obj.data[i].cinemaName +"\">" +
                                "<a onclick=\"cinemaDetail("+obj.data[i].cinemaId+")\"  >"+ obj.data[i].cinemaName +"</a> </div>" +
                                "<div class=\"channel-detail channel-detail-orange\"> <i class=\"integer\">0</i> </div>" +
                                "</li>"
                            );
                        }
                    }else{
                        movielist.append("<div style=\"margin-top:40px;font-size:18px;color:#333;height:190px;\">抱歉，没有找到相关结果，请尝试用其他条件筛选。</div>");
                    }
                },
                error: function(){
                    alert("查找电影院类型失败！");
                }
            })
        }

    }


    //初始化标签
    function initTags(){
        var tagsType = $(".tags-type");
        var TypeStr = ["全部","广州","深圳","上海","北京"];
        var TypeActive = [];
        //这个urlTemp用于生成一个临时的url用来传输数据
        var urlTemp = ["&city="+city];
        TypeActive = inputTags(TypeStr, TypeActive, city);

        //遍历所有type
        // url生成为
        for(var i=0;i<TypeStr.length;i++){
            urlTemp[0] = "&city="+TypeStr[i];
            tagsType.append(
                "<li " + TypeActive[i] + ">" +
                "<a href=\"?"+urlTemp[0]+"\">"+
                TypeStr[i] +
                "</a>" +
                "</li>"
            );
        }

    }


    //导入活跃标签
    function inputTags(Str, Active, tags){
        for(var i=0;i<Str.length;i++){
            if(tags==0&&i==0){
                Active.push("class=\"active\"");
                break;
            }
            if(Str[i]==tags){
                Active.push("class=\"active\"");
            }
            else
                Active.push(" ");
        }
        return Active;
    }

    //初始化url参数
    function initParams(){
        if (getUrlParams('city') == null){
            city = "全部";
        } else {
            city = getUrlParams('city');
        }
    }

    function cinemaDetail(cinema_id) {
        window.location.href = "/cinemaDetail?cinema_id=" + cinema_id;
    }

    //获取url参数，这里用于切分type类型
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