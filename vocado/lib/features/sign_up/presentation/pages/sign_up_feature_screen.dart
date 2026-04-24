import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:vocado/core/extensions/context_extensions.dart';
import 'package:vocado/core/utils/validators.dart';
import 'package:vocado/core/widgets/custom_field.dart';
import 'package:vocado/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:vocado/features/sign_up/presentation/cubit/sign_up_state.dart';

class SignUpFeatureScreen extends HookWidget {
  const SignUpFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final nameController = useTextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: const Text('SignUp Feature Screen')),
      body: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            context.showSnackBar(
              "Your account has been created successfully",
              isError: false,
            );
            context.pop();
          }
          if (state is SignUpErrorState) {
            context.showSnackBar(state.message, isError: true);
          }
        },
        child: Column(
          spacing: 10,
          crossAxisAlignment: .center,
          mainAxisAlignment: .center,
          children: [
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisAlignment: .spaceEvenly,
                  spacing: 10,
                  children: [
                    Text("Name"),
                    CustomField(
                      hintText: "Name",
                      icon: Icon(Icons.person),
                      controller: nameController,
                      validator: Validators.validateRequired,
                    ),
                    Text("Email"),
                    CustomField(
                      hintText: "Email",
                      icon: Icon(Icons.email),
                      controller: emailController,
                   
                    ),
                    Text("password"),
                    CustomField(
                      hintText: "Password",
                      icon: Icon(Icons.password),
                      controller: passwordController,
                      validator: Validators.validatePassword,
                    ),
                    Center(
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.getSignUpMethod(
                              email: emailController.text,
                              password: passwordController.text,
                              name: nameController.text,
                            );
                          }
                        },
                        child: Text("Create Account"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
