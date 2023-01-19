import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swyg/models/item_list_model.dart';
import 'package:swyg/utils/api.dart';

part 'list_detail_state.dart';
part 'list_detail_cubit.freezed.dart';

class ListDetailCubit extends Cubit<ListDetailState> {
  ListDetailCubit() : super(const ListDetailState.initial());


  getList(String itemId) async {
    ItemList itemList = await Api().getList(itemId);
    emit(state.copyWith(itemList: itemList));
  }

  clear() {
    emit(state.copyWith(itemList: ItemList.empty()));
  }
}
