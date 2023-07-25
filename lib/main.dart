import 'dart:io';

import 'package:flutter/material.dart';
import 'package:responsive_flutter_app/responsive/desktop_scaffold.dart';
import 'package:responsive_flutter_app/responsive/mobile_scaffold.dart';
import 'package:responsive_flutter_app/responsive/responsive_layout.dart';
import 'package:responsive_flutter_app/responsive/tablet_scaffold.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    WindowManager.instance.setMinimumSize(const Size(320, 600));
    // WindowManager.instance.setMaximumSize(const Size(1200, 600));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ResponsiveLayout(
        mobileScaffold: MobileScaffold(),
        tabletScaffold: TabletScaffold(),
        desktopScaffold: DesktopScaffold(),
      ),
    );
  }
}
