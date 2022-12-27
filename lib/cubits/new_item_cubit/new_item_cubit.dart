import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/utils/api.dart';

part 'new_item_state.dart';
part 'new_item_cubit.freezed.dart';

class NewItemCubit extends Cubit<NewItemState> {
  NewItemCubit() : super(const NewItemState.initial(itemList: []));

  getItems() async {
    List<Item> datas = await Api().getNewItem();
    emit(state.copyWith(itemList: datas));
  }
}
