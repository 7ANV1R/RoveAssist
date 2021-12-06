import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';
import 'package:roveassist/app/modules/home_page/widgets/category.dart';
import 'package:roveassist/app/modules/home_page/widgets/package_tour_card.dart';
import 'package:roveassist/app/modules/home_page/widgets/place_card.dart';
import 'package:roveassist/app/modules/home_page/widgets/restaurant_card.dart';
import 'package:roveassist/app/modules/hotel_page/hotel_search_result/widgets/hotel_result_card.dart';

import 'home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;

    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: _themeData.primaryColor.withOpacity(0.15),
                        blurRadius: 30,
                        offset: Offset(0, 5), //position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.start,
                    //controller: controller.searchController,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      contentPadding: EdgeInsets.all(16.0),
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.menu_open_outlined),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                kVerticalSpaceL,
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
              ],
            ),
            Category(),
            kVerticalSpaceL,
            Obx(() => controller.selectedIndex.value == 0
                ?
                //tour package
                ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: controller.packageTourList.length,
                    itemBuilder: (context, index) =>
                        PackageTourCard(packageTourModel: controller.packageTourList[index]),
                    separatorBuilder: (context, index) => kVerticalSpaceL,
                  )
                : controller.selectedIndex.value == 1
                    ?
                    // restaurant
                    ListView.separated(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.restaurantList.length,
                        itemBuilder: (context, index) =>
                            RestaurantCard(restaurant: controller.restaurantList[index]),
                        separatorBuilder: (context, index) => kVerticalSpaceL,
                      )
                    : controller.selectedIndex.value == 2
                        ?
                        //place
                        ListView.separated(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.placeList.length,
                            itemBuilder: (context, index) => PlaceCard(place: controller.placeList[index]),
                            separatorBuilder: (context, index) => kVerticalSpaceL,
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.hotelResultList.length,
                            itemBuilder: (context, index) =>
                                HotelResultCard(hotel: controller.hotelResultList[index]),
                            separatorBuilder: (context, index) => kVerticalSpaceL,
                          ))
          ],
        ),
      ),
    );
  }
}
