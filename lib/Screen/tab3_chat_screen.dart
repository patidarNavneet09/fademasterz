import 'package:fademasterz/Screen/chat_inbox_screen.dart';
import 'package:fademasterz/Utils/app_assets.dart';
import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/app_fonts.dart';
import 'package:fademasterz/Utils/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../Utils/app_string.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: MyAppBar.myAppbar(
        title: const Text(
          AppStrings.inbox,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView.separated(
          itemCount: 12,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreenInBox(),
                  ),
                );
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.dummyImage,
                        height: 49,
                        width: 49,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Larry Page',
                            style: AppFonts.regular.copyWith(fontSize: 15),
                          ),
                          Text(
                            'Lorem ipsum dolor sit amet..',
                            style: AppFonts.normalText.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        '3:00pm',
                        style: AppFonts.yellowFont,
                      )
                    ],
                  ),
                  Divider(
                    color: AppColor.dividerColor,
                  )
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            height: 10,
          ),
        ),
      ),
    );
  }
}
