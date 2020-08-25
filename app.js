//1:下载四个第三方模块
//express           web服务器
//mysql             mysql驱动
//express-session   会话对象
//cors              跨域
//[8080脚手架   4000服务器]
//npm i express mysql express-session cors
//2:引入第三方模块
const express = require("express");
const session = require("express-session");
const mysql = require("mysql");
const cors = require("cors");
//3:创建数据库连接池
var pool = mysql.createPool({
   host:"127.0.0.1",
   user:"root",
   password:"",
   port:3306,
   connectionLimit:15,
   database:"cake"
})
//4:创建web服务器
var server = express();
//5:配置跨域
//允许跨域程序端口
server.use(cors({
    //允许哪个程序列表 脚手架
    origin:["http://localhost:4000",
    "http://localhost:8080","http://175.24.53.90:4000","http://www.xp521.xyz"],
    //每次请求验证
    credentials:true
}));
//6:配置session对象
server.use(session({
   secret:"128位安全字符串",//加密条件
   resave:true,            //请求更新数据
   saveUninitialized:true  //保存初始化数据
}))
//7:指定静态目录  public
server.use(express.static("public/images"));
server.use(express.static("public"))
//8:启动监听端口  4000
server.listen(4000,()=>{
	console.log("4000 server in...")
});

// 全部名录
server.get("/goods",(req,res)=>{
   // 获取蛋糕类型id
   var clsid=req.query.clsid;
   // console.log(clsid);
   // 创建sql语句
   if(clsid==0){
      var sql="SELECT * FROM Directory";
   }else{
      var sql="SELECT * FROM Directory WHERE clsid=?";
   }
   pool.query(sql,[clsid],(err,result)=>{
      if(err) throw err;
      res.send({code:1,data:result})
   })
})
//http://127.0.0.1:4000/goods?clsid=0

// 详情页
server.get("/details",(req,res)=>{
   // 获取当前商品的id
   var id=req.query.id;
   // 创建sql语句
   var sql="SELECT * FROM Directory WHERE id=?";
   pool.query(sql,[id],(err,result)=>{
      if(err) throw err;
      res.send({code:1,data:result[0]})
   })
})
// http://127.0.0.1:4000/details?id=1
// 登录功能；
server.get("/login",(req,res)=>{
   // 1.获取参数
   var n=req.query.uname;
   var p=req.query.upwd;
   // 2.创建sql
   var sql="SELECT * FROM cake_user WHERE uname=? AND upwd=?";
   // 3.发送sql并且结果返回脚手架
   pool.query(sql,[n,p],(err,result)=>{
      // 4.如果发生严重错误抛出
      if(err) throw err;
      // 5.登录失败用户名密码有错
      if(result.length==0){
         res.send({code:-1,msg:"用户名或密码有误"})
      }else{
         // 6.登录成功
         // 7.将登录成功用户id保存 session对象作为登陆成功凭据
         //result=[{id:1}]
         //不写req.session.id error
         req.session.uid=result[0].uid;
         res.send({code:1,data:result[0],msg:"登录成功"});
      }
   })
})
// http://127.0.0.1:4000/login?uname=tom&upwd=123456  测试

// 注册功能
server.get("/reg",(req,res)=>{
   var uname=req.query.uname;
   var upwd=req.query.upwd;
   var email=req.query.email;
   var phone=req.query.phone;
   // 先查询用户名是否注册过
   var sql="SELECT uname FROM cake_user WHERE uname=?";
   pool.query(sql,[uname],(err,result)=>{
      if(err) throw err;
      if(result.length>0){
         res.send({code:-1,msg:"用户已注册"})
         return;
      }else{
         var sql=`INSERT INTO cake_user VALUES(null,'${uname}','${upwd}','${email}','${phone}')`;
         pool.query(sql,(err,result)=>{
            if(err) throw err;
            res.send({code:1,msg:"注册成功"})
         })
      }
   })
})
// http://127.0.0.1:4000/reg?uname=Jerry&upwd=123456&132456@qq.com&1386245123  测试

// 添加购物车功能
server.get("/addcart",(req,res)=>{
   // 获取用户登录凭证
   var uid=req.session.uid;
   // 如果用户没有登录返回错误信息
   if(!uid){
      res.send({code:-1,msg:"请登录"});
      return;
   }
   // 获取参数
   var id=req.query.id;
   var cname=req.query.cname;
   var csize=req.query.csize;
   var cprice=req.query.cprice;
   var cpic=req.query.cpic;
   // 查询此用户是否买过此商品
   var sql = "SELECT uid FROM cake_cart WHERE id=? AND uid=?";
   pool.query(sql,[id,uid],(err,result)=>{
      // 如果没有买过此商品
      if(result.length==0){
         var sql=`INSERT INTO cake_cart VALUES('${uid}','${id}','${cname}','${csize}','${cprice}','${cpic}',1)`
      }else{
         var sql = `UPDATE cake_cart SET count=count+1 WHERE uid=${uid} AND id=${id}`;
      }
      pool.query(sql,(err,result)=>{
         res.send({code:1,msg:"添加成功"})
      })
   })
})
// http://127.0.0.1:4000/addcart

// 购物车 cart
server.get("/cart",(req,res)=>{
   // 获取当前登录用户的uid
   var uid=req.session.uid;
   // 如果用户没有登录返回错误信息
   if(!uid){
      res.send({code:-1,msg:"请登录"});
      return;
   }
   var sql="SELECT * FROM cake_cart WHERE uid=?";
   pool.query(sql,[uid],(err,result)=>{
      if(err) throw err;
      res.send({code:1,data:result})
   })
})
// http://127.0.0.1:4000/cart

// 当前用户购物车数量
server.get("/cartcount",(req,res)=>{
   // 获取当前登录用户的uid
   var uid=req.session.uid;
   // 如果用户没有登录返回错误信息
   if(!uid){
      res.send({code:-1,msg:"请登录"});
      return;
   }
   var sql = "SELECT id FROM cake_cart WHERE uid=?";
   pool.query(sql,[uid],(err,result)=>{
      if(err) throw err;
      res.send({code:1,data:result})
   })
})

// http://127.0.0.1:4000/cartcount

// 购物车减1
server.get("/subcart",(req,res)=>{
   // 获取当前登录用户的uid
   var uid=req.session.uid;
   // 如果用户没有登录返回错误信息
   if(!uid){
      res.send({code:-1,msg:"请登录"});
      return;
   }
   var id = req.query.id;
   // 查询此用户当前商品数量是否为1
   var sql="SELECT count from cake_cart WHERE uid=? and id=?;"
   pool.query(sql,[uid,id],(err,result)=>{
      var count=result[0].count;
      if(count==1){
         var sql="DELETE FROM cake_cart WHERE uid=? AND id=?"
      }else{
         var sql= "UPDATE cake_cart SET count=count-1 WHERE uid=? AND id=?";
      }
      pool.query(sql,[uid,id],(err,result)=>{
         if (err) throw err;
         res.send({code:1,msg:"删除成功"})
      });
   })
   
})
// http://127.0.0.1:4000/subcart?id=1

// 清空选中的购物车
server.get("/clear",(req,res)=>{
   // 获取当前登录用户的uid
   var uid=req.session.uid;
   // 如果用户没有登录返回错误信息
   if(!uid){
      res.send({code:-1,msg:"请登录"});
      return;
   }
   // 获得选中商品的id
   var id = req.query.arr;
   // 遍历要删除的商品id，并拼接成sql  AND id=2 or id=3 or id=4;
   var arr="";
   for (const elem of id) {
      arr+="or"+" id="+elem+" ";
   }
   arr=arr.slice(3);
   var sql="DELETE FROM cake_cart WHERE uid=? AND ";
   sql+=arr;
   pool.query(sql,[uid],(err,result)=>{
      if(err) throw err;
      res.send({code:1,msg:"删除成功"})
   })
})
// cart 结算功能
server.get("/accounts",(req,res)=>{
   // 获取当前登录用户的uid
   var uid=req.session.uid;
   // 如果用户没有登录返回错误信息
   if(!uid){
      res.send({code:-1,msg:"请登录"});
      return;
   }
   // 获得当前用户结算的商品
   var arr = req.query.arr;
   var obj=[];
   // 把拿到的数据遍历 JSON格式转为对象。
   for (const elem of arr) {
      var obj2=JSON.parse(elem);
      obj.push(obj2);
   }
   // 遍历数据对象 并拼接成sql语句 
   // INSERT INTO cake_orderform VALUES('${uid}','${id}','${cname}','${csize}','${cprice}','${cpic}','${count}')
   var sql="INSERT INTO cake_orderform VALUES"
   for (const elem of obj) {
      sql+="("+uid+","+elem.id+",'"+elem.cname+"','"+elem.csize+"','"+elem.cprice+"','"+elem.cpic+"','"+elem.count+"',null)"+","
   }
   sql=sql.slice(0,sql.length-1);
   sql+=";";
   // console.log(sql);
   pool.query(sql,(err,result)=>{
      if(err) throw err;
      res.send({code:1,msg:"插入成功"});
   });
})
// 详情页购买 buy
server.get("/buy",(req,res)=>{
   // 获取当前登录用户的uid
   var uid=req.session.uid;
   // 如果用户没有登录返回错误信息
   if(!uid){
      res.send({code:-1,msg:"请登录"});
      return;
   }
   // 获取参数
   var id=req.query.id;
   var cname=req.query.cname;
   var csize=req.query.csize;
   var cprice=req.query.cprice;
   var cpic=req.query.cpic;
   var count=req.query.count;
   var sql=`INSERT INTO cake_orderform VALUES('${uid}','${id}','${cname}','${csize}','${cprice}','${cpic}','${count}',null)`;
   pool.query(sql,(err,result)=>{
      if(err) throw err;
      res.send({code:1,msg:"插入成功"});
   })
})
// orderForm 查询当前用户有哪些订单
server.get("/orderform",(req,res)=>{
      // 获取当前登录用户的uid
      var uid=req.session.uid;
      // 如果用户没有登录返回错误信息
      if(!uid){
         res.send({code:-1,msg:"请登录"});
         return;
      }
      // 查询当前用户的订单有哪些
      var sql="SELECT * FROM cake_orderform WHERE uid=?"
      pool.query(sql,[uid],(err,result)=>{
         if(err) throw err;
         res.send({code:1,data:result});
      })
});
// http://127.0.0.1:4000/orderform

// subOrderForm 删除订单
server.get("/suborderform",(req,res)=>{
   // 获取当前登录用户的uid
   var uid=req.session.uid;
   // 如果用户没有登录返回错误信息
   if(!uid){
      res.send({code:-1,msg:"请登录"});
      return;
   }
   // 获取当前用户的订单号
   var ordnum=req.query.ordernum;
   var sql="DELETE FROM cake_orderform WHERE uid=? AND ordernum=?";
   pool.query(sql,[uid,ordnum],(err,result)=>{
      if(err) throw err;
      res.send({code:1,msg:"删除成功"})
   })
})
// http://127.0.0.1:4000/suborderform?ordernum=1

// logout 退出登录功能
server.get("/logout",(req,res)=>{
   req.session.uid=undefined;
   res.send({code:1,msg:"退出成功"})
})
// http://127.0.0.1:4000/logout

// 登录状态 state
server.get("/state",(req,res)=>{
   var uid=req.session.uid;
   // 如果用户没有登录返回
   if(!uid){
      res.send({code:-1,msg:"未登录"});
   }else{
      // 创建sql查询当前登录用户的name和phone
      var sql="SELECT uname,phone FROM cake_user WHERE uid=?";
      pool.query(sql,[uid],(err,result)=>{
         if(err) throw err;
         res.send({code:1,msg:"已登录",data:result})
      })
   }
})
// http://127.0.0.1:4000/state