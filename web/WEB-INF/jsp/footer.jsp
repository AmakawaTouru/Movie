<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
    <div class="footer">
        <div>
            <p>网上电影购票系统</p>
            <p>
               友情链接:
                <a href="https://maoyan.com/" target="_blank" style="margin-right:30px;">猫眼电影</a>
                <span onclick="footerBtn()" style="height: 20px; cursor: pointer; border-left:0px">
                    客服中心：
                    <img src="../../../static/images/客服.jpg" style="width: 20px;">
                </span>
            </p>
            <p>@朱浩良 毕业设计</p>
        </div>
    </div>
</body>
<script>
        //点击客服事件
        function footerBtn(){
            layui.use(['layer'], function(){
                var layer = layui.layer;
                layer.open({
                    type: 1
                    ,title: "客服" //不显示标题栏
                    ,closeBtn: false
                    ,area: '400px;'
                    ,shade: 0.8
                    ,offset: clientHeight/20
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: ['确认', '取消']
                    ,yes: function(){
                        layer.close(layer.index);
                    }
                    ,btnAlign: 'c'
                    ,moveType: 0 //拖拽模式，0或者1
                    ,content: 
                        "<div style=\"text-align: center; margin: 20px 0 10px 0;\">" +
                            "<img src=\"../../../static/images/客服中心.jpg\" style=\"width:320px;\">" +
                        "</div>"
                });
            });
        }
</script>
</html>