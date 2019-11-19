// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:muslimcompass/main.dart';

void main() {
  testWidgets('Navigation menu test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.pumpAndSettle();

    expect(find.bySemanticsLabel('CompassIcon'), findsOneWidget);
    await tester.tap(find.bySemanticsLabel('CompassIcon'));
    await tester.pump();

    expect(find.text('Kiblat'), findsWidgets);
    expect(find.text('Jadwal'), findsNothing);
    expect(find.text('Pengaturan'), findsNothing);

    expect(find.bySemanticsLabel('Mosque'), findsOneWidget);
    await tester.tap(find.bySemanticsLabel('Mosque'));
    await tester.pump();

    expect(find.text('Kiblat'), findsNothing);
    expect(find.text('Jadwal'), findsOneWidget);
    expect(find.text('Pengaturan'), findsNothing);

    expect(find.bySemanticsLabel('Cog'), findsOneWidget);
    await tester.tap(find.bySemanticsLabel('Cog'));
    await tester.pump();

    expect(find.text('Kiblat'), findsNothing);
    expect(find.text('Jadwal'), findsNothing);
    expect(find.text('Pengaturan'), findsWidgets);
  });
}
