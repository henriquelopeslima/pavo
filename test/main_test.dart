// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() async {
    /// Initialize test widgets to allow access to dot env.
    TestWidgetsFlutterBinding.ensureInitialized();
    await DotEnv().load();
  });

  test('Env loading sucess', () {
    log(DotEnv().env['API_KEY']); // --> test
  });

  testWidgets('Create Widget MyApp', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // await tester.pumpWidget(MyApp());
    // expect(find.text('Movies'), findsOneWidget);
    // await tester.pump();
  });
}
