//test for onTap on floating action button

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kissanmitra/main.dart';

void main() {
  testWidgets("testing onTap on FloatingActionButton",
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.byType(FloatingActionButton), findsOneWidget);
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
