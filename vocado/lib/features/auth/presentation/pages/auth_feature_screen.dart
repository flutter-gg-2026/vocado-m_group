import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:vocado/core/extensions/context_extensions.dart';
import 'package:vocado/core/navigation/routers.dart';
import 'package:vocado/core/utils/validators.dart';
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
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            context.go(Routes.loading);
          }
          if (state is AuthErrorState) {
            context.showSnackBar(state.message, isError: true);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 10,
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisAlignment: .spaceEvenly,
                  spacing: 10,
                  children: [
                    Text("Email"),
                    CustomField(
                      hintText: "Email",
                      icon: Icon(Icons.email),
                      controller: emailController,
                      validator: Validators.validateEmail,
                    ),
                    Text("password"),
                    CustomField(
                      hintText: "Password",
                      icon: Icon(Icons.password),
                      controller: passwordController,
                      validator: Validators.validatePassword,
                    ),
                    Center(
                      child: Column(
                        spacing: 10,
                        children: [
                          FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.blueGrey,
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.getAuthMethod(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            child: Text("Sign in"),
                          ),
                          FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.blueGrey,
                            ),
                            onPressed: () {
                              context.push(Routes.signUp);
                            },
                            child: Text("Sign up"),
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
    );
  }
}
