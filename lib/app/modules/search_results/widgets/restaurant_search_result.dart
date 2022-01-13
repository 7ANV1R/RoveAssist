import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';
import 'package:roveassist/app/modules/home_page/widgets/restaurant_card.dart';
import 'package:roveassist/app/modules/search_results/search_results_controller.dart';

class Restaurant extends GetView<SearchResultsController> {
  const Restaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          Obx(() => controller.restaurantResultList.isNotEmpty
              ? ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.restaurantResultList.length,
                  itemBuilder: (context, index) =>
                      RestaurantCard(restaurant: controller.restaurantResultList[index]),
                  separatorBuilder: (context, index) => kVerticalSpaceL,
                )
              : Container(
                  child: Center(child: Text('No Result Found')),
                ))
        ],
      ),
    );
  }
}
