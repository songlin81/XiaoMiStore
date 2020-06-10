import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter100/model/news.dart';
import 'package:flutter100/services/news.dart';
import 'package:flutter100/style/color.dart';
import 'product_list_page.dart';
import 'news_detail_page.dart';

class NewsPage extends StatefulWidget {
  @override
  NewsPageState createState() => NewsPageState();
}

class NewsPageState extends State<NewsPage> {
  NewsListModal listData = NewsListModal([]);

  int page = 0;

  void getNewsList() async {
    var data = await getNewsResult();
    NewsListModal list = NewsListModal.fromJson(data);

    setState(() {
      listData.data.addAll(list.data);
    });
  }

  @override
  void initState() {
    getNewsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index){
          NewsItemModal item=listData.data[index];
          return ListTile(
            title: Text(item.title),
            subtitle: Text(item.content),
            leading: Icon(Icons.fiber_new),
            trailing: Icon(Icons.arrow_forward),
            contentPadding: EdgeInsets.all(10.0),
            enabled: true,
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewsDetailPage(item:item)),
              );
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(height: 1.0, color: Colors.grey,),
        itemCount: listData.data.length,
      ),
    );
  }
}