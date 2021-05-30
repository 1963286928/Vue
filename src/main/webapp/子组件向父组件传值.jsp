<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021-05-28
  Time: 22:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>子组件向父组件传值</title>
    <script src="vue.min.js"></script>
</head>
<body>
<div id="div_block">
    <com1 @func="show"></com1>
</div>
<template id="tem">
    <input type="button" @click="mymethod" value="点我">
</template>
</body>
<script>
    var vm=new Vue({
        el:"#div_block",
        data:{},
        methods:{
            show(data){
                console.log("我是父组件里的方法"+data);
            }
        },
        components:{
            com1:{
                template:"#tem",
                props:[],
                methods: {
                    mymethod(){
                        this.$emit("func","我是参数1111");
                    }
                }
            }
        }
    })
</script>
</html>
