import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/core/extensions/context_extensions.dart';
import 'package:vocado/core/extensions/font_extensions.dart';
import 'package:vocado/core/navigation/routers.dart';
import 'package:vocado/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:vocado/features/profile/presentation/cubit/profile_state.dart';
import 'package:vocado/features/profile/presentation/widgets/profile_widget.dart';

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
            context.showSnackBar(
              "ou have been logged out successfully",
              isError: false,
            );
            context.go(Routes.auth);
          }
          if (state is ProfileErrorState) {
            context.showSnackBar(state.message, isError: true);
          }
        },
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileSuccessState) {
              final profile = state.profile;
              return SingleChildScrollView(
                child: Column(
                  spacing: 20,

                  children: [
                    Container(
                      width: 100.sw,
                      height: 20.sh,

                      decoration: BoxDecoration(
                        borderRadius: .only(
                          bottomLeft: .circular(16),
                          bottomRight: .circular(16),
                        ),
                        gradient: LinearGradient(
                          colors: [Colors.purpleAccent, Colors.blue.shade300],
                        ),
                      ),
                      child: Icon(
                        Icons.person,
                        size: 10.sizeSH(min: 35, max: 50),
                      ),
                    ),

                    ProfileWidget(
                      icon: Icon(Icons.key),
                      title: "ID",
                      subtitle: profile.id,
                    ),
                    ProfileWidget(
                      icon: Icon(Icons.person),
                      title: "Name",
                      subtitle: profile.name,
                    ),
                    ProfileWidget(
                      icon: Icon(Icons.email_outlined),
                      title: "Email",
                      subtitle: profile.email,
                    ),
                    ProfileWidget(
                      icon: Icon(Icons.recent_actors_outlined),
                      title: "RoleId",
                      subtitle: profile.role.toString(),
                    ),
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
