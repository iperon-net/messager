import 'package:firebase_messaging/firebase_messaging.dart';

import 'di.dart';
import 'logger.dart';

class Notifications {
  final logger = getIt.get<Logger>();

  late FirebaseMessaging notification;

  Future<void> initialization() async {
    notification = FirebaseMessaging.instance;

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      logger.debug('Got a message whilst in the foreground!');
      logger.debug('Message data: ${message.data}');

      if (message.notification != null) {
        logger.debug('Message also contained a notification: ${message.notification!.title}');
      }
    });
  }

  Future<void> getPermissionRequests() async {
    NotificationSettings settings = await notification.requestPermission(
      provisional: true,
    );
    logger.info('User granted permission: ${settings.authorizationStatus}');

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      final fcmToken = await notification.getToken();
      logger.debug("fcmToken $fcmToken");
    }

    // final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
    // if (apnsToken != null) {
    //   logger.debug("apnsToken $apnsToken");
    // }

    // final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
    // if (apnsToken != null) {
    //   // APNS token is available, make FCM plugin API requests...
    // }

    return;
  }
}
