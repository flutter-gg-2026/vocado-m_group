import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:vocado/features/main_nav/presentation/cubit/main_nav_cubit.dart';
import 'package:vocado/features/main_nav/presentation/cubit/main_nav_state.dart';
import 'package:vocado/features/task_creator/presentation/pages/task_creator_feature_screen.dart';
import 'package:vocado/features/task_creator/presentation/cubit/task_creator_cubit.dart';
import 'package:vocado/features/team/presentation/pages/team_feature_screen.dart';
import 'package:vocado/features/team/presentation/cubit/team_cubit.dart';
import 'package:vocado/features/tasks_board/presentation/pages/tasks_board_feature_screen.dart';
import 'package:vocado/features/tasks_board/presentation/cubit/tasks_board_cubit.dart';
import 'package:vocado/features/profile/presentation/pages/profile_feature_screen.dart';
import 'package:vocado/features/profile/presentation/cubit/profile_cubit.dart';

class MainNavFeatureScreen extends StatelessWidget {
  const MainNavFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TaskCreatorCubit(GetIt.I())),
        BlocProvider(create: (_) => TeamCubit(GetIt.I())),
        BlocProvider(create: (_) => TasksBoardCubit(GetIt.I())),
        BlocProvider(create: (_) => ProfileCubit(GetIt.I())),
      ],
      child: BlocBuilder<MainNavCubit, MainNavState>(
        builder: (context, state) {
          final index = state is MainNavInitialState ? state.index : 0;

          final pages = [
            TaskCreatorFeatureScreen(),
            TeamFeatureScreen(),
            TasksBoardFeatureScreen(),
            ProfileFeatureScreen(),
          ];

          return Scaffold(
            body: pages[index],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: index,
              onTap: (i) {
                context.read<MainNavCubit>().changeTab(i);
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.group), label: "Team"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: "Task Board",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
