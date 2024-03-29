import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swyg/models/item_model.dart';
part 'item_list_model.freezed.dart';
part 'item_list_model.g.dart';

@freezed
class ItemList with _$ItemList {
  const factory ItemList({
    required int productListId,
    required List<dynamic> productListPd,
    required String productListNm,
    required String productListCmt,
    required List<dynamic> categoryNm,
    required String memberNm,
    required String productListCreateDt,
    required String productListUpdateDt,
    required int productListCnt,
    required int productListWcnt,
    required String productListBestcmt,
    required int productListLikeCnt,
    required List<Item> products,
  }) = _ItemList;

  factory ItemList.empty() => const ItemList(
        productListId: 0,
        productListPd: [],
        productListNm: '',
        productListCmt: '',
        categoryNm: [],
        memberNm: '',
        productListCreateDt: '',
        productListUpdateDt: '',
        productListCnt: 0,
        productListWcnt: 0,
        productListBestcmt: '',
        productListLikeCnt: 0,
        products: [],
      );

  factory ItemList.fromJson(Map<String, dynamic> json) => _$ItemListFromJson(json);
}
