import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swyg/models/category_model.dart';
import 'package:swyg/utils/api.dart';

part 'create_item_state.dart';
part 'create_item_cubit.freezed.dart';

class CreateItemCubit extends Cubit<CreateItemState> {
  CreateItemCubit() : super(const CreateItemState.initial());

  reset() {
    emit(const CreateItemState.initial());
  }

  setCategories(List<Category> newCategories) {
    emit(state.copyWith(categoryNm: newCategories));
  }

  setImages(Uint8List image) {
    emit(state.copyWith(image: image));
  }

  setUrl(String url) {
    emit(state.copyWith(productUrl: url));
  }

  setComent(String coment) {
    emit(state.copyWith(productCmt: coment));
  }

  setItemName(String name) {
    emit(state.copyWith(productNm: name));
  }

  createItem({
    required image,
    required productNm,
    required productCmt,
    required productPrice,
    required productUrl,
    required catrgoryNm,
    required memberNm,}) async {
    await Api().createItem(
      image: image,
      productNm: productNm,
      productCmt: productCmt,
      productPrice: productPrice,
      productUrl: productUrl,
      catrgoryNm: catrgoryNm,
      memberNm: memberNm,
    );
    emit(const CreateItemState.initial());
  }
}
