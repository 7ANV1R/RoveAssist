import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';
import 'package:roveassist/app/modules/home_page/widgets/package_tour_card.dart';
import 'package:roveassist/app/modules/home_page/widgets/place_card.dart';
import 'package:roveassist/app/modules/search_results/search_results_controller.dart';

class Place extends GetView<SearchResultsController> {
  const Place({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      children: [
        Obx(() => controller.placeList.isNotEmpty
            ? ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: controller.placeList.length,
                itemBuilder: (context, index) => PlaceCard(place: controller.placeList[index]),
                separatorBuilder: (context, index) => kVerticalSpaceL,
              )
            : Container(
                child: Center(child: Text('No Result Found')),
              ))
      ],
    );
  }
}
