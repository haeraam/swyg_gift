import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/utils/api.dart';

part 'weekly_bset_item_state.dart';
part 'weekly_bset_item_cubit.freezed.dart';

class WeeklyBsetItemCubit extends Cubit<WeeklyBsetItemState> {
  WeeklyBsetItemCubit() : super(const WeeklyBsetItemState.initial(itemList: []));

  getItems() async {
    List<Item> datas = await Api().getbestSelect();
    emit(state.copyWith(itemList: datas));
  }
}
