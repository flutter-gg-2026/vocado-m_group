import 'package:any_image_view/any_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:vocado/core/extensions/context_extensions.dart';
import 'package:vocado/core/navigation/routers.dart';
import 'package:vocado/core/utils/validators.dart';
import 'package:vocado/core/widgets/button_widget.dart';
import 'package:vocado/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:vocado/features/auth/presentation/cubit/auth_state.dart';
import 'package:vocado/core/widgets/custom_field.dart';

class AuthFeatureScreen extends HookWidget {
  const AuthFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            context.go(Routes.loading);
          }
          if (state is AuthErrorState) {
            context.showSnackBar(state.message, isError: true);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 10,
              crossAxisAlignment: .center,
              mainAxisAlignment: .center,
              children: [
                AnyImageView(
                  imagePath: 'assets/images/logo.png',
                  height: 200,
                  width: 200,
                  fit: BoxFit.contain,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .spaceEvenly,
                    spacing: 16,
                    children: [
                      CustomField(
                        hintText: "Email",
                        icon: Icon(Icons.email_outlined),
                        controller: emailController,
                        validator: Validators.validateEmail,
                      ),
                      CustomField(
                        hintText: "Password",
                        icon: Icon(Icons.lock_outline),
                        controller: passwordController,
                        validator: Validators.validatePassword,
                      ),
                      SizedBox(height: 15),
                      Center(
                        child: Column(
                          spacing: 10,
                          children: [
                            ButtonWidget(
                              text: "Sign in",
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.getAuthMethod(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                            ),
                            ButtonWidget(
                              text: "Sign up",
                              onPressed: () {
                                context.push(Routes.signUp);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
