import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fitness/moduls/main/views/screens/mainScreen.dart';
import 'package:fitness/moduls/main/views/screens/onbording.dart';
import 'package:fitness/services/api/main.dart';
import 'package:fitness/services/local_data/share_pref.dart';
import 'package:fitness/shared/binding.dart';
import 'package:fitness/shared/constant.dart';
import 'package:fitness/utils/languages/translation.dart';
import 'package:fitness/utils/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharePref.init();
  await initFirebaseMessaging();
  token = await SharePref.getData(key: 'token');
  nameUser = await SharePref.getData(key: 'name');
  MainDio.init();
  MainDio.sendToken();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, s) => GetMaterialApp(
        smartManagement: SmartManagement.onlyBuilder,
        initialBinding: MainBinding(),
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        translations: Messages(),
        locale: Locale('ar'),
        fallbackLocale: Locale('ar'),
        home: token != null ? MainScreen() : Onbording(),
      ),
    );
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call initializeApp before using other Firebase services.
  print('Handling a background message ${message.data}');
  await handleMessageData(message.data);
}

initFirebaseMessaging() async {
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    await handleMessageData(message.data);
    //foreground
    print(message.data);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    // var controller = Get.put(MainController());
    await handleMessageData(message.data);
    Get.snackbar(message.data['title'], message.data['description'],
        colorText: Colors.white, backgroundColor: Colors.blue);
    // await controller.changeIndex(1);

    print(message.data);
  });
}

handleMessageData(Map<String, dynamic> data) async {
  print(data);
  Get.snackbar(data['title'], data['description'],
      colorText: Colors.white, backgroundColor: Colors.blue);
  //RateWidget("ahmedmosa", data['trip_id']);
}
