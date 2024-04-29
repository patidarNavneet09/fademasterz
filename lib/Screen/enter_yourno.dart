import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fademasterz/Screen/verify_screen.dart';
import 'package:fademasterz/Utils/app_assets.dart';
import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/app_fonts.dart';
import 'package:fademasterz/Utils/app_string.dart';
import 'package:fademasterz/Utils/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import '../ApiService/api_service.dart';
import '../Utils/custom_app_button.dart';
import '../Utils/helper.dart';
import '../Utils/utility.dart';

class EnterYourNo extends StatefulWidget {
  const EnterYourNo({super.key});

  @override
  State<EnterYourNo> createState() => _EnterYourNoState();
}

class _EnterYourNoState extends State<EnterYourNo> {
  TextEditingController phoneCn = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
            Form(
              key: _formKey,
              child: CustomTextField(
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
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MyAppButton(
        title: AppStrings.next,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        onPress: () async {
          if (isValidate()) {
            final List<ConnectivityResult> connectivityResult =
                await (Connectivity().checkConnectivity());

            if (connectivityResult.contains(ConnectivityResult.mobile)) {
              enterNumberApi(context);
            } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
              enterNumberApi(context);
            } else {
              Utility.showNoNetworkDialog(context);
            }
          }
        },
      ),
    );
  }

  bool isValidate() {
    if (phoneCn.text.isEmpty || phoneCn.text.length < 10) {
      Helper().showToast('Please Enter 11 Digit Mobile No.');
      return false;
    }
    return true;
  }

  Future<void> enterNumberApi(BuildContext context) async {
    if (context.mounted) {
      Utility.progressLoadingDialog(context, true);
    }
    var request = {};
    request["country_code"] = "91";
    request['mobile_number'] = phoneCn.text.trim();

    var response = await http.post(
      Uri.parse(
        ApiService.enterNumber,
      ),
      body: jsonEncode(request),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    if (context.mounted) {
      Utility.progressLoadingDialog(context, false);
    }

    Map<String, dynamic> jsonResponse = jsonDecode(
      response.body,
    );
    Helper().showToast(
      jsonResponse['message'],
    );
    if (jsonResponse['status'] == true) {
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyScreen(
              phoneNo: phoneCn.text.trim(),
            ),
          ),
        );
      }
    }
  }
}
