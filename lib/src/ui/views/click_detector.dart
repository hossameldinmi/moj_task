import 'package:flutter/widgets.dart';
import 'package:moj_task/src/domain/value_objects/user_click_value_object.dart';
import 'package:moj_task/src/utils/service_locator.dart';
import 'package:moj_task/src/utils/user_actions_aggregator.dart';

class ClickDetector extends StatelessWidget {
  final Widget child;
  const ClickDetector({
    required super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        ServiceLocator.instance<UserActionsAggregator>().add(UserClick(key.toString(), event.position));
      },
      child: child,
    );
  }
}
