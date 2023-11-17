import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId, receiverId, senderEmail, text;
  final bool hasRead;
  final Timestamp timestamp;

  Message({
    required this.senderId,
    required this.receiverId,
    required this.senderEmail,
    required this.text,
    this.hasRead = false,
    required this.timestamp,
  });

  static Message fromMap(Map<String, dynamic> json) => Message(
        senderId: json['senderId'],
        senderEmail: json['senderEmail'],
        receiverId: json['receiverId'],
        text: json['text'],
        timestamp: json['timestamp'],
      );

  Map<String, dynamic> toMap() => {
        'receiverId': receiverId,
        'senderId': senderId,
        'senderEmail': senderEmail,
        'text': text,
        'timestamp': timestamp,
      };
}
