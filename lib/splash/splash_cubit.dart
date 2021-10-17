import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<bool> {
  SplashCubit(bool initialState) : super(false){
    Timer.periodic(Duration(seconds: 3), (timer) {

    });
  }

}