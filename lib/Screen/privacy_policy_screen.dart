import 'dart:convert';

import 'package:fademasterz/Modal/privacy_policy_modal.dart';
import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/app_fonts.dart';
import 'package:fademasterz/Utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';

import '../ApiService/api_service.dart';
import '../Utils/app_assets.dart';
import '../Utils/custom_app_bar.dart';
import '../Utils/helper.dart';
import '../Utils/utility.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _privacyPolicy());
  }

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

            setState(() {});
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HtmlWidget(
                (privacyPolicyModal.data?.privacyPolicy ?? ''),
                customStylesBuilder: (element) {
                  return {'color': 'white'};
                },

                textStyle: TextStyle(
                  color: Colors.white,
                ),
                //  viewType: (privacyPolicyModal.data?.privacyPolicy ?? ''),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PrivacyPolicyModal privacyPolicyModal = PrivacyPolicyModal();
  void _privacyPolicy() async {
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
          ApiService.privacyPolicy,
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
    debugPrint('>>>>>>>>>>>>>>${jsonResponse}<<<<<<<<<<<<<<');
    if (jsonResponse['status'] == true) {
      privacyPolicyModal = PrivacyPolicyModal.fromJson(jsonResponse);
      debugPrint(
          '>>>>>>>>>>>>>>${privacyPolicyModal.data?.privacyPolicy}<<<<<<<<<<<<<<');

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
