import 'package:flutter/material.dart';
import 'package:flutter_1/screens/addScreen.dart';
import 'package:flutter_1/screens/homeScreen.dart';
import 'package:flutter_1/services/sharedPrefs.dart';
import 'package:flutter_1/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_1/todo.dart';
import 'package:hive/hive.dart';
// Screens 
// import 'package:todo/screens/addScreen.dart';
// import 'package:todo/screens/homeScreen.dart';
// import 'package:todo/services/sharedPrefs.dart';

void main() async{

 // await SharedPreferencesMan().init();
WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferencesMan.i.setAppFirstOpen(true);
  //debugPrint("${SharedPreferencesMan.i.getAppFirstOpen()}");
//await Hive.initFlutter();
Hive.registerAdapter(TodoAdapter());
await Hive.openBox<Todo>("myBox");
  runApp(MaterialApp(

    initialRoute: "/",

  routes: {
  //  "/splash":(context) => splashSceen(),
    "/" : (context) => Home(),
    "/add" : (context) => addScreen(),
  }

  ));
}