import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:swyg/models/category_model.dart';
import 'package:swyg/models/item_model.dart';

class Api {
  var host = dotenv.env['BASE_URL'];

  getbestSelect() async {
    // var res = await http.get(Uri.parse('$host/product/bestSelect'));
    var res = await http.get(Uri.parse('http://52.91.19.229:8080/product/bestSelect'));
    List jsonResponse = json.decode(utf8.decode(res.bodyBytes));
    List<Item> items = jsonResponse.map((data) => Item.fromJson(data)).toList();
    return items;
  }

  getBestKeyWord()async{
    // var res = await http.get(Uri.parse('$host/category/selectBest'));
    var res = await http.get(Uri.parse('http://52.91.19.229:8080/category/selectBest'));
    List jsonResponse = json.decode(utf8.decode(res.bodyBytes));
    List<Category> categorys = jsonResponse.map((data) => Category.fromJson(data)).toList();
    return categorys;
  }
  getWeeklyBestItem()async{
    // var res = await http.get(Uri.parse('$host/category/selectBest'));
    var res = await http.get(Uri.parse('http://52.91.19.229:8080/likeProductList/selectWeek'));
    List jsonResponse = json.decode(utf8.decode(res.bodyBytes));
    List<Category> categorys = jsonResponse.map((data) => Category.fromJson(data)).toList();
    return categorys;
  }
  getBestMember()async{
    // var res = await http.get(Uri.parse('$host/category/selectBest'));
    var res = await http.get(Uri.parse('http://52.91.19.229:8080/likeMember/select'));
    List jsonResponse = json.decode(utf8.decode(res.bodyBytes));
    List<Item> items = jsonResponse.map((data) => Item.fromJson(data)).toList();
    return items;
  }
  getNewItem()async{
    // var res = await http.get(Uri.parse('$host/category/selectBest'));
    var res = await http.get(Uri.parse('http://52.91.19.229:8080/product/selectList'));
    List jsonResponse = json.decode(utf8.decode(res.bodyBytes));
    List<Item> items = jsonResponse.map((data) => Item.fromJson(data)).toList();
    return items;
  }
}
