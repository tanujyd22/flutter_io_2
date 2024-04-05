import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesMan{

  late SharedPreferences _late;


  static final SharedPreferencesMan i = SharedPreferencesMan._internal();

  SharedPreferencesMan._internal();


  factory SharedPreferencesMan(){
    return i;
  }

    // Initialize SharedPreferences asynchronously
  Future<void> init() async {
    _late = await _initPrefs();
  }

  // Private method to initialize SharedPreferences
  Future<SharedPreferences> _initPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> setAppFirstOpen(bool b) async{
    await _late.setBool("first", b);
  }

  bool getAppFirstOpen(){
    return _late.getBool("first") ?? false;
  }

}
