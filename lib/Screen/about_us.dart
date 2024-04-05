import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: ReadMoreText(
                'Lorem ipsum dolor sit amet consectetur. Ac intum molestie at in eu donec velit. '
                'Commodo dolor malesuada quisque adipiscing est vestibulum nibh. ',
                trimMode: TrimMode.Line,
                trimLines: 3,
                trimLength: 200,
                style: AppFonts.normalText.copyWith(fontSize: 14),
                trimCollapsedText: 'Read more....',
                isExpandable: true,
                moreStyle: AppFonts.yellowFont,
                lessStyle: AppFonts.yellowFont,
                trimExpandedText: ' show less',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
