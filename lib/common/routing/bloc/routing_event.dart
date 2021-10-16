import 'package:droidconit_21_flutter_navigation_demo/common/routing/app_pages.dart';
import 'package:equatable/equatable.dart';

abstract class RoutingEvent extends Equatable {
  const RoutingEvent();

  @override
  List<Object?> get props => [];
}

class RoutePopped extends RoutingEvent {}

class RoutePushed extends RoutingEvent {
  final PageConfiguration pageConfiguration;
  const RoutePushed({required this.pageConfiguration});

  @override
  List<Object?> get props => [pageConfiguration];
}

class RouteReplaced extends RoutingEvent {
  final PageConfiguration pageConfiguration;
  const RouteReplaced({required this.pageConfiguration});

  @override
  List<Object?> get props => [pageConfiguration];
}

class RouteReplacedAll extends RoutingEvent {
  final List<PageConfiguration> pageConfigurations;
  const RouteReplacedAll({required this.pageConfigurations});

  @override
  List<Object?> get props => [pageConfigurations];
}
