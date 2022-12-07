import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swyg/models/item_model.dart';

part 'item_list_state.dart';
part 'item_list_cubit.freezed.dart';

class ItemListCubit extends Cubit<ItemListState> {
  ItemListCubit({required List<Item> initialList}) : super(ItemListState.initial(itemList: initialList));

  void setItems(List<Item> items) {
    emit(state.copyWith(itemList: items));
  }

  void addItems(Item item) {
    emit(state.copyWith(itemList: [
      ...state.itemList,
      item,
    ]));
  }
}
