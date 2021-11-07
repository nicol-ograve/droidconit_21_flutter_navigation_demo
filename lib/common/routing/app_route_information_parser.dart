import 'package:flutter/material.dart';

import 'app_pages.dart';

class AppRouteInformationParser
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
    final pagePath = uri.pathSegments.length > 1
        ? '/${uri.pathSegments[0]}/${uri.pathSegments[1]}'
        : sectionPath;

    switch (sectionPath) {
      case LoginSectionPath:
        switch (pagePath) {
          case LoginFormPath:
            return Login_LoginFormConfig;
          default:
            return ErrorPageConfig;
        }

      case RegistrationSectionPath:
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

      case TodoSectionPath:
        switch (pagePath) {
          case TodoSectionPath:
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

      case SettingsSectionPath:
        switch (pagePath) {
          case SettingsSectionPath:
            return SettingsListPageConfig;
          case SettingsAccountPath:
            return SettingsAccountPageConfig;
          case SettingsChangePasswordPath:
            return SettingsChangePasswordPageConfig;
          default:
            return ErrorPageConfig;
        }

      case HomePath:
        switch (pagePath) {
          case HomePath:
            return HomePageConfig;
          default:
            return ErrorPageConfig;
        }
      case SplashPath:
        switch (pagePath) {
          case SplashPath:
            return SplashPageConfig;
          default:
            return ErrorPageConfig;
        }

      default:
        return ErrorPageConfig;
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    return RouteInformation(location: configuration.routeLocation);
  }
}
