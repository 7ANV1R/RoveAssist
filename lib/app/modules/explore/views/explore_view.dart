import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/ui_helpers.dart';
import '../../../data/services/database_services.dart';
import '../controllers/explore_controller.dart';
import '../hotel/controllers/hotel_controller.dart';
import '../hotel/views/hotel_view.dart';
import '../place/controllers/place_controller.dart';
import '../place/views/place_view.dart';
import '../restaurant/controllers/restaurant_controller.dart';
import '../restaurant/views/restaurant_view.dart';

class ExploreView extends GetView<ExploreController> {
  @override
  Widget build(BuildContext context) {
    Get.put(DatabaseService());
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;

    var screenSize = MediaQuery.of(context).size;

    Get.put(
      RestaurantController(),
    );
    Get.put(
      PlaceController(),
    );
    Get.lazyPut<HotelController>(
      () => HotelController(),
    );
    return SafeArea(
      child: Scaffold(
          body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Explore The World',
                  style: _textTheme.headline1!
                      .copyWith(color: _themeData.secondaryHeaderColor, fontWeight: FontWeight.w900),
                ),
                kVerticalSpaceXS,
                Text(
                  'What\'s you are looking for?',
                  style: _textTheme.subtitle1!.copyWith(color: Colors.grey),
                ),
                kVerticalSpaceM,
                Obx(
                  () => controller.showingPlace
                      ? showPlace(screenSize, _themeData, _textTheme)
                      : controller.showingRestaurant
                          ? showRestaurant(screenSize, _themeData, _textTheme)
                          : showHotel(screenSize, _themeData, _textTheme),
                ),
              ],
            ),
          ),
          kVerticalSpaceM,
          Obx(
            () => controller.showingPlace
                ? PlaceView()
                : controller.showingRestaurant
                    ? RestaurantView()
                    : HotelView(),
          ),
        ],
      )),
    );
  }

  Widget showPlace(Size screenSize, ThemeData _themeData, TextTheme _textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: screenSize.height * 0.17,
          width: screenSize.width * 0.27,
          decoration: BoxDecoration(
            color: _themeData.primaryColorLight,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.place_outlined,
                color: _themeData.cardColor,
              ),
              kVerticalSpaceM,
              Text(
                'Place',
                style: _textTheme.button!.copyWith(
                  color: _themeData.cardColor,
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: controller.onTapRestaurant,
          child: Container(
            height: screenSize.height * 0.17,
            width: screenSize.width * 0.27,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.local_restaurant,
                  color: _themeData.cardColor,
                ),
                kVerticalSpaceM,
                Text(
                  'Restaurant',
                  style: _textTheme.button!.copyWith(
                    color: _themeData.cardColor,
                  ),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: controller.onTapHotel,
          child: Container(
            height: screenSize.height * 0.17,
            width: screenSize.width * 0.27,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home_work_outlined,
                  color: _themeData.cardColor,
                ),
                kVerticalSpaceM,
                Text(
                  'Hotel',
                  style: _textTheme.button!.copyWith(
                    color: _themeData.cardColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget showRestaurant(Size screenSize, ThemeData _themeData, TextTheme _textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: controller.onTapPlace,
          child: Container(
            height: screenSize.height * 0.17,
            width: screenSize.width * 0.27,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.place_outlined,
                  color: _themeData.cardColor,
                ),
                kVerticalSpaceM,
                Text(
                  'Place',
                  style: _textTheme.button!.copyWith(
                    color: _themeData.cardColor,
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          height: screenSize.height * 0.17,
          width: screenSize.width * 0.27,
          decoration: BoxDecoration(
            color: _themeData.primaryColorLight,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.local_restaurant,
                color: _themeData.cardColor,
              ),
              kVerticalSpaceM,
              Text(
                'Restaurant',
                style: _textTheme.button!.copyWith(
                  color: _themeData.cardColor,
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: controller.onTapHotel,
          child: Container(
            height: screenSize.height * 0.17,
            width: screenSize.width * 0.27,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home_work_outlined,
                  color: _themeData.cardColor,
                ),
                kVerticalSpaceM,
                Text(
                  'Hotel',
                  style: _textTheme.button!.copyWith(
                    color: _themeData.cardColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget showHotel(Size screenSize, ThemeData _themeData, TextTheme _textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: controller.onTapPlace,
          child: Container(
            height: screenSize.height * 0.17,
            width: screenSize.width * 0.27,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.place_outlined,
                  color: _themeData.cardColor,
                ),
                kVerticalSpaceM,
                Text(
                  'Place',
                  style: _textTheme.button!.copyWith(
                    color: _themeData.cardColor,
                  ),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: controller.onTapRestaurant,
          child: Container(
            height: screenSize.height * 0.17,
            width: screenSize.width * 0.27,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.local_restaurant,
                  color: _themeData.cardColor,
                ),
                kVerticalSpaceM,
                Text(
                  'Restaurant',
                  style: _textTheme.button!.copyWith(
                    color: _themeData.cardColor,
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          height: screenSize.height * 0.17,
          width: screenSize.width * 0.27,
          decoration: BoxDecoration(
            color: _themeData.primaryColorLight,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.home_work_outlined,
                color: _themeData.cardColor,
              ),
              kVerticalSpaceM,
              Text(
                'Hotel',
                style: _textTheme.button!.copyWith(
                  color: _themeData.cardColor,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
