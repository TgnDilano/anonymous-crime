import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:macos_ui_app/app/config/routes/routes.dart';
import 'package:macos_ui_app/app/constants/colors.dart';
import 'package:macos_ui_app/app/widget/inputs/button.dart';
import 'package:macos_ui_app/app/widget/inputs/input_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _passwordCodeController = TextEditingController();
    TextEditingController _cpasswordCodeController = TextEditingController();

    void loginUser() {
      print(_nameController.text);
      print(_passwordCodeController.text);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Register To  STEALTH"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "STEALTH",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Welcome to stealth. Your security is our priority",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.normal),
                        ),
                      ],
                    )
                  ],
                ),
                NInputField(
                  controller: _nameController,
                  hintText: 'Name',
                  onChange: (str) {
                    // _nameController.value = str;
                  },
                ),
                NInputField(
                  controller: _nameController,
                  hintText: 'Passoword',
                  isPwd: true,
                  onChange: (str) {
                    // _nameController.value = str;
                  },
                ),
                NInputField(
                  hintText: 'Confirm Passoword',
                  isPwd: true,
                  controller: _cpasswordCodeController,
                  onChange: (str) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                const NButton(
                  text: "Login",
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 13),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(AppRoutes.loginPage.name);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.kPrimary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
