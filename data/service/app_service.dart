import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppService {
  Future<dynamic> getProfileData() async {
    String str = await rootBundle.loadString('assets/profile/config.json');
    dynamic json = jsonDecode(str);

    return json;
  }

  Future<String?> getSavedThemeName() async {
    final prefs = await SharedPreferences.getInstance();
    final themeName = prefs.getString('themeName');

    return themeName;
  }

  void updateSavedThemeName(String themeName) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('themeName', themeName);
  }
}
