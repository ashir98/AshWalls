import 'package:ash_walls/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSetting extends ChangeNotifier {
  ThemeData _currentTheme = lightTheme();
  ThemeData get currentTheme => _currentTheme;

  ThemeSetting(bool isDark){
    if(isDark){
      _currentTheme=darkTheme();
    }else{
      _currentTheme=lightTheme();
    }
  }

  void toggleTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (_currentTheme == lightTheme()) {
      _currentTheme = darkTheme();
      sharedPreferences.setBool('is_Dark', true);
    } else {
      _currentTheme = lightTheme();
      sharedPreferences.setBool('is_Dark', false);
    }

    notifyListeners();
  }
}
