

var serverName = '114.115.223.182';

//判断是否登录了
function islogin(){
    var user_phone = plus.storage.getItem('user_phone');
    if(user_phone != null){
        return true;
    }else{
       	return false;
    }
}
