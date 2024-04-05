import 'dart:io';

import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/app_fonts.dart';
import 'package:fademasterz/Utils/app_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../Utils/app_assets.dart';
import '../Utils/custom_app_bar.dart';
import '../Utils/custom_app_button.dart';
import '../Utils/custom_textfield.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController phoneCn = TextEditingController();
  TextEditingController nameCn = TextEditingController();
  TextEditingController gmailCn = TextEditingController();
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
          AppStrings.editProfile,
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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: _imageFile == null
                        ? Image.asset(
                            AppAssets.dummyImage,
                            height: 103,
                            width: 103,
                            fit: BoxFit.fill,
                          )
                        : Image.file(
                            _imageFile ?? File('path'),
                            height: 103,
                            width: 103,
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
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: nameCn,
              hintText: AppStrings.name,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              hintTextStyle: AppFonts.textFieldFont,
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
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              controller: gmailCn,
              hintText: AppStrings.email,
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              hintTextStyle: AppFonts.textFieldFont,
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
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              controller: phoneCn,
              hintText: AppStrings.mobileNo,
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.done,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(
                    r'^\d+?\d*',
                  ),
                ),
              ],
              maxLength: 11,
              hintTextStyle: AppFonts.textFieldFont,
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
        title: AppStrings.update,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        onPress: () {
          // Navigator.pushAndRemoveUntil(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const DashBoardScreen(),
          //   ),
          //       (Route<dynamic> route) => false,
          // );
        },
      ),
    );
  }
}
