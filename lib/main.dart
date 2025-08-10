import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // تهيئة OneSignal مع App ID بتاعك
  OneSignal.shared.setAppId('b188bee9-c63f-40fa-91b1-ebbe5b5ed43c');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'From Hurghada',
      debugShowCheckedModeBanner: false,
      home: WebViewContainer(),
    );
  }
}

class WebViewContainer extends StatefulWidget {
  @override
  _WebViewContainerState createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  final String url = 'https://fromhurghada.com';

  @override
  void initState() {
    super.initState();

    // إعداد مستمع لفتح الإشعارات لو حبيت تعالج فتح الإشعارات
    OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      // تقدر هنا تضيف كود خاص عند فتح إشعار
      print('Notification opened: ${result.notification.jsonRepresentation()}');
    });

    // تفعيل طلب صلاحيات الإشعارات للمستخدم لو لازمة (خاصة على iOS)
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      print("Accepted permission: $accepted");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (NavigationRequest request) {
          // كل الروابط تفتح داخل التطبيق نفسه
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
