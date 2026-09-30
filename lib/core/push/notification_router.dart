import 'package:firebase_messaging/firebase_messaging.dart';

import '../../app/router/routes.dart';

/// Maps a push payload straight to a go_router path — tapping a
/// notification and navigating in-app land on the exact same screen
/// (architecture §4, §10).
class NotificationRouter {
  const NotificationRouter();

  String? routeFor(RemoteMessage message) {
    final type = message.data['type'];
    final requestId = message.data['request_id'];
    if (requestId == null) return null;

    switch (type) {
      case 'message':
        return AppRoutes.threadDetail(int.parse(requestId));
      case 'request_status':
      case 'handoff_confirmed':
        return AppRoutes.requestDetail(int.parse(requestId));
      default:
        return null;
    }
  }
}