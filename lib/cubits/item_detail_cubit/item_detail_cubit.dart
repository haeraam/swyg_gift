import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/utils/api.dart';

part 'item_detail_state.dart';
part 'item_detail_cubit.freezed.dart';

class ItemDetailCubit extends Cubit<ItemDetailState> {
  ItemDetailCubit() : super(const ItemDetailState.initial());

  getItem(String itemId) async {
    Item item = await Api().getItem(itemId);
    emit(state.copyWith(item: item));
  }

  clear() {
    emit(state.copyWith(item: Item.empty()));
  }
}
