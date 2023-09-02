import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';

class ConsoleAnalyticsUtilImpl implements AnalyticsUtil {
  @override
  Future<void> logEvent(String name, [Map<String, dynamic>? parameters]) async {
    log('$name args: $parameters');
  }
}

class FirebaseAnalyticsUtilImpl implements AnalyticsUtil {
  Future<void> init() async {
    await Firebase.initializeApp();
    await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  }

  @override
  Future<void> logEvent(String name, [Map<String, dynamic>? parameters]) async {
    log('$name args: $parameters');
    await FirebaseAnalytics.instance.logEvent(
      name: name,
      parameters: parameters,
    );
  }
}

abstract class AnalyticsUtil {
  Future<void> logEvent(String name, [Map<String, dynamic>? parameters]);
}
