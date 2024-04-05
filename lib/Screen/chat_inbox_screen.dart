import 'package:fademasterz/Utils/app_assets.dart';
import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../Utils/app_fonts.dart';
import '../Utils/custom_textfield.dart';

class ChatScreenInBox extends StatefulWidget {
  const ChatScreenInBox({super.key});

  @override
  State<ChatScreenInBox> createState() => _ChatScreenInBoxState();
}

class _ChatScreenInBoxState extends State<ChatScreenInBox> {
  TextEditingController chatCn = TextEditingController();
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
                      decoration: BoxDecoration(
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
            Text(DateFormat('dd MMM yyyy').format(DateTime.now()),
                style: AppFonts.normalText),
            Spacer(),
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
                fillColor: Color(0xffF4F4F4),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            SvgPicture.asset(
              AppIcon.sendIcon,
              height: 60,
              width: 58,
            )
          ],
        ),
      ),
    );
  }
}
