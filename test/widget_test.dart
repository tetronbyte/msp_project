import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:msp_project/main.dart';

void main() {
  testWidgets('LoginPage loads correctly', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(MyApp());

    // Check if "Login" text is found (assuming there's a "Login" button or text)
    expect(find.text('Login'), findsOneWidget);

    // Check if there's a text field (email input)
    expect(find.byType(TextField), findsWidgets);
  });
}
