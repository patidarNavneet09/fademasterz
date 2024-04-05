import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Utils/app_assets.dart';
import '../Utils/app_fonts.dart';
import '../Utils/app_list.dart';

class SpecialistScreen extends StatefulWidget {
  const SpecialistScreen({super.key});

  @override
  State<SpecialistScreen> createState() => _SpecialistScreenState();
}

class _SpecialistScreenState extends State<SpecialistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          AppStrings.specialists,
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
      body: GridView.builder(
        shrinkWrap: true,
        itemCount: images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              //  margin: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Image.asset(
                    images[index],
                    height: 60,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    name[index],
                    style: AppFonts.normalText.copyWith(fontSize: 14),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
