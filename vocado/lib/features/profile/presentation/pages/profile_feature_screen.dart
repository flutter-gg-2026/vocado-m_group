import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vocado/core/extensions/context_extensions.dart';
import 'package:vocado/core/navigation/routers.dart';
import 'package:vocado/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:vocado/features/profile/presentation/cubit/profile_state.dart';

class ProfileFeatureScreen extends StatelessWidget {
  const ProfileFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Feature Screen'),
        actions: [
          IconButton(
            onPressed: () {
              cubit.getSignOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is SignOutSuccessState) {
            context.showSnackBar("Log out", isError: false);
            context.go(Routes.auth);
          }
          if (state is ProfileErrorState) {
            context.showSnackBar(state.message, isError: true);
          }
        },
        child: Column(children: [
         
          ],
        ),
      ),
    );
  }
}
