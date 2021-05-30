<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021-05-29
  Time: 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发表评论功能的实现</title>
    <script src="vue.min.js"></script>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
  <div id="div_block">
     <com1 @func="add"></com1>
     <ul class="list-group">
       <li class="list-group-item" v-for="item in list" :key="item.id">
           <span class="badge">评论人：{{item.user}}</span>
           {{item.content}}
       </li>
     </ul>
  </div>
  <template id="temp1">
    <div>
       <div class="form-group">
           <label>评论人：</label>
           <input type="text" class="form-control" v-model="user" ref="user_ref">
       </div>
        <div class="form-group">
            <label>评论内容：</label>
            <textarea class="form-control" v-model="content" ref="content_ref"></textarea>
        </div>
        <div class="form-group">
            <input type="button" value="发表评论" class="btn btn-primary" @click="postcontent">
        </div>
    </div>
  </template>
</body>
<script>
    var vm=new Vue({
        el:"#div_block",
        data:{
            list:[
                {id:Date.now(),user:'李白',content:'天生我材必有用'},
                {id:Date.now(),user:'江小白',content:'劝君更进一杯酒'},
                {id:Date.now(),user:'小马',content:'我是马云'}
            ]
        },
        methods:{
            add(pram1,pram2){
                this.list.unshift({id:Date.now(),user:pram1,content:pram2})
            }
        },
        components:{
            com1:{
                template:"#temp1",
                data:function(){
                    return {
                        user:'',
                        content:''
                    }
                },
                methods:{
                    postcontent(){
                        this.user=this.$refs.user_ref.value;
                        this.content=this.$refs.content_ref.value;
                        this.$emit('func',this.user,this.content);
                    }
                }
            }
        }
    })
</script>
</html>
