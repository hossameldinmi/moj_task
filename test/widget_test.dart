import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moj_task/src/my_app.dart';
import 'package:moj_task/src/ui/helpers/toast_helper.dart';
import 'package:moj_task/src/ui/screens/page2.dart';
import 'package:moj_task/src/utils/analytics_util.dart';
import 'package:moj_task/src/utils/service_locator.dart';
import 'package:moj_task/src/utils/user_actions_aggregator.dart';
import 'mocks.dart';

void main() {
  UserActionsAggregator userActionsAggregator;
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    ServiceLocator.instance.registerLazySingleton<ToastHelper>(() => ToastHelperMock());
    ServiceLocator.instance.registerLazySingleton<AnalyticsUtil>(() => AnalyticsUtilMock());
    ServiceLocator.instance.registerLazySingleton<UserActionsAggregator>(() => UserActionsAggregatorImpl(
          ServiceLocator.instance(),
          ServiceLocator.instance(),
        ));
    ServiceLocator.instance<UserActionsAggregator>().initAnalytics();
    userActionsAggregator = ServiceLocator.instance<UserActionsAggregator>();
  });
  testWidgets('navigation_test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.forward));
    await tester.pumpAndSettle();

    expect(find.byType(Page2), findsOneWidget);
  });

  testWidgets('no_angry_clicks', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Tap the '+' icon and trigger a frame.
    await tester.tapAt(const Offset(100, 100));

    await tester.pumpAndSettle();

    expect(find.byType(Page2), findsNothing);
  });
}
