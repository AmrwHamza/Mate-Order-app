import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mate_order_app/constants.dart';
import 'package:mate_order_app/core/helpers/shared_pref.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingInBackgroundHandler(
    RemoteMessage message) async {
  print("Received background notification: ${message.notification?.title}");

  await NotificationService.instance.setupFlutterNotifications();

  await NotificationService.instance.showNotification(message);
}

class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();

  final _messaging = FirebaseMessaging.instance;
  final _localNotifications = FlutterLocalNotificationsPlugin();
  bool _isFlutterLocalNotificationsInitialized = false;

  Future<void> initialize() async {
    // Register the background message handler
    FirebaseMessaging.onBackgroundMessage(
        _firebaseMessagingInBackgroundHandler);

    // Request notification permission
    await _requestPermission();

    // Setup message handlers for foreground and background
    await _setupMessageHandlers();

    // Get and print the FCM token
    String? token = await FirebaseMessaging.instance.getToken();
    print('FCM Token: $token');
  }

  Future<void> _requestPermission() async {
    final settings = await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
        announcement: false,
        carPlay: false,
        criticalAlert: false);

    print('Permission status: ${settings.authorizationStatus}');
  }

  Future<void> setupFlutterNotifications() async {
    if (_isFlutterLocalNotificationsInitialized) {
      return;
    }

    // Define the notification channel for Android
    const channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    // Create the notification channel
    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // Set up the Android initialization settings
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    // Initialize the local notifications plugin
    await _localNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        // Handle notification response (e.g., when user taps on the notification)
      },
    );

    // Mark as initialized
    _isFlutterLocalNotificationsInitialized = true;
  }

  Future<void> showNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      // Display the notification
      await _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel',
            'High Importance Notifications',
            channelDescription:
                'This channel is used for important notifications.',
            importance: Importance.high,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher',
          ),
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        payload: message.data
            .toString(), // Send additional data with the notification
      );
    }
  }

  Future<void> _setupMessageHandlers() async {
    // Handle foreground notifications
    FirebaseMessaging.onMessage.listen((message) {
      showNotification(message);
    });

    // Handle background notifications when the app is opened via notification
    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);

    // Handle notification when the app is opened from a terminated state
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleBackgroundMessage(initialMessage);
    }
  }

  void _handleBackgroundMessage(RemoteMessage message) {
    if (message.data['type'] == 'chat') {
      // Open the chat screen if the message type is 'chat'
      // You can navigate to the chat screen here
      print("Navigate to chat screen");
    } else {
      // Handle other types of messages
      print("Handle other types of notifications");
    }
  }
}
