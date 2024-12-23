import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tt/core/services/setup/getIt.dart';
import 'package:tt/features/add_task/data/repo/add_task_repo.dart';
import 'package:tt/features/add_task/logic/add_task_cubit.dart';
import 'package:tt/features/home/data/repo/home_repo.dart';
import 'package:tt/features/home/logic/home_cubit.dart';
import 'package:tt/generated/codegen_loader.g.dart';
import 'package:tt/observer.dart';

import 'core/routes/app_pages.dart';
import 'core/services/cache/cash_helper.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  CashHelper.init();
  setup();
  Bloc.observer = MyBlocObserver();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/translations',
      assetLoader: const CodegenLoader(),
      fallbackLocale: const Locale('en', 'US'),
      startLocale: const Locale('en', 'US'),
      child: DevicePreview(
        enabled: false,
        builder: (context) => const MyApp(),
      ),
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
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) =>
                      HomeCubit(repo: getIt<HomeRepo>())..getAllTask()),
              BlocProvider(
                  create: (context) =>
                      AddTaskCubit(addTaskRepo: getIt<AddTaskRepo>()))
            ],
            child: MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              initialRoute:
                  CashHelper.sharedPreferences?.getString('token') != null
                      ? AppPages.home
                      : AppPages.onboarding,
              routes: routes,
              navigatorKey: getIt<NavigationService>().navigatorKey,
            ),
          );
        });
  }
}
