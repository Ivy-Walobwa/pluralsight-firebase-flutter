import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';

import 'data_providers/auth_data_provider.dart';
import 'data_providers/auth_provider.dart';
import 'data_providers/http_client.dart';
import 'screens/splash_screen.dart';
import 'coffee_router.dart';
import 'get_theme.dart';
import 'services/analytics.dart';

class CoffeeApp extends StatelessWidget {
  final FirebaseAnalyticsObserver _observer = AnalyticsService.observer;
  @override
  Widget build(BuildContext context) {
    return  AuthProvider(
      auth: AuthDataProvider(http: HttpClient()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        home: const SplashScreen(),
        navigatorKey: CoffeeRouter.instance.navigatorKey,
        navigatorObservers: <NavigatorObserver>[_observer],
        theme: getTheme(),
      ),
    );
  }
}
