import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_fonts.dart';
import 'app_list.dart';
import 'app_string.dart';

class AppBottomSheet extends StatefulWidget {
  const AppBottomSheet({super.key});

  @override
  State<AppBottomSheet> createState() => _AppBottomSheetState();
}

class _AppBottomSheetState extends State<AppBottomSheet> {
  int selectIndex = 0;
  int selectIndex1 = 0;
  double startYr = 0;
  double endYr = 15;

  void onTap(int index) {
    if (index == 0) {
      for (var element in category) {
        element.isSelected = true;
      }
    } else {
      if (category.first.isSelected ?? false) {
        for (var element in category) {
          element.isSelected = false;
        }
      }

      category[index].isSelected = !(category[index].isSelected ?? false);

      int count = 0;
      for (var element in category) {
        if (element.isSelected ?? false) {
          count++;
        }
      }
      if (count == 0) {
        category[index].isSelected = !(category[index].isSelected ?? false);
      } else if (count == (category.length - 1)) {
        for (var element in category) {
          element.isSelected = true;
        }
      }
    }
    setState(() {
      debugPrint('>>>>>>>>>>>>>>${category[index].category}<<<<<<<<<<<<<<');
    });
  }

  @override
  void initState() {
    for (var element in category) {
      element.isSelected = true;
    }
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430,
      decoration: const BoxDecoration(
        color: AppColor.bg,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15, top: 10),
            child: Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                height: 21,
                width: 21,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.cancel,
                    size: 30,
                    color: AppColor.yellow,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              AppStrings.filter,
              style: AppFonts.regular.copyWith(
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
            child: Divider(
              height: 1,
              color: AppColor.white.withOpacity(.10),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Text(
              AppStrings.category,
              style: AppFonts.regular.copyWith(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 33,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: category.length,
              padding: EdgeInsets.only(left: 15, right: 15),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => onTap(index),
                  //     {
                  //   // if (isSelectedIndex) {
                  //   //   selectedIndex.remove(index);
                  //   // } else {
                  //   //   selectedIndex.add(index);
                  //   //
                  //   // }
                  //   selectIndex = index;
                  //
                  //   setState(
                  //     () {},
                  //   );
                  // },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: (category[index].isSelected ?? true)
                          // selectIndex == index
                          ? AppColor.yellow
                          : Colors.transparent,
                      border: Border.all(color: AppColor.yellow),
                      borderRadius: BorderRadius.circular(19),
                    ),
                    //  margin: const EdgeInsets.all(5),
                    child: Text(category[index].category ?? '',
                        style: (category[index].isSelected ?? true)

                            // selectIndex == index
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
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
            child: Text(
              AppStrings.availability,
              style: AppFonts.regular.copyWith(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 33,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: available.length,
              addSemanticIndexes: true,
              padding: const EdgeInsets.only(left: 15),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    selectIndex1 = index;

                    setState(
                      () {},
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selectIndex1 == index
                          ? AppColor.yellow
                          : Colors.transparent,
                      border: Border.all(color: AppColor.yellow),
                      borderRadius: BorderRadius.circular(19),
                    ),
                    //  margin: const EdgeInsets.all(5),
                    child: Text(available[index],
                        style: selectIndex1 == index
                            ? AppFonts.text.copyWith(
                                color: AppColor.black1,
                              )
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
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
            child: Text(
              AppStrings.experienceLevel,
              style: AppFonts.regular.copyWith(
                fontSize: 16,
              ),
            ),
          ),
          SliderTheme(
            data: const SliderThemeData(
              thumbColor: AppColor.yellow,
            ),
            child: RangeSlider(
              activeColor: AppColor.yellow,
              inactiveColor: AppColor.black,
              values: RangeValues(startYr, endYr),
              labels: RangeLabels(startYr.toString(), endYr.toString()),
              onChanged: (value) {
                setState(() {
                  startYr = value.start;
                  endYr = value.end;
                });
              },
              min: 0.0,
              max: startYr.toInt() < 15 ? 15 : endYr,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${endYr.toStringAsFixed(0)} yr',
                  style: AppFonts.yellowFont.copyWith(fontSize: 13),
                ),
                Text(
                  AppStrings.all,
                  style: AppFonts.yellowFont.copyWith(fontSize: 13),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
            child: Divider(
              height: 1,
              color: AppColor.white.withOpacity(.10),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: AppColor.yellow),
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                    ),
                    child: Text(AppStrings.reset,
                        style: AppFonts.yellowFont.copyWith(fontSize: 16)),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: AppColor.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                    ),
                    child: Text(
                      AppStrings.applyFilter,
                      style: AppFonts.text
                          .copyWith(color: AppColor.black1, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
