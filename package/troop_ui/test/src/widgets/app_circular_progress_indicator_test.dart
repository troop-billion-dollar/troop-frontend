// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:troop_ui/troop_ui.dart';

void main() {
  group('AppCircularProgressIndicator', () {
    testWidgets('renders', (tester) async {
      await tester.pumpWidget(AppCircularProgressIndicator());
      expect(find.byType(AppCircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders with default colors', (tester) async {
      await tester.pumpWidget(AppCircularProgressIndicator());
      final widget = tester.widget<AppCircularProgressIndicator>(
          find.byType(AppCircularProgressIndicator));
      expect(widget.color, TroopColors.orange);
      expect(widget.backgroundColor, TroopColors.white);
    });

    testWidgets('renders with provided colors', (tester) async {
      const color = TroopColors.black;
      const backgroundColor = TroopColors.blue;
      await tester.pumpWidget(
        AppCircularProgressIndicator(
          color: color,
          backgroundColor: backgroundColor,
        ),
      );
      final widget = tester.widget<AppCircularProgressIndicator>(
          find.byType(AppCircularProgressIndicator));
      expect(widget.color, color);
      expect(widget.backgroundColor, backgroundColor);
    });
  });
}
