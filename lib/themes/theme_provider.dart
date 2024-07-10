import 'package:flutter/material.dart';
import 'package:music_player/themes/dark_mode.dart';
import 'package:music_player/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier{
  //initially light mode
  ThemeData _themeData = lightmode;

  //get theme
  ThemeData get themeData => _themeData;

  //check if dark mode
  bool get isDarkMode => _themeData == darkmode;

  //set theme
  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners(); //updates UI
  }

  void toggleTheme(){
    if(_themeData == lightmode){
      themeData = darkmode;
    }else{
      themeData = lightmode;
    }
  }
}

