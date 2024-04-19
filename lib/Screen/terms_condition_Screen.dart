import 'dart:convert';

import 'package:fademasterz/Modal/terms_condition_modal.dart';
import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/app_fonts.dart';
import 'package:fademasterz/Utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:http/http.dart' as http;

import '../ApiService/api_service.dart';
import '../Utils/app_assets.dart';
import '../Utils/custom_app_bar.dart';
import '../Utils/helper.dart';
import '../Utils/utility.dart';

class TermsConditionScreen extends StatefulWidget {
  const TermsConditionScreen({super.key});

  @override
  State<TermsConditionScreen> createState() => _TermsConditionScreen();
}

class _TermsConditionScreen extends State<TermsConditionScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _termsConditionScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: MyAppBar.myAppbar(
        title: const Text(
          AppStrings.termConditions,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: HtmlWidget(
            (termsConditionModal.data?.terms ?? ''),
            customStylesBuilder: (element) {
              return {'color': 'white'};
            },

            textStyle: const TextStyle(color: Colors.white, fontSize: 15),
            //  viewType: (privacyPolicyModal.data?.privacyPolicy ?? ''),
          ),
        ),
      ),
    );
  }

  TermsConditionModal termsConditionModal = TermsConditionModal();
  void _termsConditionScreen() async {
    if (context.mounted) {
      Utility.progressLoadingDialog(context, true);
    }
    var request = {};

    var response = await http.post(
        Uri.parse(
          ApiService.termsCondition,
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
      termsConditionModal = TermsConditionModal.fromJson(jsonResponse);

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
