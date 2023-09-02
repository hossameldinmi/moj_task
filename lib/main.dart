import 'package:flutter/material.dart';
import 'package:moj_task/src/my_app.dart';
import 'package:moj_task/src/ui/helpers/toast_helper.dart';
import 'package:moj_task/src/utils/analytics_util.dart';
import 'package:moj_task/src/utils/service_locator.dart';
import 'package:moj_task/src/utils/user_actions_aggregator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.instance.registerLazySingleton<ToastHelper>(() => ToastHelperImpl());
  final firebaseAnalyticsUtil = FirebaseAnalyticsUtilImpl();
  await firebaseAnalyticsUtil.init();
  ServiceLocator.instance.registerLazySingleton<AnalyticsUtil>(() => firebaseAnalyticsUtil);
  ServiceLocator.instance.registerLazySingleton<UserActionsAggregator>(() => UserActionsAggregatorImpl(
        ServiceLocator.instance(),
        ServiceLocator.instance(),
      ));
  ServiceLocator.instance<UserActionsAggregator>().initAnalytics();
  runApp(const MyApp());
}
