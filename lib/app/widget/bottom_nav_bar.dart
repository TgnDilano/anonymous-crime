import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:macos_ui_app/app/config/routes/routes.dart';

class NavItem {
  final String routeName;
  final IconData iconData;

  NavItem({required this.routeName, required this.iconData});
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final navbarData = [
    NavItem(routeName: AppRoutes.dashboardPage.name, iconData: Icons.dashboard),
    NavItem(routeName: AppRoutes.reportCase.name, iconData: Icons.add),
    NavItem(routeName: AppRoutes.messagePage.name, iconData: Icons.message),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(bottom: 12),
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.8,
            color:
                context.isDarkMode ? Colors.transparent : Colors.grey.shade200,
          ),
        ),
        color: Theme.of(context).appBarTheme.backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          navbarData.length,
          (index) {
            final item = navbarData[index];
            return GestureDetector(
              onTap: () {
                context.goNamed(item.routeName);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                color: Colors.transparent,
                child: Icon(item.iconData),
              ),
            );
          },
        ),
      ),
    );
  }
}
