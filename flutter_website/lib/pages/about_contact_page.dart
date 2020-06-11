import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutContactPage extends StatefulWidget{
  @override
  AboutContactPageState createState() => AboutContactPageState();
}

class AboutContactPageState extends State<AboutContactPage>{

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('给我留言'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/company.jpg',
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 40.0,
            ),
            SizedBox(
              width: 380.0,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: '请留言',
                  labelText: '请留言',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}