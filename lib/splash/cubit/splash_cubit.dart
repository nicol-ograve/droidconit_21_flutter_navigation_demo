import 'dart:async';

import 'package:droidconit_21_flutter_navigation_demo/splash/cubit/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState(mustGoAhead: false)){
    Future.delayed(Duration(seconds: 3), () => emit(SplashState(mustGoAhead: true)));
  }
}
