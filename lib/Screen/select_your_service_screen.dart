import 'package:fademasterz/Modal/category_service_modal.dart';
import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/app_fonts.dart';
import 'package:fademasterz/Utils/app_string.dart';
import 'package:fademasterz/Utils/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Utils/app_assets.dart';
import '../Utils/app_list.dart';
import 'choose_availability_barber.dart';

class SelectYourServices extends StatefulWidget {
  const SelectYourServices({super.key});

  @override
  State<SelectYourServices> createState() => _SelectYourServicesState();
}

class _SelectYourServicesState extends State<SelectYourServices> {
  int selectIndex = 0;
  int selectIndex1 = 0;
  int count = 00;

  int price = 40;
  bool isAdding = true;

  double totalPrice = 0;

  addPrice(double p) {
    debugPrint('>>>>>>addPrice>>>>>>>>${p}<<<<<<<<<<<<<<');
    setState(() {
      //  categoryServices1.add(item);
      totalPrice += p;
    });
  }

  removePrice(double price) {
    debugPrint('>>>>>removePrice>>>>>>>>>${price}<<<<<<<<<<<<<<');
    setState(() {
      //  categoryServices1.add(item);
      totalPrice -= price;
    });
  }

  void addRemove(CategoryService categoryService) {
    setState(() {
      if (categoryService.isAdding) {
        totalPrice += categoryService.price;
      } else {
        totalPrice -= categoryService.price;
      }
      categoryService.isAdding = !categoryService.isAdding;
    });
  }

  @override
  void initState() {
    // service = [
    //   Padding(
    //     padding: const EdgeInsets.symmetric(
    //       horizontal: 15,
    //     ),
    //     child: Container(
    //       padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(8), color: AppColor.black),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 AppStrings.haircut,
    //                 style: AppFonts.appText.copyWith(fontSize: 14),
    //               ),
    //               const Text(
    //                 'Approx Time 45 min',
    //                 style: AppFonts.normalText,
    //               ),
    //               const SizedBox(
    //                 height: 4,
    //               ),
    //               Text(
    //                 '\$${price}',
    //                 style: AppFonts.appText
    //                     .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
    //               ),
    //             ],
    //           ),
    //           InkWell(
    //             onTap: () {
    //               setState(() {
    //                 isButton = !isButton;
    //                 count = count + price;
    //               });
    //             },
    //             child: isButton == true
    //                 ? SvgPicture.asset(
    //                     AppIcon.addIcon,
    //                     height: 25,
    //                     width: 25,
    //                     fit: BoxFit.fill,
    //                   )
    //                 : SvgPicture.asset(
    //                     AppIcon.removeIcon,
    //                     height: 25,
    //                     width: 25,
    //                     fit: BoxFit.fill,
    //                   ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    //   Padding(
    //     padding: const EdgeInsets.symmetric(
    //       horizontal: 15,
    //     ),
    //     child: Container(
    //       padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(8), color: AppColor.black),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 AppStrings.haircut,
    //                 style: AppFonts.appText.copyWith(fontSize: 14),
    //               ),
    //               const Text(
    //                 'Approx Time 45 min',
    //                 style: AppFonts.normalText,
    //               ),
    //               const SizedBox(
    //                 height: 4,
    //               ),
    //               Text(
    //                 '\$40',
    //                 style: AppFonts.appText
    //                     .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
    //               ),
    //             ],
    //           ),
    //           GestureDetector(
    //             onTap: () {
    //               setState(() {
    //                 count = count - price;
    //               });
    //             },
    //             child: SvgPicture.asset(
    //               AppIcon.removeIcon,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    //   Padding(
    //     padding: const EdgeInsets.symmetric(
    //       horizontal: 15,
    //     ),
    //     child: Container(
    //       padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(8), color: AppColor.black),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 AppStrings.haircut,
    //                 style: AppFonts.appText.copyWith(fontSize: 14),
    //               ),
    //               const Text(
    //                 'Approx Time 45 min',
    //                 style: AppFonts.normalText,
    //               ),
    //               const SizedBox(
    //                 height: 4,
    //               ),
    //               Text(
    //                 '\$${price}',
    //                 style: AppFonts.appText
    //                     .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
    //               ),
    //             ],
    //           ),
    //           GestureDetector(
    //             onTap: () {
    //               setState(() {
    //                 count = count + price;
    //               });
    //             },
    //             child: SvgPicture.asset(
    //               AppIcon.addIcon,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    //   Padding(
    //     padding: const EdgeInsets.symmetric(
    //       horizontal: 15,
    //     ),
    //     child: Container(
    //       padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(8), color: AppColor.black),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 AppStrings.haircut,
    //                 style: AppFonts.appText.copyWith(fontSize: 14),
    //               ),
    //               const Text(
    //                 'Approx Time 45 min',
    //                 style: AppFonts.normalText,
    //               ),
    //               const SizedBox(
    //                 height: 4,
    //               ),
    //               Text(
    //                 '\$40',
    //                 style: AppFonts.appText
    //                     .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
    //               ),
    //             ],
    //           ),
    //           GestureDetector(
    //             onTap: () {
    //               setState(() {
    //                 count = count - price;
    //               });
    //             },
    //             child: SvgPicture.asset(
    //               AppIcon.removeIcon,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    //   Padding(
    //     padding: const EdgeInsets.symmetric(
    //       horizontal: 15,
    //     ),
    //     child: Container(
    //       padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(8), color: AppColor.black),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 AppStrings.haircut,
    //                 style: AppFonts.appText.copyWith(fontSize: 14),
    //               ),
    //               const Text(
    //                 'Approx Time 45 min',
    //                 style: AppFonts.normalText,
    //               ),
    //               const SizedBox(
    //                 height: 4,
    //               ),
    //               Text(
    //                 '\$${price}',
    //                 style: AppFonts.appText
    //                     .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
    //               ),
    //             ],
    //           ),
    //           GestureDetector(
    //             onTap: () {
    //               setState(() {
    //                 count = count + price;
    //               });
    //             },
    //             child: SvgPicture.asset(
    //               AppIcon.addIcon,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    //   Padding(
    //     padding: const EdgeInsets.symmetric(
    //       horizontal: 15,
    //     ),
    //     child: Container(
    //       padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(8), color: AppColor.black),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 AppStrings.haircut,
    //                 style: AppFonts.appText.copyWith(fontSize: 14),
    //               ),
    //               const Text(
    //                 'Approx Time 45 min',
    //                 style: AppFonts.normalText,
    //               ),
    //               const SizedBox(
    //                 height: 4,
    //               ),
    //               Text(
    //                 '\$40',
    //                 style: AppFonts.appText
    //                     .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
    //               ),
    //             ],
    //           ),
    //           GestureDetector(
    //             onTap: () {
    //               setState(() {
    //                 count = count - price;
    //               });
    //             },
    //             child: SvgPicture.asset(
    //               AppIcon.removeIcon,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    //   Padding(
    //     padding: const EdgeInsets.symmetric(
    //       horizontal: 15,
    //     ),
    //     child: Container(
    //       padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(8), color: AppColor.black),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 AppStrings.haircut,
    //                 style: AppFonts.appText.copyWith(fontSize: 14),
    //               ),
    //               const Text(
    //                 'Approx Time 45 min',
    //                 style: AppFonts.normalText,
    //               ),
    //               const SizedBox(
    //                 height: 4,
    //               ),
    //               Text(
    //                 '\$40',
    //                 style: AppFonts.appText
    //                     .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
    //               ),
    //             ],
    //           ),
    //           GestureDetector(
    //             onTap: () {
    //               setState(() {
    //                 count = count - price;
    //               });
    //             },
    //             child: SvgPicture.asset(
    //               AppIcon.removeIcon,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: MyAppBar.myAppbar(
        title: const Text(
          AppStrings.selectService,
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

            setState(() {});
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 33,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 15),
              itemCount: categoryServices.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    selectIndex = index;
                    setState(
                      () {},
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selectIndex == index
                          ? AppColor.yellow
                          : Colors.transparent,
                      border: Border.all(color: AppColor.yellow),
                      borderRadius: BorderRadius.circular(19),
                    ),
                    //  margin: const EdgeInsets.all(5),
                    child: Text(categoryServices[index],
                        style: selectIndex == index
                            ? AppFonts.text
                                .copyWith(color: AppColor.black1, fontSize: 14)
                            : AppFonts.yellowFont),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 8,
                );
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              itemCount: categoryServices1.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = categoryServices1[index];

                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.black),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            categoryServices1[index].name.toString(),
                            style: AppFonts.appText.copyWith(fontSize: 14),
                          ),
                          Text(
                            categoryServices1[index].time.toString(),
                            style: AppFonts.normalText,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            '\$${item.price.toStringAsFixed(0)}',
                            style: AppFonts.appText.copyWith(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            //   if (isButton = true) {
                            //     //   isButton = false;
                            //     selectIndex1 = index;
                            //     addPrice(item.price!.toDouble());
                            //   } else {
                            //     // isButton = true;
                            //     selectIndex1 = index;
                            //     removePrice(item.price!.toDouble());
                            //   }
                            addRemove(item);
                          });
                        },
                        child: item.isAdding
                            ? SvgPicture.asset(
                                AppIcon.addIcon,
                                height: 25,
                                width: 25,
                                fit: BoxFit.fill,
                              )
                            : SvgPicture.asset(
                                AppIcon.removeIcon,
                                height: 25,
                                width: 25,
                                fit: BoxFit.fill,
                              ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: 10,
              ),
            ),
          ),

          /*Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColor.black),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.haircut,
                        style: AppFonts.appText.copyWith(fontSize: 14),
                      ),
                      const Text(
                        'Approx Time 45 min',
                        style: AppFonts.normalText,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '\$${price}',
                        style: AppFonts.appText.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (isButton) {
                          isButton = !isButton;
                          count = count + price;
                        } else {
                          isButton = !isButton;
                          count = count - price;
                        }
                      });
                    },
                    child: isButton == true
                        ? SvgPicture.asset(
                            AppIcon.addIcon,
                            height: 25,
                            width: 25,
                            fit: BoxFit.fill,
                          )
                        : SvgPicture.asset(
                            AppIcon.removeIcon,
                            height: 25,
                            width: 25,
                            fit: BoxFit.fill,
                          ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColor.black),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.haircut,
                        style: AppFonts.appText.copyWith(fontSize: 14),
                      ),
                      const Text(
                        'Approx Time 45 min',
                        style: AppFonts.normalText,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '\$${price}',
                        style: AppFonts.appText.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (isButton) {
                          isButton = !isButton;
                          count = count + price;
                        } else {
                          isButton = !isButton;
                          count = count - price;
                        }
                      });
                    },
                    child: isButton == true
                        ? SvgPicture.asset(
                            AppIcon.addIcon,
                            height: 25,
                            width: 25,
                            fit: BoxFit.fill,
                          )
                        : SvgPicture.asset(
                            AppIcon.removeIcon,
                            height: 25,
                            width: 25,
                            fit: BoxFit.fill,
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColor.black),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.haircut,
                        style: AppFonts.appText.copyWith(fontSize: 14),
                      ),
                      const Text(
                        'Approx Time 45 min',
                        style: AppFonts.normalText,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '\$${price}',
                        style: AppFonts.appText.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (isButton) {
                          isButton = !isButton;
                          count = count + price;
                        } else {
                          isButton = !isButton;
                          count = count - price;
                        }
                      });
                    },
                    child: isButton == true
                        ? SvgPicture.asset(
                            AppIcon.addIcon,
                            height: 25,
                            width: 25,
                            fit: BoxFit.fill,
                          )
                        : SvgPicture.asset(
                            AppIcon.removeIcon,
                            height: 25,
                            width: 25,
                            fit: BoxFit.fill,
                          ),
                  ),
                ],
              ),
            ),
          ),*/
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
        child: ElevatedButton(
          onPressed: () {
            double price = totalPrice;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChooseAvailabilityBarber(price: price),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 16),
            backgroundColor: AppColor.yellow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Row(
            children: [
              Text(
                '\$${totalPrice.toStringAsFixed(0)}',
                style: AppFonts.blackFont,
              ),
              const Spacer(),
              Text(
                AppStrings.Continue,
                style: AppFonts.blackFont,
              ),
              const SizedBox(
                width: 7,
              ),
              SvgPicture.asset(AppIcon.forward1Icon)
            ],
          ),
        ),
      ),
    );
  }
}
