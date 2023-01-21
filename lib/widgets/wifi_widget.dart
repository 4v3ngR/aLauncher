/*
 * aLauncher
 * Copyright (C) 2023 4v3ngR
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class WifiWidget extends StatefulWidget {
  @override
  _WifiWidgetState createState() => _WifiWidgetState();
}

class _WifiWidgetState extends State<WifiWidget> {
  final Connectivity _connectivity = Connectivity();
  ConnectivityResult _connectivityResult = ConnectivityResult.none;
  StreamSubscription? _connectivitySubscription;


  @override
  void initState() {
    super.initState();
    _connectivitySubscription =
      _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Icon(
    _connectivityResult == ConnectivityResult.wifi ? Icons.wifi_outlined : Icons.wifi_off_outlined,
    shadows: <Shadow>[Shadow(color: Colors.black54, blurRadius: 15.0)],
    color: Colors.white
  );

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState((){
      _connectivityResult = result;
    });
  }
}
