import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/ui_helpers.dart';
import 'search_results_controller.dart';
import 'widgets/package_tour_search_result.dart';
import 'widgets/place_search_result.dart';
import 'widgets/restaurant_search_result.dart';

class SearchResultsView extends GetView<SearchResultsController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;

    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Container(
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
              readOnly: false,
              // onSaved: () {},
              controller: controller.queryController,
              // onFieldSubmitted: controller.searchPackageTour(controller.searchController.text),
              onChanged: (text) {
                controller.fetchPackageTour(controller.queryController.text);
              },

              textAlign: TextAlign.start,
              //controller: controller.searchController,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'Search...',
                contentPadding: EdgeInsets.all(16.0),
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
              ),
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  controller.fetchPackageTour(controller.queryController.text);
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                constraints: BoxConstraints.expand(height: 60),
                child: TabBar(
                  //isScrollable: true,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ), // Creates border
                    color: _themeData.primaryColor,
                  ),
                  indicatorPadding: EdgeInsets.only(top: 56),
                  indicatorWeight: 3.0,
                  //indicatorSize: TabBarIndicatorSize.label,
                  labelColor: _themeData.primaryColor,
                  unselectedLabelColor: const Color(0xFF9A9A9A),
                  // labelStyle: _textTheme.bodyText1,

                  tabs: const [
                    Tab(
                      text: "Tour Package",
                    ),
                    Tab(
                      text: "Restaurant",
                    ),
                    Tab(
                      text: "Place",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: SizedBox(
                  height: 0.6,
                  child: Container(
                    color: const Color(0xFFE6E6E6),
                  ),
                ),
              ),
              kVerticalSpaceM,
              Expanded(
                child: TabBarView(
                  children: const [
                    PackageTour(),
                    Restaurant(),
                    Place(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
