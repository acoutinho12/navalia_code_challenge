import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:navalia_code_challenge/core/router/app_router.dart';
import 'package:navalia_code_challenge/core/service_locator/service_locator.dart';

void main() async {
  await Hive.initFlutter();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: AppRouter.router);
  }
}
