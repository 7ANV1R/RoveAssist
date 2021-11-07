import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';

import 'tour_package_controller.dart';

class TourPackageView extends GetView<TourPackageController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tour Package',
                      style: _textTheme.headline1!
                          .copyWith(color: _themeData.secondaryHeaderColor, fontWeight: FontWeight.w900),
                    ),
                    kVerticalSpaceXS,
                    Text(
                      'Travel Safe with Package Tour',
                      style: _textTheme.subtitle1!.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.tune,
                      color: _themeData.primaryColor,
                    )),
              ],
            ),
            kVerticalSpaceM,
            StaggeredGridView.countBuilder(
                crossAxisCount: 3,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 20,
                staggeredTileBuilder: (index) =>
                    StaggeredTile.count((index % 7 == 0 ? 2 : 1), (index % 7 == 0 ? 2 : 1)),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                itemBuilder: (context, index) => Container(
                      height: 200,
                      color: Colors.grey,
                    )),
          ],
        ),
      )),
    );
  }
}
