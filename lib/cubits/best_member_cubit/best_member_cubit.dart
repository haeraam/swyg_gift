import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swyg/models/user_model.dart';

part 'best_member_state.dart';
part 'best_member_cubit.freezed.dart';

class BestMemberCubit extends Cubit<BestMemberState> {
  BestMemberCubit() : super(const BestMemberState.initial(categoryList: []));
}
