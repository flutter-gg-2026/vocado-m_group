import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/profile/presentation/cubit/profile_cubit.dart';

class ProfileFeatureScreen extends StatelessWidget {
  const ProfileFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
      final _ = context.read<ProfileCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Profile Feature Screen')),
      body: Column(children: [
          
        ],
      ),
    );
  }
}
