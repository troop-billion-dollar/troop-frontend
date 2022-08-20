import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:troop_ui/troop_ui.dart';

extension PhotoboothWidgetTester on WidgetTester {
  void setDisplaySize(Size size) {
    binding.window.physicalSizeTestValue = size;
    binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(() {
      binding.window.clearPhysicalSizeTestValue();
      binding.window.clearDevicePixelRatioTestValue();
    });
  }

  void setLandscapeDisplaySize() {
    setDisplaySize(const Size(TroopBreakpoints.large, 1000));
  }

  void setPortraitDisplaySize() {
    setDisplaySize(const Size(TroopBreakpoints.small, 1000));
  }
}
