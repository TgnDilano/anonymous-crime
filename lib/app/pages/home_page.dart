import 'package:flutter/material.dart';
import 'package:macos_ui_app/app/widget/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      body: widget.child,
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
