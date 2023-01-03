part of 'create_item_cubit.dart';

@freezed
class CreateItemState with _$CreateItemState {
  const factory CreateItemState.initial({
    String? productUrl,
    String? productPrice,
    String? productCmt,
    String? productNm,
    String? memberNm,
    List? categoryNm,
    XFile? image,
  }) = _Initial;
}
