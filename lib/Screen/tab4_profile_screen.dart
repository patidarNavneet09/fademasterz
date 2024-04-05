import 'dart:io';

import 'package:fademasterz/Screen/edit_profile_screen.dart';
import 'package:fademasterz/Screen/help_screen.dart';
import 'package:fademasterz/Screen/privacy_policy_screen.dart';
import 'package:fademasterz/Screen/terms_condition_Screen.dart';
import 'package:fademasterz/Utils/app_assets.dart';
import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/app_string.dart';
import 'package:fademasterz/Utils/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../Utils/app_fonts.dart';
import 'enter_yourno.dart';

class ProfileScreen extends StatefulWidget {
  final Function(int) onTap;
  const ProfileScreen({super.key, required this.onTap});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final picker = ImagePicker();
  File? _imageFile;
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  Future showOptions() async {
    showCupertinoModalPopup(
      barrierDismissible: false,
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Photo Gallery'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Camera'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              getImageFromCamera();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Cancel'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: MyAppBar.myAppbar(
        title: const Text(
          AppStrings.profile,
          style: AppFonts.appText,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: AppColor.black),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(70),
                          child: _imageFile == null
                              ? Image.asset(
                                  AppAssets.dummyImage,
                                  height: 72,
                                  width: 72,
                                  fit: BoxFit.fill,
                                )
                              : Image.file(
                                  _imageFile ?? File('path'),
                                  height: 72,
                                  width: 72,
                                  fit: BoxFit.fill,
                                ),
                        ),
                        Positioned(
                          bottom: -3,
                          right: 2,
                          child: InkWell(
                              onTap: () {
                                showOptions();
                              },
                              child: SvgPicture.asset(AppIcon.cameraIcon)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Robert Pattinson',
                      style: AppFonts.appText.copyWith(fontSize: 17),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfileScreen(
                          //updateProfile: updateProfile,
                          ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      color: AppColor.black),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcon.parsonIcon,
                        color: AppColor.white,
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Expanded(
                        child: Text(AppStrings.editProfile,
                            style: AppFonts.appText.copyWith(fontSize: 14)),
                      ),
                      SvgPicture.asset(
                        AppIcon.forwardIcon,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {
                  widget.onTap(1);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      color: AppColor.black),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcon.bookingIcon,
                        color: AppColor.white,
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Expanded(
                        child: Text(AppStrings.myBookings,
                            style: AppFonts.appText.copyWith(fontSize: 14)),
                      ),
                      SvgPicture.asset(
                        AppIcon.forwardIcon,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      color: AppColor.black),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcon.privacyPolicyIcon,
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Expanded(
                        child: Text(AppStrings.privacyPolicy,
                            style: AppFonts.appText.copyWith(fontSize: 14)),
                      ),
                      SvgPicture.asset(
                        AppIcon.forwardIcon,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TermsConditionScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      color: AppColor.black),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcon.termConditionIcon,
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Expanded(
                        child: Text(AppStrings.termConditions,
                            style: AppFonts.appText.copyWith(fontSize: 14)),
                      ),
                      SvgPicture.asset(
                        AppIcon.forwardIcon,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HelpScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      color: AppColor.black),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        //'assets/icon/cameraIcon.svg',
                        AppIcon.helpIcon,
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Expanded(
                        child: Text(AppStrings.help,
                            style: AppFonts.appText.copyWith(fontSize: 14)),
                      ),
                      SvgPicture.asset(
                        AppIcon.forwardIcon,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            17,
                          ),
                        ),
                        insetPadding: const EdgeInsets.symmetric(
                          horizontal: 18,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 38, vertical: 16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppIcon.logout),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                    textAlign: TextAlign.center,
                                    AppStrings.accountLogout,
                                    style: AppFonts.appText.copyWith(
                                      fontSize: 20,
                                      color: const Color(0xff181725),
                                    )),
                              ),
                              const SizedBox(
                                height: 52,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  EnterYourNo(),
                                            ),
                                            (route) => false);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 12),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              17,
                                            ),
                                          ),
                                          backgroundColor: AppColor.yellow),
                                      child: Text(AppStrings.yes,
                                          style: AppFonts.blackFont),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        Navigator.of(context).pop();

                                        /*  final connectivityResult =
                                            await (Connectivity()
                                                .checkConnectivity());
                                        setState(() {
                                          _connectionStatus = connectivityResult;
                                        });
                                        if (_connectionStatus ==
                                            ConnectivityResult.wifi) {
                                          if (context.mounted) {
                                            userLogout(context);
                                          }
                                        } else if (_connectionStatus ==
                                            ConnectivityResult.mobile) {
                                          if (context.mounted) {
                                            userLogout(context);
                                          }
                                        } else {
                                          if (context.mounted) {
                                            Utility.showNoNetworkDialog(
                                              context,
                                            );
                                          }
                                        }*/
                                        setState(() {});
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 12),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            17,
                                          ),
                                        ),
                                        backgroundColor: Color(
                                          0xffA4A4A4,
                                        ),
                                      ),
                                      child: Text(AppStrings.no,
                                          style: AppFonts.blackFont),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      color: AppColor.black),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcon.logoutIcon,
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Expanded(
                        child: Text(AppStrings.logout,
                            style: AppFonts.appText.copyWith(fontSize: 14)),
                      ),
                      SvgPicture.asset(
                        AppIcon.forwardIcon,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            17,
                          ),
                        ),
                        insetPadding: const EdgeInsets.symmetric(
                          horizontal: 18,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 38, vertical: 16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppIcon.logout),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  AppStrings.accountDelete,
                                  style: AppFonts.appText.copyWith(
                                    fontSize: 20,
                                    color: const Color(0xff181725),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 52,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  EnterYourNo(),
                                            ),
                                            (route) => false);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 12),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              17,
                                            ),
                                          ),
                                          backgroundColor: AppColor.yellow),
                                      child: Text(AppStrings.yes,
                                          style: AppFonts.blackFont),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        Navigator.of(context).pop();

                                        /*  final connectivityResult =
                                            await (Connectivity()
                                                .checkConnectivity());
                                        setState(() {
                                          _connectionStatus = connectivityResult;
                                        });
                                        if (_connectionStatus ==
                                            ConnectivityResult.wifi) {
                                          if (context.mounted) {
                                            userLogout(context);
                                          }
                                        } else if (_connectionStatus ==
                                            ConnectivityResult.mobile) {
                                          if (context.mounted) {
                                            userLogout(context);
                                          }
                                        } else {
                                          if (context.mounted) {
                                            Utility.showNoNetworkDialog(
                                              context,
                                            );
                                          }
                                        }*/
                                        setState(() {});
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 12),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            17,
                                          ),
                                        ),
                                        backgroundColor: Color(
                                          0xffA4A4A4,
                                        ),
                                      ),
                                      child: Text(AppStrings.no,
                                          style: AppFonts.blackFont),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      color: AppColor.black),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcon.deleteIcon,
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Expanded(
                        child: Text(AppStrings.deleteAccount,
                            style: AppFonts.appText.copyWith(fontSize: 14)),
                      ),
                      SvgPicture.asset(
                        AppIcon.forwardIcon,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
