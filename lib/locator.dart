import 'package:drohealth/src/services/shopping_service.dart';
import 'package:get_it/get_it.dart';

import 'src/services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ShoppingService());
}
