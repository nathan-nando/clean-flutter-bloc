import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:up_and_down_mobile/features/splash_screen/view/splash_screen_view.dart';

part 'screen.dart';

part 'logger.dart';

part 'routes.dart';

part 'preferences.dart';

part 'json.dart';

part 'upload.dart';

class UtilGlobal {
  static late LogUtils log;
  static late BuildContext context;
  static late PreferencesUtils preferences;

  static Future<void> init() async {
    UtilGlobal.log = LogUtils();
    SharedPreferences pref = await SharedPreferences.getInstance();
    preferences = PreferencesUtils(pref);
  }

  static void setContext(BuildContext context) {
    UtilGlobal.context = context;
  }
}

var log = UtilGlobal.log;
var pref = UtilGlobal.preferences.sharedPreferences;
var prefTool = UtilGlobal.preferences;
