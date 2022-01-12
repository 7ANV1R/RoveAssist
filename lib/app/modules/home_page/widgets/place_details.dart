import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';
import 'package:roveassist/app/data/models/service_model/package_tour_model.dart';
import 'package:roveassist/app/data/models/service_model/place_model.dart';
import 'package:roveassist/app/modules/home_page/home_page_controller.dart';
import 'package:roveassist/app/routes/app_pages.dart';
import 'package:roveassist/app/widgets/default_button.dart';
import 'package:roveassist/app/widgets/loader.dart';

class PlaceDetails extends GetView<HomePageController> {
  PlaceDetails({Key? key, required this.place}) : super(key: key);
  final PlaceModel place;

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
          place.coverImage != null
              ? Container(
                  height: screenSize.height * 0.5,
                  child: CachedNetworkImage(
                    height: screenSize.height * 0.3,
                    width: screenSize.width,
                    imageUrl: place.coverImage!,
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
                  place.title,
                  style: _textTheme.headline5,
                ),
                kVerticalSpaceL,
                Text(
                  'Details:',
                  style: _textTheme.subtitle1,
                ),
                kVerticalSpaceS,
                Text(
                  place.description,
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
