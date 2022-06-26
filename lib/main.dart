import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_flex/screens/spinkit.dart';

import 'package:edu_flex/theme_model.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_storage/get_storage.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'backend/dashboard_data_provider.dart';
import 'backend/data_provider.dart';

import 'chtha2/providers/auth_provider.dart';
import 'chtha2/providers/chat_provider.dart';
import 'chtha2/providers/home_provider.dart';
import 'chtha2/providers/setting_provider.dart';
import 'db/db_helper.dart';


final _lighttheme = ThemeData(
    brightness: Brightness.light,
    textTheme:TextTheme(
        bodyText2: TextStyle(
            color: Colors.black
        )
    )

);
final _darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme:TextTheme(
        bodyText2: TextStyle(
            color: Colors.white
        )
    )

);
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DBHelper.initDb();
  await GetStorage.init();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);



  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,

  );
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {

  final SharedPreferences prefs;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  MyApp({ this.prefs});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BackEnd>(
          create: (context) => BackEnd(),
        ),

        ChangeNotifierProvider<DashBoardDataProvider>(
          create: (context) => DashBoardDataProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(
            firebaseAuth: FirebaseAuth.instance,
            googleSignIn: GoogleSignIn(),
            prefs: this.prefs,
            firebaseFirestore: this.firebaseFirestore,
          ),
        ),
        Provider<SettingProvider>(
          create: (_) => SettingProvider(
            prefs: this.prefs,
            firebaseFirestore: this.firebaseFirestore,
            firebaseStorage: this.firebaseStorage,
          ),
        ),
        Provider<HomeProvider>(
          create: (_) => HomeProvider(
            firebaseFirestore: this.firebaseFirestore,
          ),
        ),
        Provider<ChatProvider>(
          create: (_) => ChatProvider(
            prefs: this.prefs,
            firebaseFirestore: this.firebaseFirestore,
            firebaseStorage: this.firebaseStorage,
          ),
        ),







      ],
         child: ChangeNotifierProvider(
        create:(_) => ThemeModel(),
    child: Consumer(
    builder: (context,ThemeModel themeModel, child){
    return  MaterialApp(
    title: 'Email And Password Login',

    theme: themeModel.isDark ? _darkTheme : _lighttheme,

    //themeMode: themeModel.islight ? ThemeData.dark() : ThemeData.light(),
    debugShowCheckedModeBanner: false,
    home: Spinkit(),
    );
    }),
    )
    );
  }
}