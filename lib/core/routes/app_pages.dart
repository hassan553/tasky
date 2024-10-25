import 'package:flutter/material.dart';

class AppPages {
  static const onboarding = '/';
  static const register = '/register';
  static const login = '/login';
}

Map<String, Widget Function(BuildContext)> routes = {
  AppPages.onboarding: (context) => const Scaffold(),
  AppPages.register: (context) => const Scaffold(),
  AppPages.login: (context) => const Scaffold(),
};
