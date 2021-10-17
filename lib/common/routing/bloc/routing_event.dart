import 'package:droidconit_21_flutter_navigation_demo/common/routing/app_pages.dart';
import 'package:equatable/equatable.dart';

abstract class RoutingEvent extends Equatable {
  const RoutingEvent();

  @override
  List<Object?> get props => [];
}

///
/// Restore the state after the consumption of the event
class RoutingReset extends RoutingEvent {}

class RoutePopped extends RoutingEvent {}

class RoutePushed extends RoutingEvent {
  final PageConfiguration newPage;
  const RoutePushed({required this.newPage});

  @override
  List<Object?> get props => [newPage];
}

class RouteReplaced extends RoutingEvent {
  final PageConfiguration newPage;
  const RouteReplaced({required this.newPage});

  @override
  List<Object?> get props => [newPage];
}

class AllRoutesReplaced extends RoutingEvent {
  final List<PageConfiguration> newPages;
  const AllRoutesReplaced({required this.newPages});

  @override
  List<Object?> get props => [newPages];
}
