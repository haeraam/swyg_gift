import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:swyg/pages/start_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('auth');
  runApp(const StartPage());
}
