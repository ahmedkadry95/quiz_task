import 'package:get_it/get_it.dart';
import 'package:task/app/auth/log_In/login_view_model.dart';
import 'package:task/app/auth/register/register_view_model.dart';
import 'package:task/app/home/view_model/home_view_model.dart';
import 'package:task/app/play/view_model/play_view_model.dart';
import 'package:task/app/splash/view_model/splash_view_model.dart';
import 'package:task/services/api_service.dart';
import 'package:task/services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ApiService());
  initSingleton();
  locator.registerFactory(() => SplashViewModel());
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => RegisterViewModel());
  locator.registerFactory(() => PlayViewModel());
}

void initSingleton() {
  locator<ApiService>();
}
