import 'dart:async';

import 'package:droidconit_21_flutter_navigation_demo/common/routing/app_pages.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/routing/bloc/routing_bloc.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/routing/bloc/routing_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 2),
        () => context
            .read<RoutingBloc>()
            .add(RouteReplaced(newPage: Login_LoginFormConfig)));

    return Scaffold(
        appBar: AppBar(title: Text('Splash')),
        body: Center(child: Text('Splash Page')));
  }
}
