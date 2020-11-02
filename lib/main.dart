import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pavo/app/app_widget.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(AppWidget());
}
