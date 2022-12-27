part of 'best_category_cubit.dart';

@freezed
class BestCategoryState with _$BestCategoryState {
  const factory BestCategoryState.initial({
    required List<Category> categoryList,
  }) = _Initial;
}
