

<<<<<<< HEAD
var serverName = '114.115.223.182';
=======

//var serverName = '192.168.43.193:88';
var serverName = '114.115.143.74:80';
//var serverName = '10.77.117.237:88';

>>>>>>> 2c174ea1f290b0c13420e7925f8439d3c448e3be
 				  

//判断是否登录了
function islogin(){
    var doc_phone = plus.storage.getItem('doc_phone');
    if(doc_phone != null){
        return true;
    }else{
       	return false;
    }
}
