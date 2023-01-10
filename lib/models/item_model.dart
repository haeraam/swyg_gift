import 'package:freezed_annotation/freezed_annotation.dart';
part 'item_model.freezed.dart';
part 'item_model.g.dart';

@freezed
class Item with _$Item {
  const factory Item({
    required int productId,
    required String productNm,
    required String? productCm,
    required String productPrice,
    required String productUrl,
    required String productImg,
    required List categoryNm,
    required String productCmt,
    required int productWcnt,
    required String? memberNm,
    required String productCreateDt,
    required String productUpdateDt,
    required String? productBestCmt,
  }) = _Item;

  factory Item.empty() => const Item(
        productId: 0,
        productNm: '',
        productCm: '',
        productPrice: '',
        productUrl: '',
        productImg: '',
        categoryNm: [],
        productCmt: '',
        productWcnt: 0,
        memberNm: '',
        productCreateDt: '',
        productUpdateDt: '',
        productBestCmt: '',
      );

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
