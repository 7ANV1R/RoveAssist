import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';
import 'package:roveassist/app/modules/home_page/home_page_controller.dart';

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
          child: Container(
            //height: 140,
            width: (screenSize.width / 3) - 21.33,
            decoration: BoxDecoration(
              color:
                  index == controller.selectedIndex.value ? _themeData.primaryColorLight : Colors.grey[400],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  controller.iconData[index],
                  color: _themeData.cardColor,
                ),
                kVerticalSpaceM,
                Text(
                  controller.categoryList[index],
                  style: _textTheme.button!.copyWith(
                    color: _themeData.cardColor,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
