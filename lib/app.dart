import 'package:flutter/material.dart';
import 'package:libido/ui/sex_position_detail.dart';
import 'package:libido/ui/sex_position_list.dart';
import 'package:libido/util/custom_theme.dart';

import 'ui/home.dart';

class KamasutraApp extends StatelessWidget {
  const KamasutraApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: Home.routeName,
      routes: {
        Home.routeName : (context) => Home(),
        SexPositionList.routeName : (context) => SexPositionList(),
        SexPositionDetail.routeName : (context) => const SexPositionDetail(),
      },
    );
  }
}