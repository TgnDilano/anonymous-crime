import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:macos_ui_app/app/constants/colors.dart';
import 'package:macos_ui_app/app/constants/styles.dart';
import 'package:macos_ui_app/app/controller/messaging_controller.dart';

typedef MessageRecord = ({Map user, Map data, String id, String name});

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final controller = Get.put(MessagingController());

  late final Stream<QuerySnapshot<Map<String, dynamic>>> _allRooms;

  @override
  initState() {
    super.initState();
    _allRooms = controller.getAllRooms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Message Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding),
        child: StreamBuilder(
          stream: _allRooms,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(
                "Error Occured",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.red),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(
                    color: AppColors.kPrimary,
                  ),
                ),
              );
            }

            if (snapshot.hasData) {
            } else {}

            return Container();
          },
        ),
      ),
    );
  }
}
