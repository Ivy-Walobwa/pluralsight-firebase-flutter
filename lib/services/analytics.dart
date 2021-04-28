import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics();

  static final AnalyticsService _service = AnalyticsService._();

  AnalyticsService._();

  factory AnalyticsService() => _service;

  static FirebaseAnalytics get instance => _service._analytics;

  static FirebaseAnalyticsObserver get observer =>
      FirebaseAnalyticsObserver(analytics: _service._analytics);

  Future<void> logLogin() async {
    return _analytics.logLogin(loginMethod: 'email');
  }

  Future<void> setUserProperties({
    required String userId,
    required String userRole,
  }) async {
    await _analytics.setUserId(userId);
    await _analytics.setUserProperty(name: 'user_role', value: userRole);
  }

  Future<void> logLogoutPressed({bool isBasketEmpty = false}) async {
    return _analytics.logEvent(
      name: 'logout_pressed',
      parameters: {'is_basket_empty': isBasketEmpty},
    );
  }
}
