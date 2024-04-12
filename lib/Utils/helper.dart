// class Helper {
//   int selectIndex = 0;
//   int selectIndex1 = 0;
//   double startYr = 0;
//   double endYr = 15;
//
//   void _modalBottomSheetMenu() async {
//     return showModalBottomSheet(
//         isDismissible: false,
//         backgroundColor: Colors.transparent,
//         context: context,
//         builder: (builder) {
//           return StatefulBuilder(
//               builder: (BuildContext context, StateSetter setState) {
//                 return Container(
//                   //  height: 370,
//                   decoration: const BoxDecoration(
//                     color: AppColor.bg,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20),
//                     ),
//                   ),
//                   child: SingleChildScrollView(
//                     child: Padding(
//                       padding:
//                       const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Align(
//                             alignment: Alignment.topRight,
//                             child: SizedBox(
//                               height: 21,
//                               width: 21,
//                               child: InkWell(
//                                 onTap: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: const Icon(
//                                   Icons.cancel,
//                                   size: 30,
//                                   color: AppColor.yellow,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Center(
//                             child: Text(
//                               AppStrings.filter,
//                               style: AppFonts.regular.copyWith(
//                                 fontSize: 18,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Divider(
//                             height: 1,
//                             color: AppColor.white.withOpacity(.10),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             AppStrings.category,
//                             style: AppFonts.regular.copyWith(
//                               fontSize: 16,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           SizedBox(
//                             height: 33,
//                             child: ListView.separated(
//                               shrinkWrap: true,
//                               scrollDirection: Axis.horizontal,
//                               itemCount: category.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return InkWell(
//                                   onTap: () => onTap(index),
//                                   //     {
//                                   //   // if (isSelectedIndex) {
//                                   //   //   selectedIndex.remove(index);
//                                   //   // } else {
//                                   //   //   selectedIndex.add(index);
//                                   //   //
//                                   //   // }
//                                   //   selectIndex = index;
//                                   //
//                                   //   setState(
//                                   //     () {},
//                                   //   );
//                                   // },
//                                   child: Container(
//                                     padding:
//                                     const EdgeInsets.symmetric(horizontal: 16),
//                                     alignment: Alignment.center,
//                                     decoration: BoxDecoration(
//                                       color: (category[index].isSelected ?? true)
//                                       // selectIndex == index
//                                           ? AppColor.yellow
//                                           : Colors.transparent,
//                                       border: Border.all(color: AppColor.yellow),
//                                       borderRadius: BorderRadius.circular(19),
//                                     ),
//                                     //  margin: const EdgeInsets.all(5),
//                                     child: Text(category[index].category ?? '',
//                                         style: (category[index].isSelected ?? true)
//                                         // selectIndex == index
//                                             ? AppFonts.text.copyWith(
//                                             color: AppColor.black1,
//                                             fontSize: 14)
//                                             : AppFonts.yellowFont),
//                                   ),
//                                 );
//                               },
//                               separatorBuilder: (BuildContext context, int index) {
//                                 return const SizedBox(
//                                   width: 8,
//                                 );
//                               },
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           Text(
//                             AppStrings.availability,
//                             style: AppFonts.regular.copyWith(
//                               fontSize: 16,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           SizedBox(
//                             height: 33,
//                             child: ListView.separated(
//                               shrinkWrap: true,
//                               scrollDirection: Axis.horizontal,
//                               itemCount: available.length,
//                               addSemanticIndexes: true,
//                               // padding: const EdgeInsets.symmetric(
//                               //   horizontal: 16,
//                               // ),
//                               itemBuilder: (BuildContext context, int index) {
//                                 return InkWell(
//                                   onTap: () {
//                                     selectIndex1 = index;
//
//                                     setState(
//                                           () {},
//                                     );
//                                   },
//                                   child: Container(
//                                     padding:
//                                     const EdgeInsets.symmetric(horizontal: 16),
//                                     alignment: Alignment.center,
//                                     decoration: BoxDecoration(
//                                       color: selectIndex1 == index
//                                           ? AppColor.yellow
//                                           : Colors.transparent,
//                                       border: Border.all(color: AppColor.yellow),
//                                       borderRadius: BorderRadius.circular(19),
//                                     ),
//                                     //  margin: const EdgeInsets.all(5),
//                                     child: Text(available[index],
//                                         style: selectIndex1 == index
//                                             ? AppFonts.text.copyWith(
//                                           color: AppColor.black1,
//                                         )
//                                             : AppFonts.yellowFont),
//                                   ),
//                                 );
//                               },
//                               separatorBuilder: (BuildContext context, int index) {
//                                 return const SizedBox(
//                                   width: 8,
//                                 );
//                               },
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           Text(
//                             AppStrings.experienceLevel,
//                             style: AppFonts.regular.copyWith(
//                               fontSize: 16,
//                             ),
//                           ),
//                           SliderTheme(
//                             data: const SliderThemeData(
//                               thumbColor: AppColor.yellow,
//                             ),
//                             child: RangeSlider(
//                               activeColor: AppColor.yellow,
//                               inactiveColor: AppColor.black,
//                               values: RangeValues(startYr, endYr),
//                               labels:
//                               RangeLabels(startYr.toString(), endYr.toString()),
//                               onChanged: (value) {
//                                 setState(() {
//                                   startYr = value.start;
//                                   endYr = value.end;
//                                 });
//                               },
//                               min: 0.0,
//                               max: startYr.toInt() < 15 ? 15 : endYr,
//                             ),
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 '${endYr} yr',
//                                 style: AppFonts.yellowFont.copyWith(fontSize: 13),
//                               ),
//                               Text(
//                                 AppStrings.all,
//                                 style: AppFonts.yellowFont.copyWith(fontSize: 13),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           Divider(
//                             height: 1,
//                             color: AppColor.white.withOpacity(.10),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     padding:
//                                     const EdgeInsets.symmetric(vertical: 14),
//                                     backgroundColor: Colors.transparent,
//                                     shape: RoundedRectangleBorder(
//                                       side:
//                                       const BorderSide(color: AppColor.yellow),
//                                       borderRadius: BorderRadius.circular(
//                                         20,
//                                       ),
//                                     ),
//                                   ),
//                                   child: Text(AppStrings.reset,
//                                       style: AppFonts.yellowFont
//                                           .copyWith(fontSize: 16)),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 width: 30,
//                               ),
//                               Expanded(
//                                 child: ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     padding:
//                                     const EdgeInsets.symmetric(vertical: 14),
//                                     backgroundColor: AppColor.yellow,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(
//                                         20,
//                                       ),
//                                     ),
//                                   ),
//                                   child: Text(
//                                     AppStrings.applyFilter,
//                                     style: AppFonts.text.copyWith(
//                                         color: AppColor.black1, fontSize: 16),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               });
//         });
//   }
//
//   void onTap(int index) {
//     category[index].isSelected = !(category[index].isSelected ?? false);
//     setState(() {});
//     //  selectIndex = !selectIndex;
//   }
// }
import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';

import 'app_color.dart';

class Helper {
  void showToast(String msg,
      {Toast? toastLength,
      ToastGravity? gravity,
      int? timeInSecForIosWeb,
      Color? backgroundColor,
      String? textColor,
      double? fontSize}) {
    Fluttertoast.showToast(
      backgroundColor: AppColor.yellow,
      msg: msg,
      toastLength: toastLength ?? Toast.LENGTH_SHORT,
      gravity: gravity ?? ToastGravity.BOTTOM,
      timeInSecForIosWeb: timeInSecForIosWeb ?? 1,
      fontSize: fontSize ?? 16.0,
      textColor: AppColor.black,
    );
  }
}
