import 'package:flutter/material.dart';
import 'package:notas/src/core/services/preferences_services.dart';
import 'package:notas/src/ui/config.dart';

class ThemeController {
  ThemeController._();

  static final instance = ThemeController._();

  ValueNotifier<bool> light = ValueNotifier<bool>(true);
  bool get lightValue => light.value;

  Color primary() => lightValue ? Config.PRIMARY_COLOR : Config.PRIMARY_DARK_COLOR;
  Color secondary() => Config.SECONDARY_COLOR;
  Color aux() => Config.AUX_COLOR;
  Color accent() => Config.ACCENT_COLOR;

  Color primaryButton() => lightValue ? Config.PRIMARY_BUTTON_COLOR : Config.PRIMARY_BUTTON_DARK_COLOR;
  Color secondaryButton() => Config.SECONDARY_BUTTON_COLOR;

  Color background() => lightValue ? Config.BACKGROUND_LIGHT_COLOR : Config.BACKGROUND_DARK_COLOR;

  void changetheme() async {
    light.value = !light.value;
    print(light.value);
    await PreferencesServices.instance.setBool("theme", light.value);
  }

  Future<void> initTheme () async{
    light.value = await PreferencesServices.instance.getBool("theme") ?? true;
  }
}