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


  bool _canPageBeAdded(PageConfiguration pageConfig) =>
      _pages.isEmpty ||
      (_pages.last.arguments as PageConfiguration).uiPage != pageConfig.uiPage;


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
