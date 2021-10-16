import 'package:droidconit_21_flutter_navigation_demo/common/routing/bloc/routing_event.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/routing/bloc/routing_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutingBloc extends Bloc<RoutingEvent, RoutingState> {
  RoutingBloc() : super(RoutingState(pages: []));

  @override
  Stream<RoutingState> mapEventToState(RoutingEvent event) async* {
    if (event is RoutePopped) {
      if (state.pages.length > 0) {
        yield RoutingState(
            pages: state.pages.sublist(0, state.pages.length - 1));
      }
    } else if(event is RoutePushed) {
      
    }
  }
}
