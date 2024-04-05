import 'package:fademasterz/Utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../Dashboard/dashboard.dart';
import '../Utils/app_assets.dart';
import '../Utils/app_fonts.dart';
import '../Utils/app_string.dart';
import '../Utils/custom_app_button.dart';
import '../Utils/custom_textfield.dart';

class ProfileSetup extends StatefulWidget {
  const ProfileSetup({super.key});

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  TextEditingController phoneCn = TextEditingController();
  TextEditingController nameCn = TextEditingController();
  TextEditingController gmailCn = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 37),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                AppIcon.backIcon,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              AppStrings.profileSetup,
              style: AppFonts.regular,
            ),
            Text(
              AppStrings.profileInformation,
              style: AppFonts.text,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              controller: nameCn,
              hintText: AppStrings.name,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              prefixIcon: Align(
                heightFactor: 2,
                widthFactor: 2,
                child: SvgPicture.asset(
                  AppIcon.parsonIcon,
                  height: 17,
                  width: 17,
                ),
              ),
            ),
            // MyTextField.myTextFormField(
            //   controller: nameCn,
            //   textInputType: TextInputType.text,
            //   textInputAction: TextInputAction.next,
            //   hintText: AppStrings.name,
            //   prefixIcon: Align(
            //     heightFactor: 2,
            //     widthFactor: 2,
            //     child: SvgPicture.asset(
            //       AppIcon.parsonIcon,
            //       height: 17,
            //       width: 17,
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 15,
            ),

            CustomTextField(
              controller: gmailCn,
              hintText: AppStrings.email,
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              prefixIcon: Align(
                heightFactor: 2,
                widthFactor: 2,
                child: SvgPicture.asset(
                  AppIcon.gmailIcon,
                  height: 17,
                  width: 17,
                ),
              ),
            ),
            // MyTextField.myTextFormField(
            //   controller: gmailCn,
            //   maxLength: 10,
            //   textInputType: TextInputType.emailAddress,
            //   textInputAction: TextInputAction.next,
            //   onTap: () {},
            //   hintText: AppStrings.email,
            //   prefixIcon: Align(
            //     heightFactor: 2,
            //     widthFactor: 2,
            //     child: SvgPicture.asset(
            //       AppIcon.gmailIcon,
            //       height: 17,
            //       width: 17,
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              controller: phoneCn,
              hintText: AppStrings.mobileNo,
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.done,
              maxLength: 11,
              hintTextStyle: AppFonts.textFieldFont,
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
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const DashBoardScreen(
                selectIndex: 0,
              ),
            ),
            (Route<dynamic> route) => false,
          );
        },
      ),
    );
  }
}
