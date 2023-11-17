import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:macos_ui_app/app/config/routes/routes.dart';
import 'package:macos_ui_app/app/widget/inputs/input_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text("Welcome Back"),
              NInputField(
                onChange: (str) {},
              ),
              Image.asset("assets/images/logo.png"),
              NInputField(
                onChange: (str) {
                  context.pushNamed(AppRoutes.loginPage.name);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
