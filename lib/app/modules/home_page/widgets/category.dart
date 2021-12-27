import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/ui_helpers.dart';
import '../home_page_controller.dart';

class Category extends GetView<HomePageController> {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;

    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.18,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.categoryList.length,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 16),
                child: buildCategory(index, context, screenSize, _themeData, _textTheme),
              )),
    );
  }

  Widget buildCategory(
      int index, BuildContext context, Size screenSize, ThemeData _themeData, TextTheme _textTheme) {
    return Obx(() => GestureDetector(
          onTap: () {
            controller.selectedIndex.value = index;
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              alignment: Alignment.center,
              // fit: StackFit.expand,
              children: [
                Image.asset(
                  controller.bgData[index],
                  // fit: BoxFit.fill,
                  width: (screenSize.width / 3) - 21.33,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  // width: double.infinity,
                  alignment: Alignment.center,
                ),
                Container(
                  //height: 140,
                  width: (screenSize.width / 3) - 21.33,
                  decoration: BoxDecoration(
                    color: index == controller.selectedIndex.value
                        ? Colors.black.withOpacity(0.50)
                        : Colors.grey[350]!.withOpacity(0.80),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        controller.iconData[index],
                        color: index == controller.selectedIndex.value
                            ? _themeData.cardColor
                            : _themeData.secondaryHeaderColor,
                      ),
                      kVerticalSpaceM,
                      Text(
                        controller.categoryList[index],
                        style: _textTheme.button!.copyWith(
                          color: index == controller.selectedIndex.value
                              ? _themeData.cardColor
                              : _themeData.secondaryHeaderColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
