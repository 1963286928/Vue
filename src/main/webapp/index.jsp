<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <script src="vue.min.js"></script>
    <%--因为vue-resource依赖vue，所以，vue-resource要加载在vue的后面。vue-resource相当于vue下的一个函数，
    引用Ajax采用this.$http,下面有this.$http.post|get|josnp--%>
    <script src="vue-resource.js"></script>
</head>
    <style>
     .ball{
         width: 15px;
         height: 15px;
         border-radius: 50%;
         background-color: red;
     }
     .v-enter,
     .v-leave-to {
         opacity: 0;
         transform: translateX(80px);
     }
     .v-enter-active,
     .v-leave-active{
         transition: all 3s ease;
     }
     p {
         transform: translateX(80px);
     }
     li {
         border:1px dashed ;
         margin-top:3px;
     }
    </style>
<body>
<div id="app">
    <%--<p v-text="msg"></p>
    <p v-html="msg2"></p>
    <input type="button" value="按钮" v-bind:title="mytitle" v-on:click="show">&lt;%&ndash;v-bind设置变量的作用 v-on绑定事件d&ndash;%&gt;
    <div v-on:click="divHandler">
     <input type="button" value="戳他" v-on:click="btnHandler">
    </div>
    <a href="http://www.baidu.com" v-on:click.prevent="linkclick">有问题先百度</a>
    <div v-on:click.capture="divHandler" style="background-color: red">
        <input type="button" value="戳他" v-on:click="btnHandler">
    </div>
    <input type="text" v-model:value="msg" />
        {{msg}}
    <div v-bind:style="[red,font]">dddd</div>
    <p v-for="(item,i) in list_object">{{i}}--{{item.name}}</p>
    <p v-for="(value,key,k) in list2">{{key}}--{{value}}--{{k}}</p>
    <p v-for="count in 10">{{count}}</p>
    <h3 v-if="flag">这是用v-if控制的元素</h3>
    <h3 v-show="flag">{{msg2}}}</h3>
    <input type="button" value="切换" v-on:click="flag=!flag"/>
    <input type="button" value="按钮" v-bind:title="mytitle" v-on:click="show">
    <input type="text" v-model="msg"/>
    {{ mytitle | myfilter2("参数") }}
    <div v-color="red"></div>
    <input type="button" value="快到碗里来" v-on:click="flag=!flag"/>
    <input type="button" value="测试" />
        <h3 >hallo</h3>
        <transition>
            <h3 v-show="flag">这是H3</h3>
        </transition>
    <transition
        v-on:before-enter="beforeEnter"
        v-on:enter="enter"
        @after-enter="afterEnter">
        <div class="ball" v-show="flag"></div>
    </transition>
    <ul>
      <li v-for="item in list" :key="item.id">{{item.id}}---{{item.name}}</li>
    </ul>
    <mycoml></mycoml>
        <template id="tem">
            <h1 v-color>hellofgtv6g</h1>
        </template>
        <h1 v-color="'red'">hellofgtv6g</h1>
       <com></com>--%>
    <script>
        //事件修饰符.stop 阻止冒泡
        //阻止默认行为.prevent 当在超链接使用时，超链接将不会发生跳转
        //.capture 添加事件侦听器时使用事件捕获模式，当点击父亲元素时，子元素的事件监听也起作用，跟冒泡相反，由外向里
        //.self事件在本元素中触发才执行，诸如冒泡捕获都不起作用
        //.once事件只触发一次
        //v-model指令的学习，只能运用在表单元素中
        //Vue样式使用
        //v-for循环普通数组、对象数组、对象、迭代数字
        //v-if 每次都会重新创建和删除元素
        //v-show 不会重新创建或者删除，只是不将其挂载上去
        //vue-resource发起Ajax请求
        //组件：为了拆分Vue实例的代码量，能够让我们以不同的组件，来划分不同的功能模块，将来我们需要什么样的功能，就可以去调用对应的组件
        //模块化：根据代码逻辑划分，方便代码分层开发，保证每个功能模块的职能单一
        //组件化：从UI界面划分，前端组件化，方便UI组件重用
        //组件中的template属性指向的模板内容，必须有且只有一个根元素
    </script>
</div>
<template id="tmp">
    <div>
    <input type="button" value="+1" v-on:click="increment"/>
    <h3>{{count}}</h3>
    </div>
</template>
<script>
    var dataObj={ count:0 }
    //使用Vue.component(“组件名称”,创建出来的组件模板对象)
    //创建组件的第一种方式
    Vue.component("mycoml",Vue.extend({
        template:"<h3>这是使用Vue.extend创建的组件</h3>"//通过template属性，指定了组件要展示的HTML结构
    }));
    //创建组件的第二种方式
    Vue.component("mycoml",{
        template:"<h3>这是使用Vue.extend创建的组件</h3>"//通过template属性，指定了组件要展示的HTML结构
    });
    //创建组件的第三种方式,将template单独抽取出去
    Vue.component("mycoml",{
        template:"#tem"
    });
    Vue.filter("myfilter2",function(str,par){
        return  str.replace(/自己/g,par);
    });
    Vue.directive("color",{
        bind:function (el,binding){
            el.style.color=binding.value;
        },
        inserted:function (el){
            alert("ces");
        },
        update:function (el){

        }
    })
    //创建一个Vue的实例
    var vm=new Vue({
        el: "#app",//表示当前我们new的这个Vue实例，要控制页面上的哪个区域
        data:{//data属性中，存放的是el中要用到的数据
            msg:"欢迎学习Vue",//通过Vue提供的指令，很方便的就能把数据渲染到页面上，程序员不再手动操作DOM元素
            msg2:new Date(),
            mytitle:"这是一个自己定义的title",
            red:{backgroundColor:"red",width:"200px",height:"200px"},
            font:{fontStyle:"italic",fontcolor:"black"},
            list:[
                {id:1,name:"赵高"},
                {id:2,name:"秦侩"},
                {id:3,name:"和珅"}
            ],
            list_object:[{id:1,name:"zs"},{id:2,name:"ls"}],
            list2:{id:1,name:"zs"},
            flag:false,
        },
        methods:{//定义方法
            show:function (){
                alert("hello");
            },
            divHandler:function(){
                alert("触发了div的事件");
            },
            btnHandler:function(){
                alert("触发了btn的事件");
            },
            linkclick:function (){
                alert("你猜接下来会不会跳转");
            },
            getInfo(){//发起get请求
                this.$http.get("")
            },
            beforeEnter(el){
                el.style.transform="translate(0,0)";
            },
            enter(el,done){
                //动画开始之后的样式
                el.offsetWidth;//这句话没有实际的作用，但是，如果不写，出不来动画效果
                el.style.transform="translate(30px,30px)";
                el.style.transition="all 1s ease";
                //这里的done，其实就是afterEnter函数，done是函数的引用
                done();
            },
            afterEnter(el){
                //动画完成后，会调用
                this.flag=!this.flag;
            }
        },
        filters:{
            myfilter:function(str,par){
               return  str.replace(/自己/g,par);
            }
        },
        directives:{
            color:{
                bind:function(el,binding){
                    el.style.color=binding.value;
                }
            }
        },
        components:{
            com:{
                template:"#tmp",
                //1.组件可以有自己的data数据
                //2.组件的data和实例的data有点不一样，实例中的data是一个对象，但组件中的data必须是一个方法
                //3.组件中的data除了必须为一个方法之外，这个方法内部，还必须返回一个对象
                //4.组件中的data数据使用方式和实例中的data使用方式完全一样
                data:function(){
                    return dataObj;
                },
                methods:{
                    increment:function(){
                        this.count++;
                    }
                }
            }
        },
        //钩子函数
        beforeCreate(){
            //此时只是新建Vue实例，data、methods属性还没初始化好
        },
        created(){
            //此时只是初始化data、methods属性，没有编译模板
        },
        beforeMount(){
            //此时只是编译模板，没有挂载DOM
        },
        mounted(){
            //此时只是挂载DOM
        },
        beforeUpdate(){
            //刷新页面前的操作
        },
        updated(){
            //刷新页面后的操作
        }
    });
</script>
</body>
</html>