import 'package:flutter/material.dart';
import 'package:flutter_e2e/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  if (binding is LiveTestWidgetsFlutterBinding) {
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  }

  group('end-to-end test', () {
    testWidgets('Scrolling Testing', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.byKey(const Key('list')));
      // await tester.scrollUntilVisible(find.byKey(const Key('sampleItemListViewItem_15')), 5);
      final listFinder = find.byType(Scrollable);
      final itemFinder = find.byKey(const ValueKey('sampleItemListViewItem_15'));

      // Scroll until the item to be found appears.
      await tester.scrollUntilVisible(
        itemFinder,
        50.0,
        scrollable: listFinder,
      );

      // Verify that the item contains the correct text.
      expect(itemFinder, findsOneWidget);
    });
  });
}
