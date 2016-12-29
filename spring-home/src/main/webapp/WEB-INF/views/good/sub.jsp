<%--
  Created by IntelliJ IDEA.
  User: touka
  Date: 2016/12/22
  Time: 20:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-Type" content="text/html;charset=UTF-8">
    <title>Delicacy in Leside</title>
    <%@include file="../index/resource.jsp"%>
</head>
<body>

<%@include file="../include/header.jsp"%>

<div class="subtitleline">
    <div class="titleleft">当前订单</div>
    <div class="titleright">往期订单</div>
</div>
<div class="subbody">
    <div class="subnow">
        <c:forEach items="${subs}" var="sub">
        <div class="subnowbody">
            <div class="subimg"><img src="${sub.get('goodimage')}"></div>
            <ul>
                <li><div class="subtitle">${sub.get("goodname")}</div></li>
                <li><div class="subnum">订单编号：<span>${sub.get("id")}</span></div></li>
                <li><div class="ordertime">下单时间：<span>${sub.get("orderedtime")}</span></div></li>
                <!-- todo ??? 加个按键-->
                <li><div class="subconfirm" id="confirmsub" onclick="confirm(${sub.get("id")});">确认收货</div></li>
            </ul>
        </div>
        </c:forEach>
        <div class="subnowbody">
                <li><div class="subtitle">没有订单</div></li>
        </div>

    </div>
    <div class="subhis">
        <c:forEach items="${outdatedSubs}" var="sub">
            <div class="subnowbody">
                <div class="subimg"><img src="${sub.get('goodimage')}"></div>
                <ul>
                    <li><div class="subtitle">${sub.get("goodname")}</div></li>
                    <li><div class="subnum">订单编号：<span>${sub.get("id")}</span></div></li>
                    <li><div class="ordertime">下单时间：<span>${sub.get("orderedtime")}</span></div></li>
                    <!-- todo ??? 加个按键-->
                    <li><div class="subconfirm" id="onemore" onclick="onemore(${sub.get("id")});">再来一单</div></li>
                </ul>
            </div>
        </c:forEach>
        <div class="subnowbody">
            <li><div class="subtitle">没有订单</div></li>
        </div>
    </div>
</div>

<div class="login" id="logbody">
</div>

<script>
    function confirm(id) {
        alert(id);
        var data ={
            "id" :id,
        };
        $.ajax({
            type: "POST",
            url: urls.confirmGet,
            data: data,
            dataType:"json",
            success: function(r){
                if(r.state()==1)
                alert( "Data Saved: " + r.info );
                else alert("fail"+r.info);
            },
            error: function(r){
                alert( "Error");
            }
        });
        /*
         * TODO info/status 1成功 0失败
         * Time: 16/12/29 7:16
         * Creator: Chenls
         */ 
    }

    function onemore(id) {
        alert(id)
        url.oneMore

    }
</script>
</body>
</html>