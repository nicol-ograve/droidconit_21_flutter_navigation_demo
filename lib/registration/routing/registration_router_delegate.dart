import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:droidconit_21_flutter_navigation_demo/registration/account_registration_page.dart';
import 'package:droidconit_21_flutter_navigation_demo/registration/add_payment_method_page.dart';
import 'package:droidconit_21_flutter_navigation_demo/registration/cubit/registration_cubit.dart';
import 'package:droidconit_21_flutter_navigation_demo/registration/cubit/registration_state.dart';
import 'package:droidconit_21_flutter_navigation_demo/registration/user_data_registration_form.dart';

class RegistrationRouterDelegate extends RouterDelegate with ChangeNotifier {
  final GlobalKey<NavigatorState> _nestedNavigatorKey =
      GlobalKey<NavigatorState>();

  final RegistrationCubit registrationCubit;
  RegistrationRouterDelegate({
    required this.registrationCubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) => Navigator(
              key: _nestedNavigatorKey,
              onPopPage: onPopPage,
              pages: [
                MaterialPage(
                    key: ValueKey('AccountRegistrationPage'),
                    child: AccountRegistrationPage()),
                if (state.pageIndex >= 1)
                  MaterialPage(
                      key: ValueKey('UserDataRegistrationPage'),
                      child: UserDataRegistrationPage()),
                if (state.pageIndex >= 2)
                  MaterialPage(
                      key: ValueKey('AddPaymentMethodPage'),
                      child: AddPaymentMethodPage()),
              ],
            ));
  }

  bool onPopPage(Route route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    if (registrationCubit.goBack()) {
      return true;
    }
    return false;
  }

  @override
  Future<bool> popRoute() async {
    if (registrationCubit.goBack()) {
      return true;
    }
    return false;
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
