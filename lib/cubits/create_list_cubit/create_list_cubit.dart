import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swyg/models/category_model.dart';
import 'package:swyg/utils/api.dart';

part 'create_list_state.dart';
part 'create_list_cubit.freezed.dart';

class CreateListCubit extends Cubit<CreateListState> {
  CreateListCubit() : super(const CreateListState.initial());

  reset() {
    emit(const CreateListState.initial());
  }

  setCategories(List<Category> newCategories) {
    emit(state.copyWith(categoryNm: newCategories));
  }

  setProductListNm(String productListNm) {
    emit(state.copyWith(productListNm: productListNm));
  }

  setProductListCmt(String productListCmt) {
    emit(state.copyWith(productListCmt: productListCmt));
  }

  setProductListPd(List<int> productListPd) {
    emit(state.copyWith(productListPd: productListPd));
  }

  createList({
    required productListNm,
    required productListCmt,
    required productListPd,
    required categoryNm,
    required memberNm,
  }) async {
    String listId = await Api().createList(
      productListNm: productListNm,
      productListCmt: productListCmt,
      productListPd: productListPd,
      categoryNm: categoryNm,
      memberNm: memberNm,
    );
    print(listId);

    emit(state.copyWith(createListId: listId));
  }
}
