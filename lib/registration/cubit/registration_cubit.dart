import 'package:droidconit_21_flutter_navigation_demo/registration/cubit/registration_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationState.initial());

  bool goAhead() {
    if (state.pageIndex < 2) {
      emit(state.copyWith(pageIndex: state.pageIndex + 1));
      return true;
    }
    return false;
  }

  bool goBack() {
    if (state.pageIndex > 0) {
      emit(state.copyWith(pageIndex: state.pageIndex - 1));
      return true;
    }
    return false;
  }

  void finish() {
    emit(state.copyWith(registrationCompleted: true));
  }
}
