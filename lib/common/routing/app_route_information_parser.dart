import 'package:flutter/material.dart';

import 'app_pages.dart';

class ChargeCarRouteInformationParser
    extends RouteInformationParser<PageConfiguration> {
  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    if (routeInformation.location == null) {
      return ErrorPageConfig;
    }

    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isEmpty) {
      return SplashPageConfig;
    }

    // final queryParam = uri.queryParameters;

    final sectionPath = '/' + uri.pathSegments[0];
    final pagePath = '/' + uri.pathSegments[0] + uri.pathSegments[1];

    switch (sectionPath) {
      case HomePath:
        switch (pagePath) {
          case HomePath:
            return HomePageConfig;
          default:
            return ErrorPageConfig;
        }

      case LoginPath:
        switch (pagePath) {
          case LoginFormPath:
            return Login_LoginFormConfig;
          default:
            return ErrorPageConfig;
        }

      case RegistrationPath:
        switch (pagePath) {
          case AccountRegistrationPath:
            return AccountRegistrationPageConfig;
          case UserDataRegistrationPath:
            return UserDataRegistrationPageConfig;
          case AddPaymentMethodPath:
            return AddPaymentMethodPageConfig;
          default:
            return ErrorPageConfig;
        }

      case TodoPath:
        switch (pagePath) {
          case TodoPath:
            return TodosListPageConfig;
          case TodoDetailPath:
            if (uri.pathSegments.length >= 3) {
              return TodoDetailPageConfig(
                  // In a production case, additional verifications are required
                  todoId: int.parse(uri.pathSegments[2]));
            }
            return ErrorPageConfig;
          case TodoCreatePath:
            return TodosCreatePageConfig;
          default:
            return ErrorPageConfig;
        }

      case SettingsPath:
        switch (pagePath) {
          case SettingsPath:
            return SettingsListPageConfig;
          case SettingsAccountPath:
            return SettingsAccountPageConfig;
          case SettingsChangePasswordPath:
            return SettingsChangePasswordPageConfig;
          default:
            return ErrorPageConfig;
        }

      default:
        return ErrorPageConfig;
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    switch (configuration.section) {
      case Sections.Home:
        switch (configuration.uiPage) {
          case Pages.Home:
            return const RouteInformation(location: HomePath);
          default:
            return const RouteInformation(location: ErrorPath);
        }
      case Sections.Login:
        switch (configuration.uiPage) {
          case Pages.Login_Form:
            return const RouteInformation(location: LoginFormPath);
          default:
            return const RouteInformation(location: ErrorPath);
        }

      case Sections.UserRegistration:
        switch (configuration.uiPage) {
          case Pages.UserRegistration_AccountForm:
            return const RouteInformation(location: AccountRegistrationPath);
          case Pages.UserRegistration_UserDataForm:
            return const RouteInformation(location: UserDataRegistrationPath);
          case Pages.UserRegistration_PaymentMethod:
            return const RouteInformation(location: AddPaymentMethodPath);
          default:
            return const RouteInformation(location: ErrorPath);
        }

      case Sections.Todo:
        switch (configuration.uiPage) {
          case Pages.Todo_List:
            return const RouteInformation(location: TodoPath);
          case Pages.Todo_Create:
            return const RouteInformation(location: TodoCreatePath);
          case Pages.Todo_Detail:
            if (configuration is TodoDetailPageConfig) {
              return RouteInformation(
                  location: '$TodoDetailPath/${configuration.todoId}');
            }
            return const RouteInformation(location: ErrorPath);
          default:
            return const RouteInformation(location: ErrorPath);
        }

      case Sections.Settings:
        switch (configuration.uiPage) {
          case Pages.Settings_List:
            return const RouteInformation(location: SettingsPath);
          case Pages.Settings_Account:
            return const RouteInformation(location: SettingsAccountPath);
          case Pages.Settings_ChangePassword:
            return const RouteInformation(location: SettingsChangePasswordPath);
          default:
            return const RouteInformation(location: ErrorPath);
        }

      case Sections.Error:
      default:
        return const RouteInformation(location: ErrorPath);
    }
  }
}
