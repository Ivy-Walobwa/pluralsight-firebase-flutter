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
}
