import 'dart:async';

import 'package:fallora/modals/pages/avatar_buy/avatar_buy_widget.dart';
import 'package:fallora/domain/model/generic_success_model.dart';
import 'package:fallora/pages/genetic_success/generic_success_screen.dart';
import 'package:fallora/pages/otp_page/otp_page_widget.dart';
import 'package:fallora/pages/success_page/success_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'backend/model/user/user.dart';
import 'index.dart';
import 'backend/util/serialization_util.dart';

export 'package:go_router/go_router.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  User? user;
  bool loggedIn = false;

  bool showSplashImage = true;
  String? _redirectLocation;

  bool notifyOnAuthChange = true;

  bool get loading => showSplashImage;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(User newUser) {
    user = newUser;
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    updateNotifyOnAuthChange(true);
  }

  void updateLoginState(bool state) {
    showSplashImage = false;
    loggedIn = state;
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) => appStateNotifier.loggedIn ? HomePageWidget() : LoginPageWidget(),
      routes: [
        FFRoute(
            name: '_initialize',
            path: '/',
            builder: (context, _) => appStateNotifier.loggedIn
                ? HomePageWidget()
                : LoginPageWidget()
        ),
        FFRoute(
            name: "GenericSuccessScreen",
            path: "/GenericSuccessScreen",
            builder: (_, __) => GenericSuccessScreen(pageModel: GenericSuccessModel.forTarot())
        ),
        FFRoute(
            name: "SuccessPage",
            path: "/SuccessPage",
            builder: (_, __) => SuccessPage()),
        FFRoute(
          name: 'SplashScreen',
          path: '/splashScreen',
          builder: (context, params) => SplashScreenWidget(),
        ),
        FFRoute(
            name: 'OtpPage',
            path: '/OtpPage',
            builder: (context, params) {
              var email = params.state.extraMap["email"];
              return OtpPageWidget(email: email.toString());
            }),
        FFRoute(
          name: 'LoginPage',
          path: '/loginPage',
          builder: (context, params) => LoginPageWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => HomePageWidget(),
        ),
        FFRoute(
          name: 'InboxPage',
          path: '/inboxPage',
          builder: (context, params) => InboxPageWidget(),
        ),
        FFRoute(
          name: 'UserProfile',
          path: '/userProfile',
          builder: (context, params) => UserProfileWidget(),
        ),
        FFRoute(
          name: 'HoroscopeSection',
          path: '/horoscopeSection',
          builder: (context, params) => HoroscopeSectionWidget(),
        ),
        FFRoute(
          name: 'HoroscopeCommentary',
          path: '/horoscopeCommentary',
          builder: (context, params) => HoroscopeCommentaryWidget(),
        ),
        FFRoute(
          name: 'HoroscopeCompatibility',
          path: '/horoscopeCompatibility',
          builder: (context, params) => HoroscopeCompatibilityWidget(),
        ),
        FFRoute(
          name: 'CoffeeTelling',
          path: '/coffeeTelling',
          builder: (context, params) => CoffeeTellingWidget(),
        ),
        FFRoute(
          name: 'CoffeeFortuneMain',
          path: '/coffeeFortuneMain',
          builder: (context, params) => CoffeeFortuneMainWidget(),
        ),
        FFRoute(
          name: 'ForgotPassword',
          path: '/forgotPassword',
          builder: (context, params) => ForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'SendCoffeeCup',
          path: '/sendCoffeeCup',
          builder: (context, params) => SendCoffeeCupWidget(),
        ),
        FFRoute(
          name: 'StarsSell',
          path: '/starsSell',
          builder: (context, params) => StarsSellWidget(
              //sliderValue: params.getParam('sliderValue', ParamType.double),
              ),
        ),
        FFRoute(
          name: 'EditProfile',
          path: '/editProfile',
          builder: (context, params) => EditProfileWidget(),
        ),
        FFRoute(
          name: 'preferences',
          path: '/preferences',
          builder: (context, params) => PreferencesWidget(),
        ),
        FFRoute(
          name: 'TarotPage',
          path: '/tarotPage',
          builder: (context, params) => TarotPageWidget(),
        ),
        FFRoute(
          name: 'TarotResultsCard',
          path: '/tarotResultsCard',
          builder: (context, params) => TarotResultsCardWidget(),
        ),
        FFRoute(
          name: 'TarotResults',
          path: '/tarotResults',
          builder: (context, params) => TarotResultsWidget(),
        ),
        FFRoute(
          name: 'AvatarBuy',
          path: '/avatarBuy',
          builder: (context, params) => MyAvatarsPage(),
        ),
        FFRoute(
          name: 'DrinkBehalf',
          path: '/drinkBehalf',
          builder: (context, params) => DrinkBehalfWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (GoRouter.of(this).routerDelegate.matches.length <= 1) {
      go('/');
    } else {
      pop();
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList, collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/loginPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Color(0xFF740097),
                  child: Center(
                    child: Image.asset(
                      'assets/images/Fallora.png',
                      width: MediaQuery.of(context).size.width * 0.75,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 300),
      );
}
