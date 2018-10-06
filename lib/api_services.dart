import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:newsapp_flutter/NewsModel.dart';
String url = "https://newsapi.org/v1/articles?source=google-news&sortBy=top&apiKey=39427ed9e2d143a29696048897be3276";

Future<List<Article>> getNewsList() async{

  var headers = {HttpHeaders.contentTypeHeader:"application/json",};
  final response = await http.get(url,headers: headers);
  print(response.statusCode.toString() + "repo githuub");
  return newsListFromJson(response.body);
}