import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:macos_ui_app/app/controller/app_controller.dart';
import 'package:macos_ui_app/app/model/message.dart';
import 'package:macos_ui_app/app/util/show_snackbar.dart';

class MessagingController extends GetxController {
  final _fireStore = FirebaseFirestore.instance;
  final user = AppController.find.user;

  Stream<QuerySnapshot> getMessages({required String roomId}) {
    return _fireStore
        .collection('rooms')
        .doc(roomId)
        .collection('messages')
        .orderBy("timestamp", descending: false)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllRooms() {
    var mychatsStream = _fireStore
        .collection('rooms')
        .orderBy("timestamp", descending: true)
        .snapshots();

    return mychatsStream;
  }

  Future<void> markLstMessageAsRead(Map inboxUser) async {
    var ids = [
      inboxUser['blockchainIdentifier'],
      user.blockchainIdentifier,
    ];

    ids.sort();

    var roomId = ids.join("-");

    try {
      await _fireStore.collection('rooms').doc(roomId).update(
        {
          "isNew": false,
          "senderId": user.blockchainIdentifier,
        },
      );
    } catch (e) {
      e.printError();
    } finally {}
  }

  Future<bool> sendMessage(
    BuildContext context,
    Map inboxUser,
    String message,
    Map groupData,
  ) async {
    var roomId = "";

    if (groupData.isEmpty) {
      var ids = [
        inboxUser['blockchainIdentifier'],
        user.blockchainIdentifier,
      ];

      ids.sort();

      roomId = ids.join("-");
    } else {
      roomId = groupData['id'] ?? '';
    }

    final newMessage = Message(
      senderId: user.blockchainIdentifier,
      receiverId: inboxUser['blockchainIdentifier'] ?? roomId,
      senderEmail: user.email,
      text: message,
      timestamp: Timestamp.now(),
    );

    try {
      var futures = [
        _fireStore
            .collection('rooms')
            .doc(roomId)
            .collection('messages')
            .add(newMessage.toMap()),
        _fireStore.collection('rooms').doc(roomId).set(
          {
            "lastMessage": message,
            "isNew": true,
            "senderId": user.blockchainIdentifier,
            "timestamp": Timestamp.now(),
            "name": groupData['name'] ?? '',
          },
        ),
      ];

      await Future.wait(futures);

      return true;
    } catch (e) {
      if (context.mounted) {
        showSimpleSnackBar(
          context: context,
          message: "Message not send",
        );
      }

      return false;
    } finally {}
  }
}
