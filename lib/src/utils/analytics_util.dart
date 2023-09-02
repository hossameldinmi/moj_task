import 'dart:developer';

class AnalyticsUtilImpl implements AnalyticsUtil {
  @override
  Future<void> logEvent(String name, [Map<String, dynamic>? parameters]) async {
    log('$name args: $parameters');
  }
}

abstract class AnalyticsUtil {
  Future<void> logEvent(String name, [Map<String, dynamic>? parameters]);
}
