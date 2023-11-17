import 'package:flutter/material.dart';
import 'package:macos_ui_app/app/extensions/number_ext.dart';
import 'package:macos_ui_app/app/widget/inputs/button.dart';
import 'package:macos_ui_app/app/widget/inputs/input_field.dart';

class ReportCase extends StatefulWidget {
  const ReportCase({super.key});

  @override
  State<ReportCase> createState() => _ReportCaseState();
}

class _ReportCaseState extends State<ReportCase> {
  var data = {};
  final isLoadin = false.vn;

  loginUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Report Case"),
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
                        Align(
                          child: Text(
                            "Welcome to stealth. Please enter \ninformatoin about your Case",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                23.height,
                NInputField(
                  title: "Title",
                  hintText: 'Title',
                  onChange: (str) {
                    data = {
                      ...data,
                      "title": str,
                    };
                  },
                ),
                18.height,
                NInputField(
                  title: "Description",
                  hintText: 'Description',
                  onChange: (str) {
                    data = {
                      ...data,
                      "name": str,
                    };
                  },
                ),
                18.height,
                NInputField(
                  title: "Date",
                  hintText: 'Description',
                  onChange: (str) {
                    data = {
                      ...data,
                      "name": str,
                    };
                  },
                ),
                18.height,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
