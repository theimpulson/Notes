import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void setSystemOverlay() {
  /// Sets system's status and navigation bar theme to match the application
  return SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}
