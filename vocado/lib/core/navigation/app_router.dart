import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'routers.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/auth/presentation/pages/auth_feature_screen.dart';
import 'package:vocado/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:vocado/features/task_creator/presentation/pages/task_creator_feature_screen.dart';
import 'package:vocado/features/task_creator/presentation/cubit/task_creator_cubit.dart';
import 'package:vocado/features/task_viewer/presentation/pages/task_viewer_feature_screen.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';
import 'package:vocado/features/loading/presentation/pages/loading_feature_screen.dart';
import 'package:vocado/features/loading/presentation/cubit/loading_cubit.dart';
import 'package:vocado/features/sign_up/presentation/pages/sign_up_feature_screen.dart';
import 'package:vocado/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:vocado/features/team/presentation/pages/team_feature_screen.dart';
import 'package:vocado/features/team/presentation/cubit/team_cubit.dart';







class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.loading,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) {
          return Scaffold(body: Center(child: Text("splash screen")));
        }, // SplashScreen
      ),
    
  GoRoute(
    path: Routes.auth,
    builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(GetIt.I.get()),
          child: const AuthFeatureScreen(),
        ),
  ),

  GoRoute(
    path: Routes.taskCreator,
    builder: (context, state) => BlocProvider(
          create: (context) => TaskCreatorCubit(GetIt.I.get()),
          child: const TaskCreatorFeatureScreen(),
        ),
  ),

  GoRoute(
    path: Routes.taskViewer,
    builder: (context, state) => BlocProvider(
          create: (context) => TaskViewerCubit(GetIt.I.get()),
          child: const TaskViewerFeatureScreen(),
        ),
  ),

  GoRoute(
    path: Routes.loading,
    builder: (context, state) => BlocProvider(
          create: (context) => LoadingCubit(GetIt.I.get()),
          child: const LoadingFeatureScreen(),
        ),
  ),

  GoRoute(
    path: Routes.signUp,
    builder: (context, state) => BlocProvider(
          create: (context) => SignUpCubit(GetIt.I.get()),
          child: const SignUpFeatureScreen(),
        ),
  ),

  GoRoute(
    path: Routes.team,
    builder: (context, state) => BlocProvider(
          create: (context) => TeamCubit(GetIt.I.get()),
          child: const TeamFeatureScreen(),
        ),
  ),
],

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
