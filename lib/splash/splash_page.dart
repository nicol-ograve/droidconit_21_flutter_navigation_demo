import 'package:droidconit_21_flutter_navigation_demo/common/routing/app_pages.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/routing/bloc/routing_bloc.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/routing/bloc/routing_event.dart';
import 'package:droidconit_21_flutter_navigation_demo/splash/cubit/splash_cubit.dart';
import 'package:droidconit_21_flutter_navigation_demo/splash/cubit/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
        create: (context) => SplashCubit(), child: _SplashScreen());
  }
}

class _SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
        listenWhen: (previous, current) =>
            !previous.mustGoAhead && current.mustGoAhead,
        listener: (context, state) => context
            .read<RoutingBloc>()
            .add(LastRouteReplaced(newPage: HomePageConfig)),
        child: Scaffold(
            appBar: AppBar(title: Text('Splash')),
            body: Center(child: Text('Splash Page'))));
  }
}
