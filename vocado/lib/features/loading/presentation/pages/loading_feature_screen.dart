import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vocado/core/extensions/context_extensions.dart';
import 'package:vocado/core/navigation/routers.dart';
import 'package:vocado/core/widgets/loading_widget.dart';
import 'package:vocado/features/loading/presentation/cubit/loading_cubit.dart';
import 'package:vocado/features/loading/presentation/cubit/loading_state.dart';

class LoadingFeatureScreen extends StatelessWidget {
  const LoadingFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoadingCubit, LoadingState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.isLogging && state.role == "member") {
              context.go(Routes.taskViewer);
            } else if (state.isLogging && state.role == "admin") {
              context.go(Routes.taskCreator);
            } else {
              context.go(Routes.auth);
            }
          }

          if (state is LoadingErrorState) {
            context.showSnackBar(state.message, isError: true);
            context.go(Routes.auth);
          }
        },
        child: LoadingWidget(),
      ),
    );
  }
}
