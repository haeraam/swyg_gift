import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swyg/models/category_model.dart';

part 'best_category_state.dart';
part 'best_category_cubit.freezed.dart';

class BestCategoryCubit extends Cubit<BestCategoryState> {
  BestCategoryCubit() : super(const BestCategoryState.initial(categoryList: []));
}
