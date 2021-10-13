/*
I usually name it with a prefix that reflects the name of the application, but in
this case, since the name of the application is 'Todo', it could have sounded like 
something still incomplete
 */

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

  void _addUiPage(Widget? child, PageConfiguration pageConfig) {
    if (child != null) {
      _pages.add(
        _createPage(child, pageConfig),
      );
    }
  }

  void addPageConfig(PageConfiguration? pageConfig) {
    final shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as PageConfiguration).uiPage !=
            pageConfig?.uiPage;

    if (shouldAddPage) {
      switch (pageConfig?.section) {
      }
    }
  }

  MaterialPage _pageFromConfig(PageConfiguration pageConfig) {
    switch (pageConfig.section) {
      case Sections.Splash:
        return _createPage(Text('Splash Page'), pageConfig);
      case Sections.Home:
        // TODO: Handle this case.
        break;
      case Sections.UserRegistration:
        // TODO: Handle this case.
        break;
      case Sections.Login:
        // TODO: Handle this case.
        break;
      case Sections.Settings:
        // TODO: Handle this case.
        break;
      case Sections.Todo:
        // TODO: Handle this case.
        break;
      case Sections.Error:
        // TODO: Handle this case.
        break;
      default:
        return _createPage(Text('Error'), pageConfig);
    }
    return _createPage(Text('Error'), pageConfig);
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
