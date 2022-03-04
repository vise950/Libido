import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:libido/main.dart' as app;
import 'package:libido/ui/home.dart';
import 'package:libido/ui/sex_position_detail.dart';
import 'package:libido/ui/sex_position_list.dart';

void main() {
  setUp(() {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  });

  testWidgets('navigate to list and open first item',
      (tester) async {
    app.main();
    await tester.pumpAndSettle();

    // navigate to list
    await tester.tap(find.byKey(Home.navigateToPositionList));
    await tester.pumpAndSettle();
    expect(find.byType(SexPositionList), findsOneWidget);

    // click first item
    final firstItem = tester.firstWidget(find.byType(InkWell));
    await tester.tap(find.byWidget(firstItem));
    await tester.pumpAndSettle();
    expect(find.byType(SexPositionDetail), findsOneWidget);
  });

  testWidgets('navigate to random item', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    // navigate to detail
    await tester.tap(find.byKey(Home.navigateToPositionDetail));
    await tester.pumpAndSettle();
    expect(find.byType(SexPositionDetail), findsOneWidget);
  });
}