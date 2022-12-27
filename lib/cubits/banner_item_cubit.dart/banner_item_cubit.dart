import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swyg/models/item_model.dart';
import 'package:swyg/utils/api.dart';

part 'banner_item_state.dart';
part 'banner_item_cubit.freezed.dart';

class BannerItemCubit extends Cubit<BannerItemState> {
  BannerItemCubit() : super(const BannerItemState.initial(itemList: []));

  getItems() async {
    List<Item> datas = await Api().getbestSelect();
    emit(state.copyWith(itemList: datas));
  }
}
