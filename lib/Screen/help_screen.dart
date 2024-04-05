import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/app_fonts.dart';
import 'package:fademasterz/Utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Utils/app_assets.dart';
import '../Utils/custom_app_bar.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: MyAppBar.myAppbar(
        title: const Text(
          AppStrings.help,
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
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 9,
              ),
              decoration: BoxDecoration(
                color: AppColor.black,
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppIcon.headphoneIcon,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        AppStrings.customerService,
                        style: AppFonts.normalText.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      )
                    ],
                  ),
                  const Divider(
                    height: 20,
                    color: Color(0xff434343),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppIcon.gmailIcon,
                        color: AppColor.white,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Lorem@gmail.com',
                        style: AppFonts.normalText.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppIcon.phoneIcon,
                        color: AppColor.white,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        '+54656466464',
                        style: AppFonts.normalText.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppIcon.webIcon,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        'www.fademasterz.com',
                        style: AppFonts.normalText.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SvgPicture.asset(
                      AppIcon.instagram,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      AppStrings.instagram,
                      style: AppFonts.appText.copyWith(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset(
                      AppIcon.twitterIcon,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      AppStrings.twitter,
                      style: AppFonts.appText.copyWith(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset(
                      AppIcon.facebookIcon,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      AppStrings.facebook,
                      style: AppFonts.appText.copyWith(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset(
                      AppIcon.whatsappIcon,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      AppStrings.whatsapp,
                      style: AppFonts.appText.copyWith(
                        fontSize: 15,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
