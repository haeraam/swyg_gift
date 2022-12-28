part of 'best_member_cubit.dart';

@freezed
class BestMemberState with _$BestMemberState {
  const factory BestMemberState.initial({
    required List<User> categoryList,
  }) = _Initial;
}
