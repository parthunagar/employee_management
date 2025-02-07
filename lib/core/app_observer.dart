// // ignore_for_file: overridden_fields

// import 'package:auto_route/auto_route.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:developer' as logger;

// class AppObserver extends FirebaseAnalyticsObserver
//     implements AutoRouterObserver {
//   @override
//   final FirebaseAnalytics analytics;

//   @override
//   final ScreenNameExtractor nameExtractor;
//   final void Function(PlatformException error)? _onError;

//   // ignore: use_super_parameters
//   AppObserver({
//     required this.analytics,
//     this.nameExtractor = defaultNameExtractor,
//     Function(PlatformException error)? onError,
//   })  : _onError = onError,
//         super(
//           analytics: analytics,
//           nameExtractor: nameExtractor,
//           onError: onError,
//         );

//   void _sendScreenView(TabPageRoute route) {
//     final String screenName = route.name;
//     // ignore: unnecessary_null_comparison
//     if (screenName != null) {
//       // ignore: deprecated_member_use
//       analytics.setCurrentScreen(screenName: screenName).catchError(
//         (Object error) {
//           final onError = _onError;
//           if (onError == null) {
//             logger.log('$FirebaseAnalyticsObserver: $error');
//           } else {
//             onError(error as PlatformException);
//           }
//         },
//         test: (Object error) => error is PlatformException,
//       );
//     }
//   }

//   @override
//   void didPop(Route route, Route? previousRoute) {
//     logger.log(
//         'Did pop route: ${route.settings.name} | from: ${previousRoute?.settings.name}');
//     super.didPop(route, previousRoute);
//   }

//   @override
//   void didPush(Route route, Route? previousRoute) {
//     logger.log(
//         'Did push route: ${route.settings.name} | from: ${previousRoute?.settings.name}');
//     super.didPush(route, previousRoute);
//   }

//   @override
//   void didRemove(Route route, Route? previousRoute) {
//     logger.log(
//         'Did remove route: ${route.settings.name} | from: ${previousRoute?.settings.name}');
//     super.didRemove(route, previousRoute);
//   }

//   @override
//   void didReplace({Route? newRoute, Route? oldRoute}) {
//     logger.log(
//         'Did replace route: ${newRoute?.settings.name} | from: ${oldRoute?.settings.name}');
//     super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
//   }

//   @override
//   void didStartUserGesture(Route route, Route? previousRoute) {
//     logger.log(
//         'Did start user gesture route: ${route.settings.name} | from: ${previousRoute?.settings.name}');
//     super.didStartUserGesture(route, previousRoute);
//   }

//   @override
//   void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
//     logger.log(
//         'Did start user gesture route: ${route.name} | from: ${previousRoute?.name}');
//     _sendScreenView(route);
//   }

//   @override
//   void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
//     logger.log(
//         'Did start user gesture route: ${route.name} | from: ${previousRoute.name}');
//     _sendScreenView(route);
//   }
// }
