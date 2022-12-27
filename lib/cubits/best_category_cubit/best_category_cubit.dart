import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swyg/models/category_model.dart';
import 'package:swyg/utils/api.dart';

part 'best_category_state.dart';
part 'best_category_cubit.freezed.dart';

class BestCategoryCubit extends Cubit<BestCategoryState> {
  BestCategoryCubit() : super(const BestCategoryState.initial(categoryList: []));

    getCategorys() async {
    List<Category> datas = await Api().getBestKeyWord();
    emit(state.copyWith( categoryList: datas));
  }
}
