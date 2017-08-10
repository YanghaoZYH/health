


var serverName = '192.168.1.107:80';
//var serverName = '10.77.117.237:80';


//判断是否登录了
function islogin(){
    var user_phone = plus.storage.getItem('user_phone');
    if(user_phone != null){
        return true;
    }else{
       	return false;
    }
}
