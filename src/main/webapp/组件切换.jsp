<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021-05-28
  Time: 17:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>组件切换</title>
    <style>
        .v-enter,
        .v-leave-to{
            opacity:0;
            transform: translateX(150px);
        }
        .v-enter-active,
        .v-leave-active{
            transition:all 0.5s ease;
        }
    </style>
</head>
<script src="vue.min.js"></script>
<body>
<div id="div_block">
    <a href="" v-on:click.prevent="comName='login'">登录</a>
    <a href="" v-on:click.prevent="comName='register'">注册</a>
    <transition mode="out-in">
      <component :is="comName"></component>
    </transition>
</div>
</body>
<script>
    Vue.component("login",{
        template:"<h3>登陆组件</h3>"
    })
    Vue.component("register",{
        template:"<h3>注册组件</h3>"
    })
    var vm=new Vue({
        el:"#div_block",
        data:{
            comName:""
        },
        methods:{}
    });
</script>
</html>
