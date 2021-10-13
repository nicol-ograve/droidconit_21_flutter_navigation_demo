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
          case Login_FormPath:
            return Login_LoginFormConfig;
          case Login_EmailVerifyPath:
            return Login_EmailVerifyConfig;
          default:
            return ErrorPageConfig;
        }

      case UserRegistrationPath:
        switch (pagePath) {
          case UserRegistrationPath:
            return UserRegistration_PageConfig;
          default:
            return ErrorPageConfig;
        }

      case TodoPath:
        switch (pagePath) {
          case TodoPath:
            return Todos_ListPageConfig;
          case Todo_DetailPath:
            return Todos_DetailPageConfig;
          case Todo_CreatePath:
            return Todos_CreatePageConfig;
          default:
            return ErrorPageConfig;
        }

      case SettingsPath:
        switch (pagePath) {
          case SettingsPath:
            return Settings_ListPageConfig;
          case Settings_AccountPath:
            return Settings_AccountPageConfig;
          case Settings_ChangePasswordPath:
            return Settings_ChangePasswordPageConfig;
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
            return const RouteInformation(location: Login_FormPath);
          case Pages.Login_EmailVerify:
            return const RouteInformation(location: Login_EmailVerifyPath);
          default:
            return const RouteInformation(location: ErrorPath);
        }

      case Sections.UserRegistration:
        switch (configuration.uiPage) {
          case Pages.UserRegistration:
            return const RouteInformation(location: UserRegistrationPath);
          default:
            return const RouteInformation(location: ErrorPath);
        }

      case Sections.Settings:
        switch (configuration.uiPage) {
          case Pages.Settings_List:
            return const RouteInformation(
                location: SettingsPath);
          case Pages.Settings_Account:
            return const RouteInformation(
                location: Settings_AccountPath);
          case Pages.Settings_ChangePassword:
            return const RouteInformation(
                location: Settings_ChangePasswordPath);
          default:
            return const RouteInformation(location: ErrorPath);
        }

      case Sections.Todo:
        switch (configuration.uiPage) {
          case Pages.Todo_List:
            return const RouteInformation(
                location: TodoPath);
          case Pages.Todo_Create:
            return const RouteInformation(
                location: Todo_CreatePath);
          case Pages.Todo_Detail:
            return const RouteInformation(
                location: Todo_DetailPath);
          default:
            return const RouteInformation(location: ErrorPath);
        }

    case Sections.Error:
      default:
        return const RouteInformation(location: ErrorPath);
    }
  }
}
