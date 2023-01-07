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

import 'dart:async';
import 'dart:isolate';

import 'package:alauncher/database.dart';
import 'package:alauncher/alauncher_channel.dart';
import 'package:alauncher/unsplash_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unsplash_client/unsplash_client.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'alauncher_app.dart';

onError(Object error, StackTrace stack) {
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Paint.enableDithering = true;
  WebView.platform = SurfaceAndroidWebView();

/*
  FlutterError.onError = firebaseCrashlytics.recordFlutterError;
  Isolate.current.addErrorListener(RawReceivePort((List<dynamic> pair) async => await firebaseCrashlytics.recordError(
        pair.first,
        pair.last as StackTrace,
      )).sendPort);
*/

  runZonedGuarded<void>(() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final imagePicker = ImagePicker();
    final fLauncherChannel = aLauncherChannel();
    final fLauncherDatabase = aLauncherDatabase.connect(connect());
    final unsplashService = UnsplashService(
      UnsplashClient(
        settings: ClientSettings(
          debug: kDebugMode,
          credentials: AppCredentials(
            accessKey: "",
            secretKey: "",
          ),
        ),
      ),
    );
    runApp(
      aLauncherApp(
        sharedPreferences,
        imagePicker,
        fLauncherChannel,
        fLauncherDatabase,
        unsplashService,
      ),
    );
  }, onError);
}
