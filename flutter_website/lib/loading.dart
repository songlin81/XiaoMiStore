import 'package:flutter/material.dart';
import 'dart:async';

class LoadingPage extends StatefulWidget{
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<LoadingPage>{
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      print('loading...');
      Navigator.of(context).pushReplacementNamed("app");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      //child: Text('启动页面...'),
      child: Center(
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/images/loading.jpeg'
            ),
            Center(
              child: Text(
                'Flutter POC',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36.0,
                  decoration: TextDecoration.none
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}