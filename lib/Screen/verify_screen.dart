import 'dart:async';
import 'dart:convert';

import 'package:fademasterz/Modal/verify_otp_modal.dart';
import 'package:fademasterz/Screen/profile_setup_screen.dart';
import 'package:fademasterz/Utils/app_assets.dart';
import 'package:fademasterz/Utils/app_fonts.dart';
import 'package:fademasterz/Utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ApiService/api_service.dart';
import '../Dashboard/dashboard.dart';
import '../Utils/app_color.dart';
import '../Utils/app_string.dart';
import '../Utils/custom_app_button.dart';
import '../Utils/utility.dart';

class VerifyScreen extends StatefulWidget {
  final String? phoneNo;
  const VerifyScreen({super.key, this.phoneNo});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController otpTextFieldCn = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  String currentText = "";
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Timer? optTimer;
  int mobileOtpSecondsRemaining = 30;
  void mobileStarttimer() {
    optTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (mobileOtpSecondsRemaining != 0) {
          mobileOtpSecondsRemaining--;
          if (mounted) {
            setState(() {});
          }
        } else {
          if (mounted) {
            setState(() {
              //  mobileEnableResend = true;
            });
          }
          optTimer?.cancel();
        }
      },
    );
  }

  @override
  void initState() {
    mobileStarttimer();
    setState(() {});
    super.initState();
  }

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
              height: 50,
            ),
            const Text(
              AppStrings.verifyCode,
              style: AppFonts.regular,
            ),
            RichText(
              text: TextSpan(
                text: AppStrings.codeVerification,
                style: AppFonts.text1.copyWith(color: AppColor.lightWhite),
                children: <InlineSpan>[
                  TextSpan(
                    text: AppStrings.yourNumber,
                    style: AppFonts.text1.copyWith(color: AppColor.lightWhite),
                  ),
                  TextSpan(
                    text: ' +${widget.phoneNo}',
                    style: AppFonts.text1.copyWith(
                        color: AppColor.yellow, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            PinCodeTextField(
              appContext: context, textStyle: AppFonts.textFieldFont,
              length: 4,
              obscureText: true,
              //obscuringCharacter: '*',
              obscuringWidget: const Text(
                '*',
                style: AppFonts.textFieldFont,
              ),

              blinkWhenObscuring: true,
              animationType: AnimationType.fade,
              // validator: (v) {
              //   if (v!.length < 3) {
              //     return ;
              //   } else {
              //     return null;
              //   }
              // },
              pinTheme: PinTheme(
                inactiveFillColor: AppColor.black,
                inactiveColor: AppColor.yellow.withOpacity(.21),
                selectedColor: AppColor.yellow,
                selectedFillColor: AppColor.black,
                activeColor: AppColor.black,
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8),
                fieldHeight: 60,
                fieldWidth: 71,
                activeFillColor: AppColor.black,
              ),
              cursorColor: AppColor.yellow,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              errorAnimationController: errorController,
              controller: otpTextFieldCn,
              keyboardType: TextInputType.number,

              onCompleted: (v) {
                debugPrint("Completed");
              },
              // onTap: () {
              //   print("Pressed");
              // },
              onChanged: (value) {
                debugPrint(value);
                setState(() {
                  currentText = value;
                });
              },
              beforeTextPaste: (text) {
                debugPrint("Allowing to paste $text");

                return true;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppIcon.clockIcon),
                SizedBox(
                  width: 10,
                ),
                Text(
                  mobileOtpSecondsRemaining.toString(),
                  style: AppFonts.text1.copyWith(
                    fontSize: 18,
                    color: AppColor.yellow,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.dontRecive,
                  style: AppFonts.text1.copyWith(
                    color: AppColor.white,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    snackBar('resend');
                  },
                  child: Text(
                    AppStrings.resend,
                    style: AppFonts.text1.copyWith(
                      color: AppColor.yellow,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MyAppButton(
        title: AppStrings.verify,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        onPress: () {
          if (isValidate()) {
            verifyOtp(context);
          }
        },
      ),
    );
  }

  bool isValidate() {
    if (otpTextFieldCn.text.isEmpty) {
      Helper().showToast('Please Enter Otp');
      return false;
    } else {
      return true;
    }
  }

  bool? profileSetUp = false;
  VerifyOtpModal verifyOtpModal = VerifyOtpModal();
  Future<void> verifyOtp(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // profileSetUp = sharedPreferences.getBool('profileSetUp');
    if (context.mounted) {
      Utility.progressLoadingDialog(context, true);
    }
    var request = {};
    request["country_code"] = "91";
    request['mobile_number'] = widget.phoneNo.toString();
    request["otp"] = otpTextFieldCn.text.trim();
    request["fcm_token"] = "test";
    request["device_id"] = sharedPreferences.getString('deviceId');
    request["device"] = sharedPreferences.getString('deviceType');

    HttpWithMiddleware http = HttpWithMiddleware.build(
      middlewares: [
        HttpLogger(logLevel: LogLevel.BODY),
      ],
    );

    var response = await http.post(
      Uri.parse(
        ApiService.verifyOtp,
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

    if (jsonResponse['status'] == true) {
      //sharedPreferences.setBool("profileSetUp", true);
      verifyOtpModal = VerifyOtpModal.fromJson(jsonResponse);

      sharedPreferences.setString(
          "access_Token", verifyOtpModal.data!.userDetail!.token.toString());

      Helper().showToast(
        jsonResponse['message'],
      );
      if (context.mounted) {
        debugPrint(
            '>>>>>>>>>>>>>>${verifyOtpModal.data?.userDetail?.name}<<<<<<<<<<<<<<');
        if (verifyOtpModal.data?.isSetup == 'yes') {
          // sharedPreferences.setBool("profileSetUp", true);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ProfileSetup(phoneNo: widget.phoneNo.toString()),
            ),
          );
        } else {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const DashBoardScreen(selectIndex: 0),
            ),
            (route) => false,
          );
        }
      }
    } else {
      Helper().showToast(
        jsonResponse['message'],
      );
    }
  }
}
