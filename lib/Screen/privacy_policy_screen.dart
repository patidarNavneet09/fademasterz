import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/app_fonts.dart';
import 'package:fademasterz/Utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Utils/app_assets.dart';
import '../Utils/custom_app_bar.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: MyAppBar.myAppbar(
        title: const Text(
          AppStrings.privacyPolicy,
          style: AppFonts.appText,
        ),
        leading: IconButton(
          icon: SvgPicture.asset(
            AppIcon.backIcon,
            height: 12,
            width: 15,
            //     color: Theme.of(context).appBarTheme.foregroundColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
            // onCallback();
            setState(() {});
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Introduction',
              style: AppFonts.appText.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the main industry s standard dummy text ever since the'
              '1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              style: AppFonts.normalText.copyWith(fontSize: 14),
            ),
            const SizedBox(
              height: 21,
            ),
            Text(
              'Eligibility',
              style: AppFonts.appText.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the main industry s standard dummy text ever since the'
              '1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              style: AppFonts.normalText.copyWith(fontSize: 14),
            ),
            const SizedBox(
              height: 21,
            ),
            Text(
              'User Accounts and Membership',
              style: AppFonts.appText.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the main industry s standard dummy text ever since the'
              '1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              style: AppFonts.normalText.copyWith(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
