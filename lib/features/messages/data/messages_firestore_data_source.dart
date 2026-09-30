import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/message.dart';

class MessagesFirestoreDataSource {
  MessagesFirestoreDataSource(this._firestore);
  final FirebaseFirestore _firestore;

  Stream<List<Message>> watchMessages(int requestId) {
    return _firestore
        .collection('threads')
        .doc(requestId.toString())
        .collection('messages')
        .orderBy('createdAt')
        .snapshots()
        .map((snapshot) => snapshot.docs.map(Message.fromFirestore).toList());
  }
}