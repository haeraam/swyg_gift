import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_menu_state.dart';
part 'home_menu_cubit.freezed.dart';

class HomeMenuCubit extends Cubit<HomeMenuState> {
  HomeMenuCubit() : super(const HomeMenuState.initial(pageIndex: 0));

  setIndex({required int index}) {
    emit(state.copyWith(pageIndex: index));
  }
}
