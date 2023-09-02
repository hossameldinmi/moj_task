class AnalyticsUtil {
  static Future<void> logEvent(String name, [Map<String, dynamic>? parameters]) async {
    print(name + 'args:' + parameters.toString());
  }
}
