import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  // // var res = await http.get(Uri.parse('http://44.204.230.127:8080/product/bestSelect'));
  // // var res = await http.get(Uri.parse('http://44.204.230.127:8080/category/selectBest'));
  // // var res = await http.get(Uri.parse('http://44.204.230.127:8080/likeProductList/selectWeek'));
  // var res = await http.get(Uri.parse('http://44.204.230.127:8080/likeMember/select'));
  // List jsonResponse = json.decode(utf8.decode(res.bodyBytes));
  // print(jsonResponse);
  // for (var item in jsonResponse) {
  //   print(item);
  // }

  test() async {
    var res = await http.get(Uri.parse('http://44.204.230.127:8080/product/bestSelect'));
    List jsonResponse = json.decode(utf8.decode(res.bodyBytes));
    return res;
  }
}
