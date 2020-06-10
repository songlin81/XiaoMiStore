import 'package:http/http.dart' as http;
import 'dart:convert';
import '../conf/configure.dart';

getNewsResult([int page = 0]) async {
  String url = 'http://' + Config.IP + ':' + Config.PORT + '/?action=getNews';
  var res = await http.get(url);
  String body = res.body;

  var json = jsonDecode(body);
  print(json);

  return json['items'] as List;
}
