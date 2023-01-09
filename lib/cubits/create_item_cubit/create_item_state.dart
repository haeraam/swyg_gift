part of 'create_item_cubit.dart';

@freezed
class CreateItemState with _$CreateItemState {
  const factory CreateItemState.initial({
    String? productUrl,
    String? productPrice,
    String? productCmt,
    String? productNm,
    String? memberNm,
    List<Category>? categoryNm,
    Uint8List? image,
  }) = _Initial;
}
