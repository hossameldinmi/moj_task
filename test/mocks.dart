import 'package:mockito/mockito.dart';
import 'package:moj_task/src/ui/helpers/toast_helper.dart';
import 'package:moj_task/src/utils/analytics_util.dart';
import 'package:moj_task/src/utils/user_actions_aggregator.dart';

class ToastHelperMock extends Mock implements ToastHelper {}

class AnalyticsUtilMock extends Mock implements AnalyticsUtil {}

class UserActionsAggregatorMock extends Mock implements UserActionsAggregator {}
