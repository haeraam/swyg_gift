part of 'create_list_cubit.dart';

@freezed
class CreateListState with _$CreateListState {
  const factory CreateListState.initial({
    String? productListNm,
    String? productListCmt,
    List<int>? productListPd,
    List<Category>? categoryNm,
    String? memberNm,
    String? createListId
  }) = _Initial;
}
