/*
I usually name it with a prefix that reflects the name of the application, but in
this case, since the name of the application is 'Todo', it could have sounded like 
something still incomplete
 */

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

import 'app_pages.dart';

class AppRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final List<Page> _pages = [];

  List<MaterialPage> get pages => List.unmodifiable(_pages);

  AppRouterDelegate() : navigatorKey = GlobalKey();

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  void addPage(PageConfiguration pageConfig) {
    if (_canPageBeAdded(pageConfig)) {
      _pages.add(_pageFromConfig(pageConfig));
    }
  }

  bool _canPageBeAdded(PageConfiguration pageConfig) =>
      _pages.isEmpty ||
      (_pages.last.arguments as PageConfiguration).uiPage != pageConfig.uiPage;

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

  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    return tryPop();
  }

  void _removePage(Page? page) {
    if (page != null) {
      _pages.remove(page);
    }
  }

  @override
  Future<bool> popRoute() {
    return Future.value(tryPop());
  }

  /// Try to remove the last page and returns true if the operation succeeded and false otherwise
  bool tryPop() {
    if (_pages.length < 2) {
      return false;
    }

    _removePage(_pages.last);
    return true;
  }
}
