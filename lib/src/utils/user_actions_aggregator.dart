import 'package:moj_task/src/domain/value_objects/user_click_value_object.dart';
import 'package:moj_task/src/ui/helpers/toast_helper.dart';
import 'package:rxdart/rxdart.dart';
import 'package:moj_task/src/utils/analytics_util.dart';

class UserActionsAggregatorImpl implements UserActionsAggregator {
  final AnalyticsUtil _analyicsUtil;
  final ToastHelper _toastHelper;
  UserActionsAggregatorImpl(this._analyicsUtil, this._toastHelper);

  final _userActions = BehaviorSubject<UserClick>();
  static const _clicksThreshold = 5;
  static const _clicksThresholdDuration = Duration(seconds: 2);

  @override
  void add(UserClick userAction) => _userActions.add(userAction);

  @override
  void initAnalytics() {
    onAngryClickPerformed.listen((clickList) {
      _toastHelper.show("You 're Angry!");
      final lastClick = clickList.last;
      _analyicsUtil.logEvent(
        'angry_click',
        {
          'time': lastClick.time.toIso8601String(),
          'count': clickList.length,
          'widget': lastClick.widgetName,
          'offset': lastClick.offset.toString(),
        },
      );
    });
  }

  @override
  Stream<List<UserClick>> get onAngryClickPerformed => _userActions.stream
      .bufferTime(_clicksThresholdDuration)
      .where((clicks) => clicks.length >= _clicksThreshold)
      .where((clicks) => clicks.every((c) => c == clicks.last));
}

abstract class UserActionsAggregator {
  Stream<List<UserClick>> get onAngryClickPerformed;
  void initAnalytics();
  void add(UserClick userAction);
}
