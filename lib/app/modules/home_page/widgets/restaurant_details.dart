import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/ui_helpers.dart';
import '../../../data/models/service_model/restaurant_model.dart';
import '../../../widgets/loader.dart';
import '../home_page_controller.dart';

class RestaurantDetails extends GetView<HomePageController> {
  RestaurantDetails({Key? key, required this.restaurant}) : super(key: key);
  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          restaurant.coverImage != null
              ? Container(
                  height: screenSize.height * 0.5,
                  child: CachedNetworkImage(
                    height: screenSize.height * 0.3,
                    width: screenSize.width,
                    imageUrl: restaurant.coverImage!,
                    placeholder: (context, url) => Loader(),
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                )
              : Container(
                  height: screenSize.height * 0.5,
                  color: Colors.grey,
                ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.title,
                  style: _textTheme.headline5,
                ),
                kVerticalSpaceL,
                Text(
                  'Details:',
                  style: _textTheme.subtitle1,
                ),
                kVerticalSpaceS,
                Text(
                  restaurant.description,
                  style: TextStyle(height: 1.5),
                ),
              ],
            ),
          ),
          kVerticalSpaceXXXL,
        ],
      ),
    );
  }
}
