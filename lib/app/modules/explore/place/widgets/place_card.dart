import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roveassist/app/modules/explore/place/widgets/place_details.dart';

import '../../../../data/models/type_model/place_model.dart';
import '../../../../widgets/loader.dart';
import '../controllers/place_controller.dart';

class PlaceCard extends GetView<PlaceController> {
  PlaceCard({Key? key, required this.place}) : super(key: key);
  final PlaceDataModel place;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    var screenSize = MediaQuery.of(context).size;
    return OpenContainer(
      closedColor: _themeData.cardColor,
      openColor: _themeData.cardColor,
      closedElevation: 0,
      closedBuilder: (context, action) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                height: screenSize.height * 0.3,
                width: screenSize.width,
                imageUrl: place.photoUrl!,
                placeholder: (context, url) => Loader(),
                fit: BoxFit.fill,
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.name!,
                        style: _textTheme.headline6!.copyWith(color: _themeData.primaryColor),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: Colors.yellow[700],
                          ),
                          Text(
                            '4.3',
                            style: _textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ],
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
            )
          ],
        ),
      ),
      openBuilder: (context, action) => PlaceDetails(
        place: place,
      ),
    );
  }
}
