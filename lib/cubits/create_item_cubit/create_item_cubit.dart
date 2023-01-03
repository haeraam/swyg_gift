import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swyg/models/category_model.dart';

part 'create_item_state.dart';
part 'create_item_cubit.freezed.dart';

class CreateItemCubit extends Cubit<CreateItemState> {
  CreateItemCubit() : super(const CreateItemState.initial());

  setCategories(List<Category> newCategories) {
    emit(state.copyWith(categoryNm: newCategories));
  }

  setImages(XFile image) {
    emit(state.copyWith(image: image));
  }

  setUrl(String url) {
    emit(state.copyWith(productUrl: url));
  }
}
