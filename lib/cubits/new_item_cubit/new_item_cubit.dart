import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swyg/models/item_model.dart';

part 'new_item_state.dart';
part 'new_item_cubit.freezed.dart';

class NewItemCubit extends Cubit<NewItemState> {
  NewItemCubit() : super(const NewItemState.initial(itemList: []));
}
