part of 'my_pick_cubit.dart';

@freezed
class MyPickState with _$MyPickState {
  const factory MyPickState.initial({
    required List<Item> items,
    required List<ItemList> itemLists,
  }) = _Initial;
}
