part of 'new_item_cubit.dart';

@freezed
class NewItemState with _$NewItemState {
  const factory NewItemState.initial({
    required List<Item> itemList,
  }) = _Initial;
}
