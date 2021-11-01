/*
I usually name it with a prefix that reflects the name of the application, but in
this case, since the name of the application is 'Todo', it could have sounded like 
something still incomplete
 */

import 'package:droidconit_21_flutter_navigation_demo/common/routing/bloc/routing_bloc.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/routing/bloc/routing_event.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/routing/bloc/routing_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_pages.dart';

class AppRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final RoutingBloc routingBloc;

  AppRouterDelegate({required this.routingBloc}) : navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoutingBloc, RoutingState>(
        builder: (BuildContext context, RoutingState state) {
      return Navigator(
        key: navigatorKey,
        onPopPage: _onPopPage,
        pages: state.pages,
      );
    });
  }

  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    return _tryPop();
  }

  @override
  Future<bool> popRoute() {
    return Future.value(_tryPop());
  }

  /// Try to remove the last page and returns true if the operation succeeded and false otherwise
  bool _tryPop() {
    if (routingBloc.canPop()) {
      routingBloc.add(RoutePopped());
      return true;
    }else {
      return false;
    }
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) {
    routingBloc.add(AllRoutesReplaced(newPages: [configuration]));
    return SynchronousFuture(null);
  }
}
