import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/ui_helpers.dart';
import '../controllers/saved_controller.dart';
import '../widgets/saved_hotel.dart';
import '../widgets/saved_place.dart';
import '../widgets/saved_restaurant.dart';

class SavedView extends GetView<SavedController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Saved',
                    style: _textTheme.headline1!
                        .copyWith(color: _themeData.secondaryHeaderColor, fontWeight: FontWeight.w900),
                  ),
                  kVerticalSpaceXS,
                  Text(
                    'Things you\'ve bookmarked',
                    style: _textTheme.subtitle1!.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
            _buildTabBar(_themeData, _textTheme),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar(ThemeData _themeData, TextTheme _textTheme) {
    return Flexible(
      child: Container(
        child: DefaultTabController(
          length: 3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
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
                  indicatorWeight: 4.0,
                  //indicatorSize: TabBarIndicatorSize.label,
                  labelColor: _themeData.primaryColor,
                  unselectedLabelColor: const Color(0xFF9A9A9A),
                  labelStyle: _textTheme.subtitle1,

                  tabs: const [
                    Tab(
                      text: "Place",
                    ),
                    Tab(
                      text: "Restaurant",
                    ),
                    Tab(
                      text: "Hotel",
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
                    SavedPlace(),
                    SavedRestaurant(),
                    SavedHotel(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
