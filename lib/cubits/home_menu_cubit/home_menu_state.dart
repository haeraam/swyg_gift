part of 'home_menu_cubit.dart';

@freezed
class HomeMenuState with _$HomeMenuState {
  const factory HomeMenuState.initial({
    required int pageIndex,
  }) = _Initial;
}
