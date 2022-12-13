// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  String get categoryId => throw _privateConstructorUsedError;
  String get categoryNm => throw _privateConstructorUsedError;
  int get categoryCd => throw _privateConstructorUsedError;
  String get categoryRef1 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call(
      {String categoryId,
      String categoryNm,
      int categoryCd,
      String categoryRef1});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryNm = null,
    Object? categoryCd = null,
    Object? categoryRef1 = null,
  }) {
    return _then(_value.copyWith(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryNm: null == categoryNm
          ? _value.categoryNm
          : categoryNm // ignore: cast_nullable_to_non_nullable
              as String,
      categoryCd: null == categoryCd
          ? _value.categoryCd
          : categoryCd // ignore: cast_nullable_to_non_nullable
              as int,
      categoryRef1: null == categoryRef1
          ? _value.categoryRef1
          : categoryRef1 // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$$_CategoryCopyWith(
          _$_Category value, $Res Function(_$_Category) then) =
      __$$_CategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String categoryId,
      String categoryNm,
      int categoryCd,
      String categoryRef1});
}

/// @nodoc
class __$$_CategoryCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$_Category>
    implements _$$_CategoryCopyWith<$Res> {
  __$$_CategoryCopyWithImpl(
      _$_Category _value, $Res Function(_$_Category) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryNm = null,
    Object? categoryCd = null,
    Object? categoryRef1 = null,
  }) {
    return _then(_$_Category(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryNm: null == categoryNm
          ? _value.categoryNm
          : categoryNm // ignore: cast_nullable_to_non_nullable
              as String,
      categoryCd: null == categoryCd
          ? _value.categoryCd
          : categoryCd // ignore: cast_nullable_to_non_nullable
              as int,
      categoryRef1: null == categoryRef1
          ? _value.categoryRef1
          : categoryRef1 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Category implements _Category {
  const _$_Category(
      {required this.categoryId,
      required this.categoryNm,
      required this.categoryCd,
      required this.categoryRef1});

  factory _$_Category.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryFromJson(json);

  @override
  final String categoryId;
  @override
  final String categoryNm;
  @override
  final int categoryCd;
  @override
  final String categoryRef1;

  @override
  String toString() {
    return 'Category(categoryId: $categoryId, categoryNm: $categoryNm, categoryCd: $categoryCd, categoryRef1: $categoryRef1)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Category &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryNm, categoryNm) ||
                other.categoryNm == categoryNm) &&
            (identical(other.categoryCd, categoryCd) ||
                other.categoryCd == categoryCd) &&
            (identical(other.categoryRef1, categoryRef1) ||
                other.categoryRef1 == categoryRef1));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, categoryId, categoryNm, categoryCd, categoryRef1);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryCopyWith<_$_Category> get copyWith =>
      __$$_CategoryCopyWithImpl<_$_Category>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  const factory _Category(
      {required final String categoryId,
      required final String categoryNm,
      required final int categoryCd,
      required final String categoryRef1}) = _$_Category;

  factory _Category.fromJson(Map<String, dynamic> json) = _$_Category.fromJson;

  @override
  String get categoryId;
  @override
  String get categoryNm;
  @override
  int get categoryCd;
  @override
  String get categoryRef1;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryCopyWith<_$_Category> get copyWith =>
      throw _privateConstructorUsedError;
}
