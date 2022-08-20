import 'package:flutter_test/flutter_test.dart';
import 'package:troop_ui/troop_ui.dart';

void main() {
  group('isMobile', () {
    test('returns true', () {
      expect(isMobile, equals(true));
    });
  });
}
