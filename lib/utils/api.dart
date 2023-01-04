import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:swyg/models/category_model.dart';
import 'package:swyg/models/item_model.dart';

class Api {
  String host = 'https://pickproduct.shop';

  getbestSelect() async {
    var res = await http.get(Uri.parse('$host/product/bestSelect'));
    List jsonResponse = json.decode(utf8.decode(res.bodyBytes));
    List<Item> items = jsonResponse.map((data) => Item.fromJson(data)).toList();
    return items;
  }

  getWeeklyBestItem() async {
    var res = await http.get(Uri.parse('$host/likeProductList/selectWeek'));
    List jsonResponse = json.decode(utf8.decode(res.bodyBytes));
    List<Category> categorys = jsonResponse.map((data) => Category.fromJson(data)).toList();
    return categorys;
  }

  getBestMember() async {
    var res = await http.get(Uri.parse('$host/likeMember/select'));
    List jsonResponse = json.decode(utf8.decode(res.bodyBytes));
    return jsonResponse;
  }

  getNewItem() async {
    var res = await http.get(Uri.parse('$host/product/selectList'));
    List jsonResponse = json.decode(utf8.decode(res.bodyBytes));
    List<Item> items = jsonResponse.map((data) => Item.fromJson(data)).toList();
    return items;
  }

  getBestKeyWord() async {
    var res = await http.get(Uri.parse('$host/category/selectBest'));
    List jsonResponse = json.decode(utf8.decode(res.bodyBytes));
    List<Category> categorys = jsonResponse.map((data) => Category.fromJson(data)).toList();
    return categorys;
  }

  getAllCategories() async {
    var res = await http.get(Uri.parse('$host/category/select'));
    List jsonResponse = json.decode(utf8.decode(res.bodyBytes));
    List<Category> categorys = jsonResponse.map((data) => Category.fromJson(data)).toList();
    return categorys;
  }

  createItem({
    required XFile image,
    required productNm,
    required productCmt,
    required productPrice,
    required productUrl,
    required catrgoryNm,
    required memberNm,
  }) async {
    var request = http.MultipartRequest("POST", Uri.parse('$host/product/insert'));

    request.fields['productNm'] = productNm;
    request.fields['productCmt'] = productCmt;
    request.fields['productPrice'] = productPrice;
    request.fields['productUrl'] = productUrl;
    request.fields['catrgoryNm'] = catrgoryNm.toString();
    request.fields['memberNm'] = memberNm;

    var file = http.MultipartFile.fromBytes('imageFileList', await image.readAsBytes());

    request.files.add(file);

    var response = await request.send();
    final jsonBody = json.decode(await response.stream.bytesToString()); // json 응답 값을 decode
    print(jsonBody);
    return response;
  }

  apiTest() async {}
}
// https://pickproduct.shop/likeProductList/selectWeek
// 상품 좋아요 등록
// http://44.204.230.127:8080/likeProduct/insert
// 상품 좋아요 해제
// http://44.204.230.127:8080/likeProduct/delete

// 아이템 등록
// http://44.204.230.127:8080/productList/insert

// 4.센스만점제작자
// http://44.204.230.127:8080/likeMember/select