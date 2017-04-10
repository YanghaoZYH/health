<?php
namespace Connector\Controller;

use Think\Controller;

class UserController extends Controller{
	public function reg(){
		if(!$_POST['user_phone']||!$_POST['user_password']) {
			$res['result']=0;
			$res['data']="手机号码或者密码不能为空";
		}else{
			$model = D('user_info');
			$data['user_phone']=$_POST['user_phone'];
			// 用户注册之前先对密码加密
			$data['user_password']=md5($_POST['user_password'].C('MD5_KEY'));
			//用户名生成随机字符串
			$name = new \Org\Util\String();
			$data['user_name']=$name->randString(6,5);
			$data['user_time']=date('Y-m-d H:i:s');
			$findmess['user_phone']=$_POST['user_phone'];
			$user=$model->where($findmess)->find();
			//先判断该手机是否注册过
			if ($user) {
				//User exists
				$res['result']=0;
				$res['data']="该手机号已经被注册";
			}else{
				//No user exists
				$addres=$model->add($data);
				$res['result']=1;
				$res['data']="恭喜注册成功";
			}
		}
		echo json_encode($res);
	}
	
	public function login(){
		
		if(I('post.user_phone') && I('post.user_token')){
			$data['user_phone']=I('post.user_phone');
			$data['user_token']=I('post.user_token');
			$mess=M('user_info')->where($data)->find();
			if ($mess) {
				$time['login_time']=date('Y-m-d H:i:s');
				$user_phone=$data['user_phone'];
				M('user_info')->where("user_phone=$user_phone")->save($time);
				$res['result']=1;
				$res['data']="登录成功";
				
				//token过期，重新登录
				if(ceil((time() - strtotime($mess['token_time']))/(60*60*24))>=7){
					$res['result']=0;
					$res['data']="您的登录信息已过期，请重新登录";
				}
			}else{
				$res['result']=0;
				$res['data']="您的登录信息已过期，请重新登录";
			}
		}else{
			$data['user_phone']=I('post.user_phone');
			$data['user_password']=md5(I('post.user_password').C('MD5_KEY'));
			$mess=M('user_info')->where($data)->find();
			if ($mess) {
				$res['result']=1;
				$res['data']="登录成功";
				$res['user_token']=md5('user_phone'+time());
				
				$token['user_token']=$res['user_token'];
				$token['token_time']=date('Y-m-d H:i:s');
				$token['login_time']=date('Y-m-d H:i:s');
				M('user_info')->where($data)->save($token);
				
			}else{
				$res['result']=0;
				$res['data']="用户名或密码错误";
			}
		}

		echo json_encode($res);
	}
	
	public function userinfo(){
		if ($SESSION['user_phone']) {
			$res['result']=1;
			$mess=M('user_info')->where('user_phone')->find();
			echo json_encode($mess);
		}
	}
}