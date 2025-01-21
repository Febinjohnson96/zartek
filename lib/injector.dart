import 'package:get_it/get_it.dart';
import 'package:zartek/core/utils/applogger.dart';
import 'package:zartek/managers/auth/auth.dart';

final injector = GetIt.instance;

Future<void> initializeInjector() async {
  AppLogger.infolog("intializing injector");
  if (!injector.isRegistered<Authentication>()) {
    injector.registerLazySingleton<Authentication>(() => Authentication());
  }
}
