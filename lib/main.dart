import 'package:droidconit_21_flutter_navigation_demo/common/routing/app_pages.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/routing/app_route_information_parser.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/routing/bloc/routing_bloc.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/routing/routes_configuration_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/routing/app_router_delegate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RoutingBloc>(
        create: (context) =>
            RoutingBloc(routeConfigurationParser: RouteConfigurationParser()),
        child: AppBuilder());
  }
}

class AppBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppContent(
      routingBloc: context.read<RoutingBloc>(),
    );
  }
}

class AppContent extends StatelessWidget {
  late final AppRouterDelegate _routerDelegate;
  final _routeInformationParser = AppRouteInformationParser();
  final _backButtonDispatcher = RootBackButtonDispatcher();

  AppContent({Key? key, required RoutingBloc routingBloc}) : super(key: key) {
    _routerDelegate = AppRouterDelegate(
      routingBloc: routingBloc,
      configurationParser: RouteConfigurationParser()
      );
    //_routerDelegate.setNewRoutePath(SplashPageConfig);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Todo List',
        routerDelegate: _routerDelegate,
        routeInformationParser: _routeInformationParser,
        backButtonDispatcher: _backButtonDispatcher);
  }
}
