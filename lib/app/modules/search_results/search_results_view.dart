import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';
import 'package:roveassist/app/modules/home_page/widgets/package_tour_card.dart';
import 'package:roveassist/app/widgets/default_button.dart';

import 'search_results_controller.dart';

class SearchResultsView extends GetView<SearchResultsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SearchResultsView'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            TextField(
              controller: controller.queryController,
            ),
            DefaultButton(
              onTap: () {
                controller.fetchPackageTour(controller.queryController.text);
              },
              label: Text('Search'),
            ),
            Obx(() => ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.packageTourList.length,
                  itemBuilder: (context, index) =>
                      PackageTourCard(packageTourModel: controller.packageTourList[index]),
                  separatorBuilder: (context, index) => kVerticalSpaceL,
                ))
          ],
        ));
  }
}
