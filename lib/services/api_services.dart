import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {

  bool loading = false;

  Future<List<dynamic>> getArticle() async {

    Response res = await http.get(Uri.parse('https://newsapi.org/v2/everything?q=bitcoin&apiKey=6718c40b1c5d49e0b5025c29e044a41c'));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      return body;
    } else {
      throw ("Can't get the Articles");
    }
  }
}