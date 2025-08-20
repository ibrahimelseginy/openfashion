import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:device_preview/device_preview.dart';
import 'package:openfashon/core/app_theme.dart';
import 'package:openfashon/features/components/app_routers.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (BuildContext context) => const OpenFashon(),
    ),
  );
}

class OpenFashon extends StatelessWidget {
  const OpenFashon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OpenFashon',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
