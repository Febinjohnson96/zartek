import 'package:get_it/get_it.dart';
import 'package:zartek/core/infra/app_manager.dart';
import 'package:zartek/core/utils/applogger.dart';
import 'package:zartek/data/repo/home_repo_impl.dart';
import 'package:zartek/domain/repo/home_repo.dart';
import 'package:zartek/managers/auth/auth.dart';

final injector = GetIt.instance;

Future<void> initializeInjector() async {
  AppLogger.infolog("intializing injector");
  if (!injector.isRegistered<Authentication>()) {
    injector.registerLazySingleton<Authentication>(() => Authentication());
  }

  if (!injector.isRegistered<ApiBaseHelper>()) {
    injector.registerLazySingleton<ApiBaseHelper>(() => ApiBaseHelper());
  }

//need to find optmized
  if (!injector.isRegistered<HomeRepo>()) {
    injector
        .registerSingleton<HomeRepo>(HomeRepoImpl(apiBaseHelper: injector()));
  }
}
