import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required int categoryId,
    required String categoryNm,
    required String categoryCd,
    required int categoryCnt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}
