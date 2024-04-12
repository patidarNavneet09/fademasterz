import 'dart:convert';

import 'package:fademasterz/Modal/help_center_modal.dart';
import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/app_fonts.dart';
import 'package:fademasterz/Utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';

import '../ApiService/api_service.dart';
import '../Utils/app_assets.dart';
import '../Utils/custom_app_bar.dart';
import '../Utils/helper.dart';
import '../Utils/utility.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => helpCenterApi(context));
  }

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
                        (helpCenterModal.data?.helpEmail.toString() ?? ''),
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
                        (helpCenterModal.data?.helpNumber.toString() ?? ''),
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
                        (helpCenterModal.data?.helpWebsite.toString() ?? ''),
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

  HelpCenterModal helpCenterModal = HelpCenterModal();
  Future<void> helpCenterApi(BuildContext context) async {
    if (context.mounted) {
      Utility.progressLoadingDialog(context, true);
    }
    var request = {};

    HttpWithMiddleware http = HttpWithMiddleware.build(
      middlewares: [
        HttpLogger(logLevel: LogLevel.BODY),
      ],
    );

    var response = await http.post(
        Uri.parse(
          ApiService.helpCenter,
        ),
        body: jsonEncode(request),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        });

    if (context.mounted) {
      Utility.progressLoadingDialog(context, false);
    }

    Map<String, dynamic> jsonResponse = jsonDecode(
      response.body,
    );

    if (jsonResponse['status'] == true) {
      helpCenterModal = HelpCenterModal.fromJson(jsonResponse);

      Helper().showToast(
        jsonResponse['message'],
      );

      setState(() {});
      if (context.mounted) {
      } else {
        Helper().showToast(
          jsonResponse['message'],
        );
      }
    }
  }
}
