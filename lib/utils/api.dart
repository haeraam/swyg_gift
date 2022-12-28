import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:swyg/models/category_model.dart';
import 'package:swyg/models/item_model.dart';

class Api {

  getbestSelect() async {
    // var res = await http.get(Uri.parse('$host/product/bestSelect'));
    var res = await http.get(Uri.parse('https://pickproduct.shop/product/bestSelect'));
    List jsonResponse = json.decode(utf8.decode(res.bodyBytes));
    List<Item> items = jsonResponse.map((data) => Item.fromJson(data)).toList();
    return items;
  }

  getBestKeyWord()async{
    // var res = await http.get(Uri.parse('$host/category/selectBest'));
    var res = await http.get(Uri.parse('https://pickproduct.shop/category/selectBest'));
    List jsonResponse = json.decode(utf8.decode(res.bodyBytes));
    List<Category> categorys = jsonResponse.map((data) => Category.fromJson(data)).toList();
    return categorys;
  }
  getWeeklyBestItem()async{
    // var res = await http.get(Uri.parse('$host/category/selectBest'));
    var res = await http.get(Uri.parse('https://pickproduct.shop/likeProductList/selectWeek'));
    List jsonResponse = json.decode(utf8.decode(res.bodyBytes));
    List<Category> categorys = jsonResponse.map((data) => Category.fromJson(data)).toList();
    return categorys;
  }
  getBestMember()async{
    // var res = await http.get(Uri.parse('$host/category/selectBest'));
    var res = await http.get(Uri.parse('https://pickproduct.shop/likeMember/select'));
    List jsonResponse = json.decode(utf8.decode(res.bodyBytes));
    List<Item> items = jsonResponse.map((data) => Item.fromJson(data)).toList();
    return items;
  }
  getNewItem()async{
    // var res = await http.get(Uri.parse('$host/category/selectBest'));
    var res = await http.get(Uri.parse('https://pickproduct.shop/product/selectList'));
    List jsonResponse = json.decode(utf8.decode(res.bodyBytes));
    List<Item> items = jsonResponse.map((data) => Item.fromJson(data)).toList();
    return items;
  }
}
