import 'package:fademasterz/Utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Utils/app_assets.dart';
import '../Utils/app_fonts.dart';
import '../Utils/app_list.dart';
import '../Utils/app_string.dart';
import '../Utils/custom_app_bar.dart';

// class GalleryScreen extends StatefulWidget {
//   const GalleryScreen({super.key});
//
//   @override
//   State<GalleryScreen> createState() => _GalleryScreenState();
// }
//
// class _GalleryScreenState extends State<GalleryScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.bg,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Text(
//                   AppStrings.gallery,
//                   style: AppFonts.regular.copyWith(fontSize: 16),
//                 ),
//                 const Spacer(),
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => Gallery(),
//                       ),
//                     );
//                   },
//                   child: Text(
//                     AppStrings.seeAll,
//                     style: AppFonts.yellowFont,
//                   ),
//                 )
//               ],
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const Divider(
//               color: AppColor.dividerColor,
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             GridView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               padding: EdgeInsets.zero,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//               ),
//               shrinkWrap: true,
//               itemCount: galley.length < 9 ? galley.length : 9,
//               itemBuilder: (BuildContext context, int index) {
//                 return Container(
//                   clipBehavior: Clip.antiAlias,
//                   decoration:
//                       BoxDecoration(borderRadius: BorderRadius.circular(16)),
//                   child: Image.asset(
//                     galley[index],
//                     //     images[index],
//                     width: 103,
//                     height: 88,
//                     fit: BoxFit.fill,
//                   ),
//                 );
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: MyAppBar.myAppbar(
        title: const Text(
          AppStrings.gallery,
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
          child: Column(
            children: [
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                shrinkWrap: true,
                itemCount: galley.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    clipBehavior: Clip.antiAlias,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(16)),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              backgroundColor: Colors.transparent,
                              clipBehavior: Clip.antiAlias,
                              child: Stack(children: [
                                Image.asset(
                                  galley[index],
                                  //     images[index],

                                  //fit: BoxFit.fill,
                                ),
                                Positioned(
                                  right: 0,
                                  child: SizedBox(
                                    height: 21,
                                    width: 21,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child:
                                          SvgPicture.asset(AppIcon.cancelIcon),
                                    ),
                                  ),
                                )
                              ]),
                            );
                          },
                        );
                      },
                      child: Image.asset(
                        galley[index],
                        //     images[index],
                        width: 103,
                        height: 104,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
