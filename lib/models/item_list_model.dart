import 'package:freezed_annotation/freezed_annotation.dart';
part 'item_list_model.freezed.dart';
part 'item_list_model.g.dart';

@freezed
class ItemList with _$ItemList {
  const factory ItemList({
    required String productListId,
    required String productListNm,
    required String productListCm,
    required String productImg,
    required DateTime productCreateDt,
    required DateTime productUpdateDt,
    required String mnmberName,
    required List productId,
    required String prodictListCnt,
  }) = _ItemList;

  factory ItemList.fromJson(Map<String, dynamic> json) => _$ItemListFromJson(json);
}
