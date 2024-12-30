import 'dart:async';

import 'package:asgard/app/app.dart';
import 'package:asgard/app/core/utils/overlay_and_orientations_util.dart';
import 'package:flutter/material.dart';

Future<void> initApp() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    setOverlayStyleAndOrientations();
  } catch (_) {}
}

Future<void> main() async => runZonedGuarded<Future<void>>(
      () async {
        await initApp();
        runApp(const AsgardApp());
      },
      (_, __) {},
    );
