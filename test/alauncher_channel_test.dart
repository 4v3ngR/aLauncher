/*
 * aLauncher
 * Copyright (C) 2021  Étienne Fesser
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import 'package:alauncher/alauncher_channel.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  test("getApplications", () async {
    final channel = MethodChannel('org.mywire.alauncher/method');
    channel.setMockMethodCallHandler((call) async {
      if (call.method == "getApplications") {
        return [
          {'packageName': 'org.mywire.alauncher'}
        ];
      }
      fail("Unhandled method name");
    });
    final fLauncherChannel = aLauncherChannel();

    final apps = await fLauncherChannel.getApplications();

    expect(apps, [
      {'packageName': 'org.mywire.alauncher'}
    ]);
  });

  test("launchApp", () async {
    final channel = MethodChannel('org.mywire.alauncher/method');
    String? packageName;
    channel.setMockMethodCallHandler((call) async {
      if (call.method == "launchApp") {
        packageName = call.arguments as String;
        return;
      }
      fail("Unhandled method name");
    });
    final fLauncherChannel = aLauncherChannel();

    await fLauncherChannel.launchApp("org.mywire.alauncher");

    expect(packageName, "org.mywire.alauncher");
  });

  test("openSettings", () async {
    final channel = MethodChannel('org.mywire.alauncher/method');
    bool called = false;
    channel.setMockMethodCallHandler((call) async {
      if (call.method == "openSettings") {
        called = true;
        return;
      }
      fail("Unhandled method name");
    });
    final fLauncherChannel = aLauncherChannel();

    await fLauncherChannel.openSettings();

    expect(called, isTrue);
  });

  test("openAppInfo", () async {
    final channel = MethodChannel('org.mywire.alauncher/method');
    String? packageName;
    channel.setMockMethodCallHandler((call) async {
      if (call.method == "openAppInfo") {
        packageName = call.arguments as String;
        return;
      }
      fail("Unhandled method name");
    });
    final fLauncherChannel = aLauncherChannel();

    await fLauncherChannel.openAppInfo("org.mywire.alauncher");

    expect(packageName, "org.mywire.alauncher");
  });

  test("uninstallApp", () async {
    final channel = MethodChannel('org.mywire.alauncher/method');
    String? packageName;
    channel.setMockMethodCallHandler((call) async {
      if (call.method == "uninstallApp") {
        packageName = call.arguments as String;
        return;
      }
      fail("Unhandled method name");
    });
    final fLauncherChannel = aLauncherChannel();

    await fLauncherChannel.uninstallApp("org.mywire.alauncher");

    expect(packageName, "org.mywire.alauncher");
  });

  test("isDefaultLauncher", () async {
    final channel = MethodChannel('org.mywire.alauncher/method');
    channel.setMockMethodCallHandler((call) async {
      if (call.method == "isDefaultLauncher") {
        return true;
      }
      fail("Unhandled method name");
    });
    final fLauncherChannel = aLauncherChannel();

    final isDefaultLauncher = await fLauncherChannel.isDefaultLauncher();

    expect(isDefaultLauncher, isTrue);
  });

  test("checkForGetContentAvailability", () async {
    final channel = MethodChannel('org.mywire.alauncher/method');
    channel.setMockMethodCallHandler((call) async {
      if (call.method == "checkForGetContentAvailability") {
        return true;
      }
      fail("Unhandled method name");
    });
    final fLauncherChannel = aLauncherChannel();

    final getContentAvailable = await fLauncherChannel.checkForGetContentAvailability();

    expect(getContentAvailable, isTrue);
  });

  test("startAmbientMode", () async {
    final channel = MethodChannel('org.mywire.alauncher/method');
    bool called = false;
    channel.setMockMethodCallHandler((call) async {
      if (call.method == "startAmbientMode") {
        called = true;
        return;
      }
      fail("Unhandled method name");
    });
    final fLauncherChannel = aLauncherChannel();

    await fLauncherChannel.startAmbientMode();

    expect(called, isTrue);
  });
}
