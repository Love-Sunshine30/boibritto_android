import 'package:cloud_firestore/cloud_firestore.dart';

/// Read from Firestore only — never constructed from a REST response. The
/// composer deliberately doesn't optimistically insert a bubble from the
/// POST response; it waits for this same listener to surface the new
/// message, avoiding the dedupe-by-content bugs architecture §10 calls out.
///
/// Field names match backend's `messageDoc` struct (firestore tags):
/// `senderId`, `body`, `createdAt` — camelCase, confirmed against the Go
/// source rather than assumed from the REST schema's snake_case.
class Message {
  const Message({
    required this.id,
    required this.senderId,
    required this.body,
    required this.createdAt,
  });

  final String id;
  final int senderId;
  final String body;
  final DateTime createdAt;

  factory Message.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    final timestamp = data['createdAt'];
    return Message(
      id: doc.id,
      senderId: data['senderId'] as int,
      body: data['body'] as String,
      createdAt: timestamp is Timestamp ? timestamp.toDate() : DateTime.now(),
    );
  }
}