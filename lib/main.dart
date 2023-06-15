import 'package:first_cry_demo/home/views/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

import 'login/view/login_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var isLogin = prefs.getBool('is_login')??false;

  runApp( MyApp(isLogin: isLogin,));
}

class MyApp extends StatefulWidget {
 final bool isLogin;
   MyApp({super.key, required this.isLogin});


  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: widget.isLogin!?MyHomePage(title: 'Home') :LoginPage(),
    );
  }
}


