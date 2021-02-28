import 'package:flutter/material.dart';
import 'package:pavo/app/app_controller.dart';

import 'pages/home/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: AppController.instance.themeSwitch,
      builder: (context, isDart, child) {
        return MaterialApp(
          title: 'Pavo',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              brightness: isDart ? Brightness.dark : Brightness.light),
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        );
      },
    );
  }
}
