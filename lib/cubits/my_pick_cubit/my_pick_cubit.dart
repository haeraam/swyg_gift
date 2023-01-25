import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swyg/models/item_list_model.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/utils/api.dart';

part 'my_pick_state.dart';
part 'my_pick_cubit.freezed.dart';

class MyPickCubit extends Cubit<MyPickState> {
  MyPickCubit() : super(const MyPickState.initial(itemLists: [], items: []));

  getLikes() async {
    List<Item> items = await Api().getLikeItems();
    List<ItemList> lists = await Api().getLikeLists();
    emit(state.copyWith(items: items, itemLists: lists));
  }
}
