import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:ttt/core/services/network_service/api_service.dart';

import '../../../features/auth/data/repo/login_repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<DioImpl>(() => DioImpl());
  getIt
      .registerLazySingleton<LoginRepo>(() => LoginRepo(dio: getIt<DioImpl>()));
}
