import 'dart:convert';
import 'dart:io';
import 'data.dart';

void main() async {
  var requestServer = await HttpServer.bind('192.168.18.37', 8080);
  //var requestServer = await HttpServer.bind('127.0.0.1', 8080);
  print('server is up running');

  await for(HttpRequest request in requestServer){
    handleMessage(request);
  }

}

void handleMessage(HttpRequest request){
  try{
    if(request.method=='GET'){
      handleGET(request);
    }else if(request.method=='POST'){
      handleGET(request);
    }
  }catch(e){
    print('Exception captured: $e');
  }
}

void handleGET(HttpRequest request){
  var action=request.uri.queryParameters['action'];
  if(action == 'getProducts'){
    
    var page = request.uri.queryParameters['page'];
    //print('第$page页数据:' + json.encode(products));
    //print('获取产品数据。。。');

    request.response
    ..statusCode=HttpStatus.ok
    ..write(json.encode(products))
    ..close();
  }
  if(action == 'getNews'){
    //print('获取新闻数据。。。');

    request.response
    ..statusCode=HttpStatus.ok
    ..write(json.encode(news))
    ..close();
  }
  //request.response..write('get request success...')..close();
}

void handlePOST(HttpRequest request){
  
}