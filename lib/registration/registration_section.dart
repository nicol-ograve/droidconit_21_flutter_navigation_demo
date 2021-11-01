import 'package:droidconit_21_flutter_navigation_demo/common/routing/bloc/routing_bloc.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/routing/bloc/routing_event.dart';
import 'package:droidconit_21_flutter_navigation_demo/registration/cubit/registration_cubit.dart';
import 'package:droidconit_21_flutter_navigation_demo/registration/cubit/registration_state.dart';
import 'package:droidconit_21_flutter_navigation_demo/registration/routing/registration_router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationSection extends StatelessWidget {
  const RegistrationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final childBackButtonDispatcher = Router.of(context)
        .backButtonDispatcher!
        .createChildBackButtonDispatcher();
    childBackButtonDispatcher.takePriority();
    return BlocProvider<RegistrationCubit>(
        create: (context) => RegistrationCubit(),
        child: Builder(
            builder: (context) => BlocListener<RegistrationCubit, RegistrationState>(
              listenWhen: (previous, current) => !previous.registrationCompleted && current.registrationCompleted,
                  listener: (context, state) {
                    context.read<RoutingBloc>().add(RoutePopped());
                  },
                  child: Scaffold(
                      appBar: AppBar(
                        title: Text('Registration'),
                      ),
                      body: Router(
                        routerDelegate: RegistrationRouterDelegate(
                            registrationCubit:
                                context.read<RegistrationCubit>()),
                        backButtonDispatcher: childBackButtonDispatcher,
                      )),
                )));
  }
}
