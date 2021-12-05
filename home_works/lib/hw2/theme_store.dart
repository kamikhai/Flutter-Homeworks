import 'package:flutter/material.dart';
import 'package:home_works/app_theme_data.dart';
import 'package:mobx/mobx.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  @observable
  ThemeData themeData = AppThemeData.darkTheme;

  bool dark = true;

  @action
  changeTheme() {
    if (dark) {
      themeData = AppThemeData.lightTheme;
      dark = false;
    } else {
      themeData = AppThemeData.darkTheme;
      dark = true;
    }
  }
}
