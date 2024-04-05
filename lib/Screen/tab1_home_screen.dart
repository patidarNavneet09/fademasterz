import 'package:fademasterz/Screen/notification_screen.dart';
import 'package:fademasterz/Screen/shop_detail.dart';
import 'package:fademasterz/Utils/app_assets.dart';
import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/app_fonts.dart';
import 'package:fademasterz/Utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';

import '../Utils/bottam_sheet.dart';
import '../Utils/custom_app_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchCn = TextEditingController();
  void _showDialog() async {
    await showDialog(
      //   barrierDismissible: false,
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
            padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppIcon.locationDialogIcon),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Text(
                    textAlign: TextAlign.center,
                    AppStrings.enableLocation,
                    style: AppFonts.blackFont.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    textAlign: TextAlign.center,
                    AppStrings.locationNearest,
                    style: AppFonts.blackFont
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                MyAppButton(
                  onPress: () {
                    getLocation();
                    Navigator.of(context).pop();
                  },
                  height: 48,
                  title: AppStrings.enableLocation,
                  style:
                      AppFonts.blackFont.copyWith(fontWeight: FontWeight.w500),
                  radius: 39,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyAppButton(
                  onPress: () {
                    Navigator.of(context).pop();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const DashBoardScreen(),
                    //   ),
                    // );
                  },
                  height: 48,
                  title: AppStrings.cancel,
                  style:
                      AppFonts.blackFont.copyWith(fontWeight: FontWeight.w500),
                  radius: 39,
                  color: const Color(0xffFFFBF0),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  var latitude;
  var longitude;

  getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    longitude = position.longitude;

    // LatLng location = LatLng(lat, long);
    debugPrint('>>>>>>>>>>>>>>${latitude}<<<<<<<<<<<<<<');
    debugPrint('>>>>>>>>>>>>>>${longitude}<<<<<<<<<<<<<<');
    setState(() {
      //  _currentPosition = location;
    });
  }

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 10), () {
      _showDialog();
    });

    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        AppAssets.dummyImage,
                        height: 36,
                        width: 36,
                        fit: BoxFit.cover,
                      )

                      /*        userImage != null
                        ? CachedNetworkImage(
                      imageUrl: userImage.toString(),
                      height: 55,
                      width: 55,
                      fit: BoxFit.cover,
                      placeholder: (
                          context,
                          url,
                          ) =>
                          Container(
                            height: 32,
                            width: 30,
                            alignment: Alignment.center,
                            child:
                            const CircularProgressIndicator(
                                color: AppColor.primary),
                          ),
                      errorWidget: (context, url, error) =>
                          Container(
                            height: 32,
                            width: 30,
                            alignment: Alignment.center,
                            child:
                            const CircularProgressIndicator(
                                color: AppColor.primary),
                          ),
                    )
                        : null,*/
                      ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome, Ronald',
                          style: AppFonts.text
                              .copyWith(fontSize: 16, color: AppColor.yellow),
                        ),
                        const Text(AppStrings.helpToday,
                            style: AppFonts.normalText),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationScreen(),
                        ),
                      );
                    },
                    child: SvgPicture.asset(
                      AppIcon.notificationIcon,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 46,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: searchCn,
                        style: AppFonts.textFieldFont,
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        textAlignVertical: TextAlignVertical.bottom,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: AppStrings.search,
                          hintStyle: AppFonts.textFieldFont,
                          prefixIcon: Align(
                            heightFactor: 0.5,
                            widthFactor: 0.5,
                            child: SvgPicture.asset(
                              AppIcon.searchIcon,
                              height: 17,
                              width: 17,
                            ),
                          ),
                          filled: true,
                          fillColor: AppColor.black,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: CustomTextField(
                  //     controller: searchCn,
                  //     hintText: AppStrings.search,
                  //     textInputType: TextInputType.text,
                  //     textInputAction: TextInputAction.done,
                  //     hintTextStyle: AppFonts.textFieldFont,
                  //     radius: 5,
                  //     prefixIcon: Align(
                  //       heightFactor: 0.5,
                  //       widthFactor: 0.5,
                  //       child: SvgPicture.asset(
                  //         AppIcon.searchIcon,
                  //         height: 17,
                  //         width: 17,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      showModalBottomSheet(
                        isDismissible: false,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return const AppBottomSheet();
                        },
                      );
                      // return const AppBottomSheet();
                    },

                    //_modalBottomSheetMenu();

                    child: Container(
                      // height: 46,
                      // width: 48,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColor.black,
                      ),
                      child: SvgPicture.asset(AppIcon.filterIcon),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                '89 Shop avaliable',
                style: AppFonts.text.copyWith(
                  fontSize: 16,
                  color: AppColor.yellow,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  // physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  padding: EdgeInsets.only(top: 15),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ShopDetail(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColor.black,
                          borderRadius: BorderRadius.circular(
                            11,
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              AppAssets.homeImage,
                              height: 77,
                              width: 76,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    AppStrings.shopName,
                                    style:
                                        AppFonts.regular.copyWith(fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcon.ratingIcon,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '4.9',
                                        style: AppFonts.regular.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcon.locationIcon,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '1.5 Km Away',
                                            style: AppFonts.regular.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcon.locationIcon,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          'Sector 1, near shop, city center',
                                          style: AppFonts.regular.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: 10,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // int selectIndex = 0;
  // int selectIndex1 = 0;
  // double startYr = 0;
  // double endYr = 15;
  //
  // Future _modalBottomSheetMenu() async {
  //   return showModalBottomSheet(
  //       isDismissible: false,
  //       backgroundColor: Colors.transparent,
  //       context: context,
  //       builder: (builder) {
  //         return StatefulBuilder(
  //             builder: (BuildContext context, StateSetter setState) {
  //           return Container(
  //             //  height: 370,
  //             decoration: const BoxDecoration(
  //               color: AppColor.bg,
  //               borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(20),
  //                 topRight: Radius.circular(20),
  //               ),
  //             ),
  //             child: SingleChildScrollView(
  //               child: Padding(
  //                 padding:
  //                     const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Align(
  //                       alignment: Alignment.topRight,
  //                       child: SizedBox(
  //                         height: 21,
  //                         width: 21,
  //                         child: InkWell(
  //                           onTap: () {
  //                             Navigator.pop(context);
  //                           },
  //                           child: const Icon(
  //                             Icons.cancel,
  //                             size: 30,
  //                             color: AppColor.yellow,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     Center(
  //                       child: Text(
  //                         AppStrings.filter,
  //                         style: AppFonts.regular.copyWith(
  //                           fontSize: 18,
  //                         ),
  //                       ),
  //                     ),
  //                     const SizedBox(
  //                       height: 10,
  //                     ),
  //                     Divider(
  //                       height: 1,
  //                       color: AppColor.white.withOpacity(.10),
  //                     ),
  //                     const SizedBox(
  //                       height: 10,
  //                     ),
  //                     Text(
  //                       AppStrings.category,
  //                       style: AppFonts.regular.copyWith(
  //                         fontSize: 16,
  //                       ),
  //                     ),
  //                     const SizedBox(
  //                       height: 10,
  //                     ),
  //                     SizedBox(
  //                       height: 33,
  //                       child: ListView.separated(
  //                         shrinkWrap: true,
  //                         scrollDirection: Axis.horizontal,
  //                         itemCount: category.length,
  //                         itemBuilder: (BuildContext context, int index) {
  //                           return InkWell(
  //                             onTap: () => onTap(index),
  //                             //     {
  //                             //   // if (isSelectedIndex) {
  //                             //   //   selectedIndex.remove(index);
  //                             //   // } else {
  //                             //   //   selectedIndex.add(index);
  //                             //   //
  //                             //   // }
  //                             //   selectIndex = index;
  //                             //
  //                             //   setState(
  //                             //     () {},
  //                             //   );
  //                             // },
  //                             child: Container(
  //                               padding:
  //                                   const EdgeInsets.symmetric(horizontal: 16),
  //                               alignment: Alignment.center,
  //                               decoration: BoxDecoration(
  //                                 color: (category[index].isSelected ?? true)
  //                                     // selectIndex == index
  //                                     ? AppColor.yellow
  //                                     : Colors.transparent,
  //                                 border: Border.all(color: AppColor.yellow),
  //                                 borderRadius: BorderRadius.circular(19),
  //                               ),
  //                               //  margin: const EdgeInsets.all(5),
  //                               child: Text(category[index].category ?? '',
  //                                   style: (category[index].isSelected ?? true)
  //                                       // selectIndex == index
  //                                       ? AppFonts.text.copyWith(
  //                                           color: AppColor.black1,
  //                                           fontSize: 14)
  //                                       : AppFonts.yellowFont),
  //                             ),
  //                           );
  //                         },
  //                         separatorBuilder: (BuildContext context, int index) {
  //                           return const SizedBox(
  //                             width: 8,
  //                           );
  //                         },
  //                       ),
  //                     ),
  //                     const SizedBox(
  //                       height: 15,
  //                     ),
  //                     Text(
  //                       AppStrings.availability,
  //                       style: AppFonts.regular.copyWith(
  //                         fontSize: 16,
  //                       ),
  //                     ),
  //                     const SizedBox(
  //                       height: 15,
  //                     ),
  //                     SizedBox(
  //                       height: 33,
  //                       child: ListView.separated(
  //                         shrinkWrap: true,
  //                         scrollDirection: Axis.horizontal,
  //                         itemCount: available.length,
  //                         addSemanticIndexes: true,
  //                         // padding: const EdgeInsets.symmetric(
  //                         //   horizontal: 16,
  //                         // ),
  //                         itemBuilder: (BuildContext context, int index) {
  //                           return InkWell(
  //                             onTap: () {
  //                               selectIndex1 = index;
  //
  //                               setState(
  //                                 () {},
  //                               );
  //                             },
  //                             child: Container(
  //                               padding:
  //                                   const EdgeInsets.symmetric(horizontal: 16),
  //                               alignment: Alignment.center,
  //                               decoration: BoxDecoration(
  //                                 color: selectIndex1 == index
  //                                     ? AppColor.yellow
  //                                     : Colors.transparent,
  //                                 border: Border.all(color: AppColor.yellow),
  //                                 borderRadius: BorderRadius.circular(19),
  //                               ),
  //                               //  margin: const EdgeInsets.all(5),
  //                               child: Text(available[index],
  //                                   style: selectIndex1 == index
  //                                       ? AppFonts.text.copyWith(
  //                                           color: AppColor.black1,
  //                                         )
  //                                       : AppFonts.yellowFont),
  //                             ),
  //                           );
  //                         },
  //                         separatorBuilder: (BuildContext context, int index) {
  //                           return const SizedBox(
  //                             width: 8,
  //                           );
  //                         },
  //                       ),
  //                     ),
  //                     const SizedBox(
  //                       height: 15,
  //                     ),
  //                     Text(
  //                       AppStrings.experienceLevel,
  //                       style: AppFonts.regular.copyWith(
  //                         fontSize: 16,
  //                       ),
  //                     ),
  //                     SliderTheme(
  //                       data: const SliderThemeData(
  //                         thumbColor: AppColor.yellow,
  //                       ),
  //                       child: RangeSlider(
  //                         activeColor: AppColor.yellow,
  //                         inactiveColor: AppColor.black,
  //                         values: RangeValues(startYr, endYr),
  //                         labels:
  //                             RangeLabels(startYr.toString(), endYr.toString()),
  //                         onChanged: (value) {
  //                           setState(() {
  //                             startYr = value.start;
  //                             endYr = value.end;
  //                           });
  //                         },
  //                         min: 0.0,
  //                         max: startYr.toInt() < 15 ? 15 : endYr,
  //                       ),
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Text(
  //                           '${endYr} yr',
  //                           style: AppFonts.yellowFont.copyWith(fontSize: 13),
  //                         ),
  //                         Text(
  //                           AppStrings.all,
  //                           style: AppFonts.yellowFont.copyWith(fontSize: 13),
  //                         ),
  //                       ],
  //                     ),
  //                     const SizedBox(
  //                       height: 15,
  //                     ),
  //                     Divider(
  //                       height: 1,
  //                       color: AppColor.white.withOpacity(.10),
  //                     ),
  //                     const SizedBox(
  //                       height: 10,
  //                     ),
  //                     Row(
  //                       children: [
  //                         Expanded(
  //                           child: ElevatedButton(
  //                             onPressed: () {},
  //                             style: ElevatedButton.styleFrom(
  //                               padding:
  //                                   const EdgeInsets.symmetric(vertical: 14),
  //                               backgroundColor: Colors.transparent,
  //                               shape: RoundedRectangleBorder(
  //                                 side:
  //                                     const BorderSide(color: AppColor.yellow),
  //                                 borderRadius: BorderRadius.circular(
  //                                   20,
  //                                 ),
  //                               ),
  //                             ),
  //                             child: Text(AppStrings.reset,
  //                                 style: AppFonts.yellowFont
  //                                     .copyWith(fontSize: 16)),
  //                           ),
  //                         ),
  //                         const SizedBox(
  //                           width: 30,
  //                         ),
  //                         Expanded(
  //                           child: ElevatedButton(
  //                             onPressed: () {},
  //                             style: ElevatedButton.styleFrom(
  //                               padding:
  //                                   const EdgeInsets.symmetric(vertical: 14),
  //                               backgroundColor: AppColor.yellow,
  //                               shape: RoundedRectangleBorder(
  //                                 borderRadius: BorderRadius.circular(
  //                                   20,
  //                                 ),
  //                               ),
  //                             ),
  //                             child: Text(
  //                               AppStrings.applyFilter,
  //                               style: AppFonts.text.copyWith(
  //                                   color: AppColor.black1, fontSize: 16),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           );
  //         });
  //       });
  // }
  //
  // void onTap(int index) {
  //   category[index].isSelected = !(category[index].isSelected ?? false);
  //   setState(() {});
  //   //  selectIndex = !selectIndex;
  // }
}
