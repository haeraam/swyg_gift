part of 'all_category_cubit.dart';

@freezed
class AllCategoryState with _$AllCategoryState {
  const factory AllCategoryState.initial({
    required List<Category> categoryList,
  }) = _Initial;
}
