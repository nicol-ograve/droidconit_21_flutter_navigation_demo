import 'package:droidconit_21_flutter_navigation_demo/common/routing/app_pages.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/routing/bloc/routing_event.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/routing/bloc/routing_state.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/routing/page_from_config_parser.dart';
import 'package:collection/collection.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutingBloc extends Bloc<RoutingEvent, RoutingState> {
  final PageConfigurationParser configurationParser;

  RoutingBloc({required PageConfigurationParser routeConfigurationParser})
      : this.configurationParser = routeConfigurationParser,
        super(RoutingState(pages: [
          routeConfigurationParser.pageFromConfig(SplashPageConfig)
        ]));

  @override
  Stream<RoutingState> mapEventToState(RoutingEvent event) async* {
    final pages = state.pages;
    if (event is RoutePopped) {
      if (canPop()) {
        yield RoutingState(pages: pages.sublist(0, pages.length - 1));
      }
    } else if (event is RoutePushed) {
      if (pages.isNotEmpty &&
          (pages.last.key as ValueKey).value != event.newPage.path)
        yield RoutingState(
            pages: List<Page>.from(pages)
              ..add(configurationParser.pageFromConfig(event.newPage)));
    } else if (event is LastRouteReplaced) {
      yield RoutingState(
          pages: pages.sublist(0, pages.length - 1)
            ..add(configurationParser.pageFromConfig(event.newPage)));
    } else if (event is AllRoutesReplaced) {
      if (_isPagesListNew(event.newPages)) {
        yield RoutingState(
            pages: event.newPages.map((pageConfig) {
          return configurationParser.pageFromConfig(pageConfig);
        }).toList());
      }
    }
  }

  bool canPop() => state.pages.length > 1;

  bool _isPagesListNew(List<PageConfiguration> newPages) {
    return !IterableEquality().equals(
        state.pages.map((e) => (e.key as ValueKey).value),
        newPages.map((e) => e.path));
  }
}
