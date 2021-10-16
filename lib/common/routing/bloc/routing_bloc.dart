import 'package:droidconit_21_flutter_navigation_demo/common/routing/app_pages.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/routing/bloc/routing_event.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/routing/bloc/routing_state.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/error_page.dart';
import 'package:droidconit_21_flutter_navigation_demo/home/home_page.dart';
import 'package:droidconit_21_flutter_navigation_demo/login/login_page.dart';
import 'package:droidconit_21_flutter_navigation_demo/registration/account_registration_page.dart';
import 'package:droidconit_21_flutter_navigation_demo/registration/add_payment_method_page.dart';
import 'package:droidconit_21_flutter_navigation_demo/registration/user_data_registration_form.dart';
import 'package:droidconit_21_flutter_navigation_demo/settings/account_page.dart';
import 'package:droidconit_21_flutter_navigation_demo/settings/change_password_page.dart';
import 'package:droidconit_21_flutter_navigation_demo/settings/settings_page.dart';
import 'package:droidconit_21_flutter_navigation_demo/splash/splash_page.dart';
import 'package:droidconit_21_flutter_navigation_demo/todo/todo_create_page.dart';
import 'package:droidconit_21_flutter_navigation_demo/todo/todo_detail_page.dart';
import 'package:droidconit_21_flutter_navigation_demo/todo/todo_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    } else if (event is RoutePushed) {
      yield RoutingState(
          pages: List<Page>.from(state.pages)
            ..add(_pageFromConfig(event.newPage)));
    } else if (event is RouteReplaced) {
      yield RoutingState(
          pages: state.pages.sublist(0, state.pages.length - 1)
            ..add(_pageFromConfig(event.newPage)));
    } else if (event is AllRoutesReplaced) {
      yield RoutingState(
          pages: event.newPages.map((pageConfig) {
        return _pageFromConfig(pageConfig);
      }).toList());
    }
  }

  MaterialPage _pageFromConfig(PageConfiguration pageConfig) {
    switch (pageConfig.section) {
      case Sections.Splash:
        return _createPage(SplashPage(), pageConfig);
      case Sections.Home:
        return _createPage(HomePage(), pageConfig);
      case Sections.UserRegistration:
        switch (pageConfig.uiPage) {
          case Pages.UserRegistration_AccountForm:
            return _createPage(AccountRegistrationPage(), pageConfig);
          case Pages.UserRegistration_UserDataForm:
            return _createPage(UserDataRegistrationPage(), pageConfig);
          default:
            return _createPage(AddPaymentMethodPage(), pageConfig);
        }
      case Sections.Login:
        return _createPage(LoginPage(), pageConfig);
      case Sections.Settings:
        switch (pageConfig.uiPage) {
          case Pages.Settings_List:
            return _createPage(SettingsPage(), pageConfig);
          case Pages.Settings_Account:
            return _createPage(AccountPage(), pageConfig);
          default:
            return _createPage(ChangePasswordPage(), pageConfig);
        }
      case Sections.Todo:
        switch (pageConfig.uiPage) {
          case Pages.Todo_List:
            return _createPage(TodoListPage(), pageConfig);
          case Pages.Todo_Detail:
            return _createPage(TodoDetailPage(), pageConfig);
          default:
            return _createPage(TodoCreatePage(), pageConfig);
        }
      default:
        return _createPage(ErrorPage(), pageConfig);
    }
  }

  MaterialPage _createPage(Widget child, PageConfiguration pageConfig) {
    return MaterialPage(
        child: child,
        key: ValueKey(pageConfig.path),
        name: pageConfig.path,
        arguments: pageConfig);
  }
}
