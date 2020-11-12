const express = require('express');
const server = express();
const cors = require('cors');
const bodyParser = require('body-parser');
const md5 = require('md5');
const mysql = require('mysql');
const pool = mysql.createPool({
  //MySQL数据库服务器的地址
  host:'127.0.0.1',
  //端口号
  port:3306,
  //数据库用户的用户名
  user:'root',
  //数据库用户的密码
  password:'',
  //数据库名称
  database:'mk_cake',
  //最大连接数据
  connectionLimit:10
});


server.use(cors({
  origin:['http://127.0.0.1:8080','http://localhost:8080']
}));

server.use(bodyParser.urlencoded({
  extended: false
}));

//------开始写项目--------
//1.用户登录
server.post('/login',(req,res)=>{
	var uname=req.body.uname;
	var upwd=req.body.upwd;
	var sql='select * from user where uname=? and upwd=?';
	pool.query(sql,[uname,upwd],(err,result)=>{
		if(err) throw err;
		console.log(result);
		if(result.length==0){
            res.send({message:'登录失败',code:0})
        }else{
            res.send({message:'登录成功',code:1})
        }
	})
})

//2.用户注册
server.post('/reg',(req,res)=>{
	var obj=req.body;
	var sql="select * from user where uname=?";
	pool.query(sql,[obj.uname],(err,result)=>{
				if(err) throw err;
				if(result.length>0){
					res.send('0')
				}else{
					var sql="insert into user set ?";
					pool.query(sql,[obj],(err,result)=>{
						if(err) throw err;
						if(result.affectedRows>0){
							res.send({message:'注册成功！',code:1});
						}
				})
			}
	})
})
//3.查询鲜花商品列表
server.get('/flower',(req,res)=>{
	var obj=req.body;
	var sql="select * from flower";
	pool.query(sql,[obj],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			res.send(result);
		}else{
			res.send('0');
		}
	});
})

//4.查询生日蛋糕商品列表
server.get('/cake',(req,res)=>{
	var obj=req.body;
	var sql="select * from cake";
	pool.query(sql,[obj],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			res.send(result);
		}else{
			res.send('0');
		}
	});
})
//5.查询礼品商品列表
server.get('/gift',(req,res)=>{
	var obj=req.body;
	var sql="select * from gift";
	pool.query(sql,[obj],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			res.send(result);
		}else{
			res.send('0');
		}
	});
})
//6.查询鲜花商品详细信息
server.get('/flower_details',(req,res)=>{
	var fid = req.query.fid;
	var sql="select * from flower_details_info where fid=?";
	pool.query(sql,[fid],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			res.send({result:result[0]});
		}else{
			res.send('0');
		}
	});
})
//7.查询蛋糕商品详细信息
server.get('/cake_details',(req,res)=>{
	var cid = req.query.fid;
	var sql="select * from cake_details_info where cid=?";
	pool.query(sql,[cid],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			res.send({result:result[0]});
		}else{
			res.send('0');
		}
	});
})
//8.查询礼物商品详细信息
server.get('/gift_details',(req,res)=>{
	var gid = req.query.fid;
	var sql="select * from details_info where gid=?";
	pool.query(sql,[gid],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			res.send({result:result[0]});
		}else{
			res.send('0');
		}
	});
})
//9.轮播图
server.get('/carousel',(req,res)=>{
	var obj=req.body;
	var sql="select * from carousel";
	pool.query(sql,[obj],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			res.send(result);
		}else{
			res.send('0');
		}
	});
})

server.listen(3000,()=>{
  console.log('server is running...');
});
