import 'package:flutter/material.dart';
import 'package:ttt/features/onboarding/onboarding_screen.dart';

class AppPages {
  static const onboarding = '/';
  static const register = '/register';
  static const login = '/login';
}

Map<String, Widget Function(BuildContext)> routes = {
  AppPages.onboarding: (context) => const OnboardingScreen(),
  AppPages.register: (context) => const Scaffold(),
  AppPages.login: (context) => const Scaffold(),
};
