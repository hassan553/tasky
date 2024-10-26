import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ttt/core/services/setup/getIt.dart';

import 'core/routes/app_pages.dart';
import 'core/services/cache/cash_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CashHelper.init();
  setup();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (_, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            initialRoute: AppPages.onboarding,
            routes: routes,
          );
        });
  }
}
