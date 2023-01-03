part of 'weekly_bset_item_cubit.dart';

@freezed
class WeeklyBsetItemState with _$WeeklyBsetItemState {
  const factory WeeklyBsetItemState.initial({
    required List<Item> itemList,
  }) = _Initial;
}
