part of 'item_list_cubit.dart';

@freezed
class ItemListState with _$ItemListState {
  const factory ItemListState.initial({
    required List<Item> itemList,
  }) = _Initial;
}
