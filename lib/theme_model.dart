import 'package:edu_flex/theme_shared_preferences.dart';
import 'package:flutter/cupertino.dart';


class ThemeModel extends ChangeNotifier{
   bool _isDark;
   bool _isLight;
   ThemeSharedPreferences themeSharedPreferences;
  bool get isDark => _isDark;
  bool get islight=> _isLight;

  ThemeModel()
  {
    _isDark = false;
    _isLight=true;
    themeSharedPreferences = ThemeSharedPreferences();
    getThemePreferences();
  }

  set isDark(bool value){
    _isDark = value;
    themeSharedPreferences.setTheme(value);
    notifyListeners();
  }

   set islight(bool value1){
     _isLight = value1;
     themeSharedPreferences.setTheme(value1);
     notifyListeners();
   }

  getThemePreferences() async{
    _isDark = await themeSharedPreferences.getTheme();
    _isLight=await themeSharedPreferences.getTheme();
    notifyListeners();
  }
}