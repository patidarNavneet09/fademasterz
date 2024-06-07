import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fademasterz/Utils/app_assets.dart';
import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/custom_app_bar.dart';
import 'package:fademasterz/Utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/app_fonts.dart';
import '../Utils/chat_service.dart';
import '../Utils/custom_textfield.dart';

class ChatScreenInBox extends StatefulWidget {
  const ChatScreenInBox({super.key});

  @override
  State<ChatScreenInBox> createState() => _ChatScreenInBoxState();
}

class _ChatScreenInBoxState extends State<ChatScreenInBox> {
  TextEditingController chatCn = TextEditingController();
  String? senderId = '';
  String? receiverId = '';
  ChatService chatService = ChatService();
  void onSendMessage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (chatCn.text.isNotEmpty) {
      // Map<String, dynamic>? messages = {
      //   'sendby': auth.currentUser?.displayName,
      //   'message': chatCn.text,
      //   'time': FieldValue.serverTimestamp(),
      // };
      // await firestore
      //     .collection('chatroom')
      //     .doc(widget.chatRoomId)
      //     .collection('chats')
      //     .add(messages);
      // setState(() {});
      senderId = sharedPreferences.getInt('senderId').toString();
      receiverId = sharedPreferences.getInt('receiverId').toString();
      await chatService.sendMessage(
          sharedPreferences.getInt('receiverId').toString(),
          chatCn.text.toString());
      chatCn.clear();
    } else {
      Helper().showToast('Enter Some Text');
      debugPrint('>>>>>>>>>>>>>>${'enter some text'}<<<<<<<<<<<<<<');
    }
  }

  Future<void> getID() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    senderId = sharedPreferences.getInt('senderId').toString();
    receiverId = sharedPreferences.getInt('receiverId').toString();
    setState(() {});
  }

  @override
  void initState() {
    getID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: MyAppBar.myAppbar(
        title: Row(
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Stack(alignment: Alignment.center, children: [
                Image.asset(
                  AppAssets.dummyImage,
                  height: 40,
                  width: 40,
                ),
                Positioned(
                    right: 0,
                    top: 3,
                    // left: 15,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColor.gray),
                      child: Container(
                        height: 8,
                        width: 7,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.green),
                      ),
                    ))
              ]),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Larry Page',
              style: AppFonts.regular
                  .copyWith(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Divider(
              color: Color(0xff434343),
            ),

            _buildMessages(),
            // Row(
            //   children: [
            //     Expanded(
            //       child: CustomTextField(
            //         controller: chatCn,
            //         hintText: 'Type a message',
            //         hintTextStyle: AppFonts.normalText
            //             .copyWith(fontSize: 17, color: AppColor.bg),
            //         radius: 4,
            //         isFilled: true,
            //         style:
            //             AppFonts.textFieldFont.copyWith(color: AppColor.black),
            //         fillColor: Color(0xffF4F4F4),
            //       ),
            //     ),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     SvgPicture.asset(
            //       AppIcon.sendIcon,
            //       height: 60,
            //       width: 58,
            //     )
            //   ],
            // ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: chatCn,
                hintText: 'Type a message',
                hintTextStyle: AppFonts.normalText
                    .copyWith(fontSize: 17, color: AppColor.bg),
                radius: 4,
                isFilled: true,
                style: AppFonts.textFieldFont.copyWith(color: AppColor.black),
                fillColor: const Color(0xffF4F4F4),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                onSendMessage();
              },
              child: SvgPicture.asset(
                AppIcon.sendIcon,
                height: 60,
                width: 58,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMessages() {
    debugPrint('>>>>>>receiverId>>>>>>>>$receiverId<<<<<<<<<<<<<<');
    return StreamBuilder<QuerySnapshot>(
      stream: chatService.getMessage(senderId!, receiverId
          // sharedPreferences.getInt('receiverId').toString(),
          ),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data?.docs.length,
          itemBuilder: (context, index) {
            // Map<String, dynamic> map =
            //     snapshot.data?.docs[index].data();

            return Align(
              alignment: snapshot.data!.docs[index]['senderId'] == senderId
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                height: 50,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                    borderRadius:
                        snapshot.data!.docs[index]['senderId'] == senderId
                            ? const BorderRadius.only(
                                topRight: Radius.circular(8),
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.elliptical(-20, -10))
                            : const BorderRadius.only(),
                    color: Colors.green),
                child: Text(
                  snapshot.data!.docs[index]['message'].toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
