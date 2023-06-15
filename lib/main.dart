import 'package:fallora/backend/auth/auth.manager.dart';
import 'package:fallora/injection.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'backend/config/firebase_config.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupModules();
  await initFirebase();
  
  await FlutterFlowTheme.initialize();

  const primaryColor = const Color(0xFF730195);
  EasyLoading.instance
  ..loadingStyle = EasyLoadingStyle.custom
  ..textColor = primaryColor
  ..overlayEntry = null
  ..indicatorSize = 40
  ..radius = 40
  ..indicatorWidget = SpinKitChasingDots(color: primaryColor,)
  ..indicatorColor = primaryColor
  ..backgroundColor = Colors.transparent
  ..maskType = EasyLoadingMaskType.black
  ..boxShadow = []
;

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
    )
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? locale;
  ThemeMode themeMode = FlutterFlowTheme.themeMode;

  late AuthManager authManager = getIt<AuthManager>();
  late AppStateNotifier appStateNotifier;
  late GoRouter router;

  @override
  void initState() {
    super.initState();
    appStateNotifier = AppStateNotifier();
    router = createRouter(appStateNotifier);
    authManager.tokenStream..listen((jwt) {
      appStateNotifier.updateLoginState(jwt != null);
    });
  }

  @override
  void dispose() {
    authManager.dispose();
    super.dispose();
  }

  void setLocale(String language) {
    setState(() => locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: EasyLoading.init(),
      title: 'Fallora',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: locale,
      supportedLocales: const [
        Locale('tr'),
      ],
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: themeMode,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
