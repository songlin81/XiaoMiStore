import 'dart:ffi';

import 'package:flutter/material.dart';
import 'pages/about_us.dart';
import 'pages/home_page.dart';
import 'pages/news_page.dart';
import 'pages/product_page.dart';

class App extends StatefulWidget{
  @override
  AppState createState() => AppState();
}

class AppState extends State<App>{

  var _currentIndex = 0;

  HomePage homepage;
  ProductPage productPage;
  NewsPage newsPage;
  AboutUsPage aboutUsPage;

  currentPage(){
    switch(_currentIndex){
      case 0:
        if(homepage == null){
          homepage = HomePage();
        }
        return homepage;
      case 1:
        if(productPage == null){
          productPage = ProductPage();
        }
        return productPage;
      case 2:
        if(newsPage == null){
          newsPage = NewsPage();
        }
        return newsPage;
      case 3:
        if(aboutUsPage == null){
          aboutUsPage = AboutUsPage();
        }
        return aboutUsPage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter POC'),
        leading: Icon(Icons.home),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: (){},
              child: Icon(Icons.search),
            ),
          )
        ],
      ),

      body: currentPage(),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: ((index){
          setState(() {
            _currentIndex = index;
          });
        }),
        items: [
          BottomNavigationBarItem(
            title: Text(
              '首页',
            ),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              title: Text(
                '产品',
              ),
              icon: Icon(Icons.apps)
          ),
          BottomNavigationBarItem(
              title: Text(
                '新闻',
              ),
              icon: Icon(Icons.fiber_new)
          ),
          BottomNavigationBarItem(
              title: Text(
                '关于我们',
              ),
              icon: Icon(Icons.insert_comment)
          ),
        ],
      ),
    );
  }
}