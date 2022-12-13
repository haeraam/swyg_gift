import 'package:freezed_annotation/freezed_annotation.dart';
part 'item_model.freezed.dart';
part 'item_model.g.dart';

@freezed
class Item with _$Item {
  const factory Item({
    required String productId,
    required String productNm,
    required String productCm,
    required int productPrice,
    required String productUrl,
    required String productImg,
    required List categoryNm,
    required int productCnt,
    required int productWcnt,
    required String memberName,
    required DateTime productCreateDt,
    required DateTime productUpdateDt,
    required String productBestcmt,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
