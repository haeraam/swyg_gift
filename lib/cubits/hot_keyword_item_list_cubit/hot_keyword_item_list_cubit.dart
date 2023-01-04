import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swyg/models/item_list_model.dart';
import 'package:swyg/utils/api.dart';

part 'hot_keyword_item_list_state.dart';
part 'hot_keyword_item_list_cubit.freezed.dart';

class HotKeywordItemListCubit extends Cubit<HotKeywordItemListState> {
  HotKeywordItemListCubit() : super(const HotKeywordItemListState.initial(itemLists: []));

  getItemListByCategory(String categoryName) async {
    List<ItemList> datas = await Api().getListByCategoryName(categoryName);
    emit(state.copyWith(itemLists: datas));
  }
}
