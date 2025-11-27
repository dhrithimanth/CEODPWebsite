import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart'; // Import for URL strategy
import 'theme/app_theme.dart';
import 'router/app_router.dart';

void main() {
  usePathUrlStrategy(); // Use path URL strategy (remove # from URL)
  runApp(const CeodpApp());
}

class CeodpApp extends StatelessWidget {
  const CeodpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CEODP - Control Every Operation of Digital Pay',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // Corrected from themeData to lightTheme
      routerConfig: appRouter,
    );
  }
}
