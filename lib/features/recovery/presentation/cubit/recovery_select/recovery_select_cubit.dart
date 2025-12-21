import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'recovery_select_state.dart';

class RecoverySelectCubit extends Cubit<RecoverySelectState> {
  RecoverySelectCubit() : super(const RecoverySelectInitial());

  void toggleOption(String option) {
    if (state is RecoverySelectLoaded) {
      final current =
      List<String>.from((state as RecoverySelectLoaded).selectedOptions);

      if (current.contains(option)) {
        current.remove(option);
      } else {
        current.add(option);
      }

      emit(RecoverySelectLoaded(current));
    } else {
      // First selection
      emit(RecoverySelectLoaded([option]));
    }
  }

  bool isSelected(String option) {
    if (state is RecoverySelectLoaded) {
      return (state as RecoverySelectLoaded)
          .selectedOptions
          .contains(option);
    }
    return false;
  }
}
