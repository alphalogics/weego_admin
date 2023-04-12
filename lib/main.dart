import 'package:flutter/material.dart';
import 'app.dart';
import 'core/binding/initial_binding.dart';
import 'core/shared_preference/app_shared_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPreferences.init();
  InitialBinding().dependencies();
  runApp(App());
}