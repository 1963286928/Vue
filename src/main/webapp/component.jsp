<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021-05-28
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="vue.min.js"></script>
<html>
<head>
    <title>component的学习</title>
</head>
<body>
<div id="div_block">
    <com></com>
    <com></com>
    <com></com>
</div>
<template id="tem">
    <div>
        <input type="button" value="+1" @click="increment"/>
        <h3>{{count}}</h3>
    </div>
</template>
</body>
<script>
    var vm=new Vue({
        el:"#div_block",
        data:{},
        methods:{},
        components:{
            com:{
                template:"#tem",
                data:function(){
                    return {count:0}
                },
                methods: {
                    increment:function(){
                        this.count++;
                    }
                }
                }
            }
        }
    })
</script>
</html>
