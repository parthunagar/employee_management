import 'dart:async';
import 'package:employee_management/emp_theme/emp_style.dart';
import 'package:employee_management/core/app_bloc_observer.dart';
import 'package:employee_management/core/auto_route_guards.dart';
import 'package:employee_management/route/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' as f;
// import 'dart:io' show Platform;
// ignore: unused_element
//add site into firebase.json file ["site": "empmanagement"]
//create new site in firebase console [inside Hosting portion]
//firebase web app version : firebase deploy --only hosting:empmanagement

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // if (!f.kIsWeb) {
  //   try {
  //     await Firebase.initializeApp(
  //       name: 'employee_management',
  //       options: DefaultFirebaseOptions.currentPlatform,
  //     );
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Bloc.observer = AppBlocObserver();

  runApp(const AppView());
}

// ignore: must_be_immutable
class AppView extends StatefulWidget {
  static final navKey = GlobalKey<NavigatorState>();
  // static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  // static FirebaseAnalyticsObserver observer = AppObserver(analytics: analytics);

  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> with WidgetsBindingObserver {
  final AppRouter _appRouter = AppRouter(
    authGuard: AuthGuard(),
    notAuthGuard: NotAuthGuard(),
    navigatorKey: AppView.navKey, //StackedService.navigatorKey,
  );

  @override
  void initState() {
    super.initState();
    if (!f.kIsWeb) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      // getRemoteConfig();
    }
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser:
          _appRouter.defaultRouteParser(includePrefixMatches: true),
      routerDelegate: _appRouter.delegate(
        navigatorObservers: () => [], //f.kIsWeb ? [] : [AppView.observer],
      ),
      supportedLocales: const [Locale('en', '')],
      title: 'Employee Management',
      highContrastTheme: EmpAppStyle.empLightTheme,
      highContrastDarkTheme: EmpAppStyle.empLightTheme,
      debugShowCheckedModeBanner: false,
      theme: EmpAppStyle.empLightTheme,
      darkTheme: EmpAppStyle.empLightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
