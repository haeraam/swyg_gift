// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ItemList _$$_ItemListFromJson(Map<String, dynamic> json) => _$_ItemList(
      productListId: json['productListId'] as String,
      productListNm: json['productListNm'] as String,
      productListCm: json['productListCm'] as String,
      productImg: json['productImg'] as String,
      productCreateDt: DateTime.parse(json['productCreateDt'] as String),
      productUpdateDt: DateTime.parse(json['productUpdateDt'] as String),
      mnmberName: json['mnmberName'] as String,
      productId: json['productId'] as List<dynamic>,
      prodictListCnt: json['prodictListCnt'] as String,
    );

Map<String, dynamic> _$$_ItemListToJson(_$_ItemList instance) =>
    <String, dynamic>{
      'productListId': instance.productListId,
      'productListNm': instance.productListNm,
      'productListCm': instance.productListCm,
      'productImg': instance.productImg,
      'productCreateDt': instance.productCreateDt.toIso8601String(),
      'productUpdateDt': instance.productUpdateDt.toIso8601String(),
      'mnmberName': instance.mnmberName,
      'productId': instance.productId,
      'prodictListCnt': instance.prodictListCnt,
    };
