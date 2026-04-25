import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'main_nav_di.config.dart'; 

@InjectableInit(
  initializerName: 'initMainNav',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/main_nav'],
)
void configureMainNav(GetIt getIt) {
  getIt.initMainNav();
}
