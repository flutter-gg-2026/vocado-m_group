import 'package:get_it/get_it.dart';
import 'package:vocado/core/di/configure_dependencies.config.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/features/auth/di/auth_di.dart';
import 'package:vocado/features/task_creator/di/task_creator_di.dart';
import 'package:vocado/features/task_viewer/di/task_viewer_di.dart';
import 'package:vocado/features/loading/di/loading_di.dart';
import 'package:vocado/features/sign_up/di/sign_up_di.dart';

@InjectableInit(
  initializerName: 'init', 
  preferRelativeImports: true,
  asExtension: true, 
  generateForDir: ['lib/core'],
)

Future<void> configureDependencies() async {
  final getIt = GetIt.instance;
  getIt.init();
    configureAuth(getIt);
    configureTaskCreator(getIt);
    configureTaskViewer(getIt);
    configureLoading(getIt);
    configureSignUp(getIt);
}
