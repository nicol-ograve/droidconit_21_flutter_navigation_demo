import 'package:droidconit_21_flutter_navigation_demo/common/routing/app_pages.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/error_page.dart';
import 'package:droidconit_21_flutter_navigation_demo/home/home_page.dart';
import 'package:droidconit_21_flutter_navigation_demo/login/login_page.dart';
import 'package:droidconit_21_flutter_navigation_demo/registration/account_registration_page.dart';
import 'package:droidconit_21_flutter_navigation_demo/registration/add_payment_method_page.dart';
import 'package:droidconit_21_flutter_navigation_demo/registration/registration_section.dart';
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

///
/// Class responsible for the conversion of PageConfigurations into MaterialPages
class PageConfigurationParser {
  Page pageFromConfig(PageConfiguration pageConfig) {
    switch (pageConfig.section) {
      case Sections.Splash:
        return _createPage(SplashPage(), pageConfig);
      case Sections.Home:
        return _createPage(HomePage(), pageConfig);
      case Sections.UserRegistration:
        switch (pageConfig.uiPage) {
          case Pages.UserRegistration_AccountForm:
            return _createPage(RegistrationSection(), pageConfig);
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
            if (pageConfig is TodoDetailPageConfig)
              return _createPage(
                  TodoDetailPage(todoId: pageConfig.todoId), pageConfig);
            else
              return _createPage(ErrorPage(), pageConfig);

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
        name: pageConfig.path);
  }
}
