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

import 'dart:math';

import 'package:drift/drift.dart';
import 'package:alauncher/database.dart';
import 'package:alauncher/alauncher_channel.dart';
import 'package:alauncher/providers/apps_service.dart';
import 'package:alauncher/providers/settings_service.dart';
import 'package:alauncher/providers/wallpaper_service.dart';
import 'package:alauncher/unsplash_service.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  aLauncherChannel,
  WallpaperService,
  AppsService,
  SettingsService,
  UnsplashService,
], customMocks: [
  MockSpec<aLauncherDatabase>(unsupportedMembers: {#alias}),
])
void main() {}

App fakeApp({
  String packageName = "org.mywire.alauncher",
  String name = "aLauncher",
  String version = "1.0.0",
  Uint8List? banner,
  Uint8List? icon,
  bool hidden = false,
  bool sideloaded = false,
}) =>
    App(
      packageName: packageName,
      name: name,
      version: version,
      banner: banner,
      icon: icon,
      hidden: hidden,
      sideloaded: sideloaded,
    );

Category fakeCategory({
  String name = "Favorites",
  int order = 0,
  CategorySort sort = CategorySort.manual,
  CategoryType type = CategoryType.grid,
  int rowHeight = 110,
  int columnsCount = 6,
}) =>
    Category(
      id: Random().nextInt(1 << 32),
      name: name,
      sort: sort,
      type: type,
      rowHeight: rowHeight,
      columnsCount: columnsCount,
      order: order,
    );
