import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'app_test_key.dart';

main() {
  group("Application test", () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test("widget is available", () async {
      await driver.waitFor(searchButton);
      await driver.waitFor(searchField);
    });

    test("enter text on search field", () async {
      await driver.tap(searchField);
      await driver.enterText("dicodingacademy");
      await driver.enterText("dicoding");
      await driver.enterText("flutter");
      await driver.enterText("testing");
    });

    test("search user with flutter query", () async {
      await driver.tap(searchField);
      await driver.enterText("flutter");
      await driver.tap(searchButton);
      await driver.waitFor(searchContent);
    });

    test("search user with dicodingacademy query", () async {
      await driver.enterText("dicodingacademy");
      await driver.tap(searchButton);
      await driver.waitFor(searchContent);
    });

    test("show detail of user", () async {
      await driver.waitFor(content1);
      await driver.tap(content1);
      await driver.waitFor(detailImage);
      await driver.waitFor(detailContent);
      await driver.tap(detailLeading);
    });

    test("show another detail of user", () async {
      await driver.waitFor(content2);
      await driver.tap(content2);
      await driver.waitFor(detailImage);
      await driver.waitFor(detailContent);
      await driver.tap(detailLeading);
    });
  });
}
