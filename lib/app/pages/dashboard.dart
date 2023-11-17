import 'package:flutter/material.dart';
import 'package:macos_ui_app/app/constants/styles.dart';
import 'package:macos_ui_app/app/extensions/number_ext.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        leading: const SizedBox(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            12.height,
            const Text("All Cases"),
            12.height,
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.red.shade400,
                        child: const Icon(Icons.close),
                      ),
                      title: const Text("Murder"),
                      subtitle: Text(
                        "The murder haunted me for a long time. I kept seeing the man's face in my dreams, and I would wake up in the middle of the night with his screams echoing in my ears.",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 13,
                        ),
                      ),
                      trailing: const Text("12/23/2023"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
