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

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class aLauncherAboutDialog extends StatelessWidget {
  final PackageInfo packageInfo;

  aLauncherAboutDialog({
    Key? key,
    required this.packageInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText2!;
    final underlined = textStyle.copyWith(decoration: TextDecoration.underline);
    return AboutDialog(
      applicationName: packageInfo.appName,
      applicationVersion: "${packageInfo.version} (${packageInfo.buildNumber})",
      applicationIcon: Image.asset("assets/logo.png", height: 72),
      applicationLegalese: "© 2022 4v3ngR",
      children: [
        SizedBox(height: 24),
        RichText(
          text: TextSpan(
            style: textStyle,
            children: [
              TextSpan(
                text: "aLauncher is an open-source alternative launcher for Android TV.\n"
                    "Source code available at ",
              ),
              TextSpan(text: "https://github.com/4v3ngR/aLauncher", style: underlined),
              TextSpan(text: ".\n\n"),
              TextSpan(text: "Forked from https://gitlab.com/flauncher/flauncher © 2021 Étienne Fesser\n\n"),
              TextSpan(text: "Huge thanks to Étienne Fesser for open sourcing his launcher."),
            ],
          ),
        )
      ],
    );
  }
}
