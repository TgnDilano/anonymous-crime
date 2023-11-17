import 'package:flutter/material.dart';
import 'package:macos_ui_app/app/constants/colors.dart';
import 'package:macos_ui_app/app/extensions/number_ext.dart';
import 'package:macos_ui_app/app/widget/inputs/button.dart';
import 'package:macos_ui_app/app/widget/inputs/input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var data = {};
  final isLoadin = false.vn;

  loginUser(){
    isLoadin.value = true;
    print(data);
    isLoadin.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          "Welcome Back",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Welcome to stealth. your security is our priority",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.normal),
                        ),
                      ],
                    )
                  ],
                ),
                NInputField(
                  hintText: 'Name',
                  onChange: (str) {
                    data = {
                      ...data,
                      "name": str,
                    };
                  },
                ),
                NInputField(
                  hintText: 'Passoword',
                  isPwd: true,
                  onChange: (str) {
                    data = {
                      ...data,
                      "password": str,
                    };
                  },
                ),
                const SizedBox(height: 20),
                ValueListenableBuilder(
                  valueListenable: isLoadin,
                  builder: (context, value, _) {
                    return NButton(
                      text: "login",
                      onTap: loginUser,
                      isLoading: value,
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 13),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('');
                      },
                      child: const Text(
                        'Signup',
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
