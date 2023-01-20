import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:swyg/models/auth.dart';
import 'package:swyg/models/category_model.dart';
import 'package:swyg/models/item_list_model.dart';
import 'package:swyg/models/item_model.dart';

class Api {
  String host = 'https://pickproduct.shop';

  getUser({required String id}) async {
    var res = await http.get(Uri.parse('$host/member/info?memberId=$id'));
    List jsonResponse = json.decode(utf8.decode(res.bodyBytes));
    return jsonResponse;
  }

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

  getListByCategoryName(String categoryName) async {
    var res = await http.get(Uri.parse('$host/productList/categorySelect?categoryNm=$categoryName'));
    List jsonResponse = json.decode(utf8.decode(res.bodyBytes));
    List<ItemList> itemLists = jsonResponse.map((data) => ItemList.fromJson(data)).toList();
    return itemLists;
  }

  getItemByCategoryName(String categoryName) async {
    var res = await http.get(Uri.parse('$host/product/selectCategory?categoryNm=$categoryName'));
    List jsonResponse = json.decode(utf8.decode(res.bodyBytes));
    List<Item> item = jsonResponse.map((data) => Item.fromJson(data)).toList();
    return item;
  }

  getItem(String itemId) async {
    var res = await http.get(Uri.parse('$host/product/select?productId=$itemId'));
    List jsonResponse = json.decode(utf8.decode(res.bodyBytes));
    Item item = Item.fromJson(jsonResponse[0]);
    return item;
  }

  getList(String itemId) async {
    var res = await http.get(Uri.parse('$host/productList/productListSelect?productListId=$itemId'));
    List jsonResponse = json.decode(utf8.decode(res.bodyBytes));
    ItemList itemLists = ItemList.fromJson(jsonResponse[0]);
    return itemLists;
  }

  getLikeImte() async {
    print('$host/member/mypick?memberNm=${Auth().memberNm}&likeCd=상품');
    var res = await http.get(Uri.parse('$host/member/mypick?memberNm=${Auth().memberNm}&likeCd=상품'));
    List jsonResponse = json.decode(utf8.decode(res.bodyBytes));
    List<Item> items = jsonResponse.map((data) => Item.fromJson(data)).toList();
    return items;
  }

  changeLikeItem({
    required isLike,
    required memberNm,
    required productId,
    required productMemberNm,
  }) async {
    var res = await http.post(Uri.parse('$host/likeProduct/transaction'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          'resist': isLike,
          'memberNm': memberNm,
          'productId': productId,
          'productMemberNm': productMemberNm,
          'likeCd': '1',
        }));
    // var jsonResponse = json.decode(utf8.decode(res.bodyBytes));
    print(utf8.decode(res.bodyBytes));
    // return jsonResponse;
  }

  createList({
    required productListNm,
    required productListCmt,
    required productListPd,
    required categoryNm,
    required memberNm,
  }) async {
    Object body = json.encode({
      'productListNm': productListNm,
      'productListCmt': productListCmt,
      'productListPd': productListPd,
      'categoryNm': categoryNm,
      'memberNm': memberNm,
    });
    var res = await http.post(
      Uri.parse('$host/productList/insert'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    return res;
  }

  createItem({
    required Uint8List image,
    required productNm,
    required productCmt,
    required productPrice,
    required productUrl,
    required catrgoryNm,
    required memberNm,
  }) async {
    var request = http.MultipartRequest("POST", Uri.parse('$host/product/insert'));

    request.headers.addAll({
      "Content-Type": "application/json; charset=utf-8",
    });

    request.fields['productNm'] = productNm;
    request.fields['productCmt'] = productCmt;
    request.fields['productPrice'] = productPrice;
    request.fields['productUrl'] = productUrl;
    // request.fields['catrgoryNm'] = catrgoryNm.toString();
    request.fields['memberNm'] = memberNm;

    int categoryNum = 0;
    for (var category in (catrgoryNm as List)) {
      request.fields['categoryNm[${categoryNum++}]'] = category;
    }

    var file = http.MultipartFile.fromBytes('image', image, filename: 'name');
    // var file = http.MultipartFile('image', image.readAsBytes().asStream(),image.lengthSync());

    request.files.add(file);

    var res = await request.send();
    var itemId = await res.stream.bytesToString();
    return itemId;
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