<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021-05-28
  Time: 21:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>父组件向子组件传值</title>
    <script src="vue.min.js"></script>
</head>
<body>
<div id="div_block">
    <com1 :fathermsg="msg"></com1>
</div>
</body>
<script>
    var vm=new Vue({
        el:"#div_block",
        data:{
            msg:"我是父组件的数据"
        },
        methods:{},
        components:{
            com1:{
                template:"<h1>{{fathermsg}}</h1>",
                props:["fathermsg"],
                data:function(){
                    return {};
                },
                methods:{}
            }
        }
    })
</script>
</html>
