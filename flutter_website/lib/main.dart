import 'package:flutter/material.dart';
import 'package:flutter100/loading.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'loading.dart';
import 'app.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Flutter Enterprise POC',
  theme: mDefaultTheme,
  routes: <String,WidgetBuilder>{
    "app": (BuildContext context) => App(),
    "company_info": (BuildContext context) => WebviewScaffold(
      url: "http://192.168.18.37:8080/?action=getNews",
      appBar: AppBar(
        title: Text('公司介绍'),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: (){
            Navigator.of(context).pushReplacementNamed('app');
          },
        ),
      )
    ),
  },
  home: LoadingPage(),
//  home: Center(
//    child: Text('Hello'),
//  ),
));

final ThemeData mDefaultTheme = ThemeData(
  primaryColor: Colors.redAccent,
);

//import 'dart:convert';
//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//
//void main() {
//  runApp(MyApp());
//}
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//        visualDensity: VisualDensity.adaptivePlatformDensity,
//      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: Center(
//        child: RaisedButton(
//          child: Text('测试数据接口'),
//          onPressed: () async{
//            String url = 'http://192.168.18.37:8080/?action=getProducts';
//            var res = await http.get(url);
//            String body = res.body;
//            print(body);
//            var json = jsonDecode(body);
//            print(json);
//          },
//        ),
//      ),
//    );
//  }
//}
