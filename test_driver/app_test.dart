import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter/widgets.dart';
import 'package:test/test.dart';

void main() {
  group("counter", () {
    final counterTextFinder = find.byValueKey('counter');
    final buttonFinder = find.byValueKey('increment');

    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test("Start at 0", () async {
      expect(await driver.getText(counterTextFinder), "0");
    });
    test('increments the counter', () async {
      await driver.tap(buttonFinder);
      await driver.tap(buttonFinder);

      expect(await driver.getText(counterTextFinder), "2");
    });
  });
}
