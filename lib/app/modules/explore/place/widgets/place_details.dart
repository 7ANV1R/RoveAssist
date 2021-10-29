import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';
import 'package:roveassist/app/modules/explore/place/controllers/place_controller.dart';

import '../../../../data/models/type_model/place_model.dart';
import '../../../../widgets/loader.dart';

class PlaceDetails extends GetView<PlaceController> {
  PlaceDetails({Key? key, required this.place}) : super(key: key);
  final PlaceDataModel place;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: screenSize.height * 0.5,
                child: CachedNetworkImage(
                  height: screenSize.height * 0.3,
                  width: screenSize.width,
                  imageUrl: place.photoUrl!,
                  placeholder: (context, url) => Loader(),
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(
                height: 75,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Details',
                      style: _textTheme.headline6,
                    ),
                    kVerticalSpaceS,
                    Text(
                      place.details!,
                      style: _textTheme.bodyText1,
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: screenSize.height * 0.5 - 37.5,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      blurRadius: 20,
                      offset: Offset(0, 8), //position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          place.name!,
                          style: _textTheme.headline3!.copyWith(color: _themeData.primaryColor),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: Colors.yellow[700],
                              size: 18,
                            ),
                            Text(
                              '4.3 (148 ratings)',
                              style: _textTheme.bodyText2!.copyWith(color: _themeData.secondaryHeaderColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.grey,
                      height: 37.5,
                      width: 0.5,
                    ),
                    place.isSaved != null && place.isSaved == true
                        ? IconButton(
                            onPressed: () {
                              controller.onTapRemoveSaved(place.placeId!);
                            },
                            icon: Icon(
                              Icons.bookmark_remove,
                              color: _themeData.primaryColor,
                            ))
                        : IconButton(
                            onPressed: () {
                              controller.onTapAddSaved(place.placeId!);
                            },
                            icon: Icon(
                              Icons.bookmark_add_outlined,
                              color: Colors.grey,
                            ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
