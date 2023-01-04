part of 'hot_keyword_item_list_cubit.dart';

@freezed
class HotKeywordItemListState with _$HotKeywordItemListState {
  const factory HotKeywordItemListState.initial({
    required List<ItemList> itemLists,
  }) = _Initial;
}
