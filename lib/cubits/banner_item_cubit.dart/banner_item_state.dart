part of 'banner_item_cubit.dart';

@freezed
class BannerItemState with _$BannerItemState {
  const factory BannerItemState.initial({
    required List<Item> itemList,
  }) = _Initial;
}
