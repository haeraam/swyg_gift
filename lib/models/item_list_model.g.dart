// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ItemList _$$_ItemListFromJson(Map<String, dynamic> json) => _$_ItemList(
      productListId: json['productListId'] as int,
      productListPd: json['productListPd'] as List<dynamic>,
      productListNm: json['productListNm'] as String,
      productListCmt: json['productListCmt'] as String,
      categoryNm: json['categoryNm'] as List<dynamic>,
      memberNm: json['memberNm'] as String,
      productListCreateDt: json['productListCreateDt'] as String,
      productListUpdateDt: json['productListUpdateDt'] as String,
      productListCnt: json['productListCnt'] as int,
      productListWcnt: json['productListWcnt'] as int,
      productListBestcmt: json['productListBestcmt'] as String,
      productListLikeCnt: json['productListLikeCnt'] as int,
      products: (json['products'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ItemListToJson(_$_ItemList instance) =>
    <String, dynamic>{
      'productListId': instance.productListId,
      'productListPd': instance.productListPd,
      'productListNm': instance.productListNm,
      'productListCmt': instance.productListCmt,
      'categoryNm': instance.categoryNm,
      'memberNm': instance.memberNm,
      'productListCreateDt': instance.productListCreateDt,
      'productListUpdateDt': instance.productListUpdateDt,
      'productListCnt': instance.productListCnt,
      'productListWcnt': instance.productListWcnt,
      'productListBestcmt': instance.productListBestcmt,
      'productListLikeCnt': instance.productListLikeCnt,
      'products': instance.products,
    };
