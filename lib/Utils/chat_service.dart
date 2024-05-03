import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Modal/chat_user_modal.dart';

class ChatService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> sendMessage(String receiverId, message) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? currentUserId = sharedPreferences.getInt('senderId').toString();
    String? currentUserEmail = sharedPreferences.getString('email');
    final Timestamp timestamp = Timestamp.now();
    Messages messages = Messages(
      senderId: currentUserId.toString(),
      senderEmail: currentUserEmail.toString(),
      receiverId: receiverId,
      message: message,
      timestamp: timestamp,
    );
    List<String> ids = [currentUserId.toString(), receiverId];
    ids.sort();
    String chatRoomId = ids.join('_');
    await firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(messages.toMap());
  }

  Stream<QuerySnapshot> getMessage(String userId, otherUserId) {
    List<String> ids = [userId.toString(), otherUserId];
    ids.sort();
    String chatRoomId = ids.join('_');

    return firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
