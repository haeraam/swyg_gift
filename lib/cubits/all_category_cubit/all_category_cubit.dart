import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swyg/models/category_model.dart';
import 'package:swyg/utils/api.dart';

part 'all_category_state.dart';
part 'all_category_cubit.freezed.dart';

class AllCategoryCubit extends Cubit<AllCategoryState> {
  AllCategoryCubit() : super(const AllCategoryState.initial(categoryList: []));

  getCategorys() async {
    List<Category> datas = await Api().getAllCategories();
    emit(state.copyWith(categoryList: datas));
  }
}
