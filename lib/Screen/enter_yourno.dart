import 'package:fademasterz/Screen/verify_screen.dart';
import 'package:fademasterz/Utils/app_assets.dart';
import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/app_fonts.dart';
import 'package:fademasterz/Utils/app_string.dart';
import 'package:fademasterz/Utils/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../Utils/custom_app_button.dart';

class EnterYourNo extends StatefulWidget {
  const EnterYourNo({super.key});

  @override
  State<EnterYourNo> createState() => _EnterYourNoState();
}

class _EnterYourNoState extends State<EnterYourNo> {
  TextEditingController phoneCn = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 62),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                AppAssets.fadeMasterz,
                width: 160,
                height: 62,
              ),
            ),
            const SizedBox(
              height: 51,
            ),
            const Text(
              AppStrings.enterYourNumber,
              style: AppFonts.regular,
            ),
            Text(
              AppStrings.enterYourNumberLogin,
              style: AppFonts.text1,
            ),
            const SizedBox(
              height: 41,
            ),
            CustomTextField(
              controller: phoneCn,
              hintText: AppStrings.phoneNumber,
              maxLength: 11,
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.done,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(
                    r'^\d+?\d*',
                  ),
                ),
              ],
              prefixIcon: Align(
                heightFactor: 2,
                widthFactor: 2,
                child: SvgPicture.asset(
                  AppIcon.phoneIcon,
                  height: 17,
                  width: 17,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MyAppButton(
        title: AppStrings.next,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VerifyScreen(
                phoneNo: phoneCn.text.trim(),
              ),
            ),
          );
        },
      ),
    );
  }
}
