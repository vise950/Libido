import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:libido/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('it')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        child: const KamasutraApp()),
  );
}