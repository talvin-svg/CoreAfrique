import 'package:flutter/material.dart';
import 'package:coreafrique/routing/app_router.dart';
import 'package:coreafrique/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Core Afrique Investments',
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}
