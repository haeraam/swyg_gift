// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      productId: json['productId'] as int,
      productNm: json['productNm'] as String,
      productCm: json['productCm'] as String?,
      productPrice: json['productPrice'] as String,
      productUrl: json['productUrl'] as String,
      productImg: json['productImg'] as String,
      categoryNm: json['categoryNm'] as List<dynamic>,
      productCnt: json['productCnt'] as int,
      productWcnt: json['productWcnt'] as int,
      memberName: json['memberName'] as String?,
      productCreateDt: json['productCreateDt'] as String,
      productUpdateDt: json['productUpdateDt'] as String,
      productBestCmt: json['productBestCmt'] as String?,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'productId': instance.productId,
      'productNm': instance.productNm,
      'productCm': instance.productCm,
      'productPrice': instance.productPrice,
      'productUrl': instance.productUrl,
      'productImg': instance.productImg,
      'categoryNm': instance.categoryNm,
      'productCnt': instance.productCnt,
      'productWcnt': instance.productWcnt,
      'memberName': instance.memberName,
      'productCreateDt': instance.productCreateDt,
      'productUpdateDt': instance.productUpdateDt,
      'productBestCmt': instance.productBestCmt,
    };
