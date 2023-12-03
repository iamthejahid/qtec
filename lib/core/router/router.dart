// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qtec_task/core/flavor/flavor.dart';
import 'package:qtec_task/core/router/error_page.dart';
import 'package:qtec_task/core/router/router_provider.dart';
import 'package:qtec_task/features/home_page/view/home_page_ui.dart';
import 'package:qtec_task/local_storage/local_cache/cache.dart';
import 'package:qtec_task/local_storage/local_cache/src/cache_provider.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'RootNavigator');

final routerProvider = Provider<GoRouter>((ref) {
  final router = ref.watch(routerNotifierProvider)..init();

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics:
        BuildConfig.instance.environment != Environment.PRODUCTION,
    refreshListenable: router,
    routes: [
      GoRoute(
        path: HomePage.path,
        name: HomePage.name,
        builder: (BuildContext context, GoRouterState state) =>
            const HomePage(),
      ),
    ],
    initialLocation: HomePage.path,
    errorPageBuilder: router._errorPageBuilder,
    redirect: (context, state) {
      // final loggedIn = router.isLoggedIn;
      // final routeInQ = router.nonAuthedList.contains(state.matchedLocation);
      // log(
      //   'loggedIn : $loggedIn || routeInQ : $routeInQ',
      //   name: '------------------|',
      // );

      // if (loggedIn) {
      //   return null;
      // } else {
      //   if (routeInQ) {
      //     return null;
      //   } else {
      //     return '/loginScreen';
      // return null;
      //   }
      // }
      return null;
    },
  );
});

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this._ref) {
    _isLoggedIn = _ref.watch(hiveProvider).token.isNotEmpty;
  }
  final Ref _ref;

  void init() {
    // _ref.watch(hiveProvider).getCacheBox().watch().listen((_) {
    //   if (_.key == KCacheTags.token || _.deleted) {
    //     _isLoggedIn = _ref.watch(hiveProvider).token.isNotEmpty;
    //     log(_isLoggedIn.toString(), name: 'LOGGED IN');
    //     notifyListeners();
    //   }
    // });
  }

  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  List<String> nonAuthedList = [
    // HomePage.path,
    // LoginScreen.path,
    // RegistrationScreen.path,
    // WelcomeScreen.path,
    // // CensusDataScreen.path,
    // SuccessScreen.path,
    '/nonAuthPage1',
    '/nonAuthPage2',
    '/nonAuthPage3',
    '/nonAuthPage4',
  ];

  Page<void> _errorPageBuilder(BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: ErrorPage(
            state: state,
          ),
        ),
      );
}
