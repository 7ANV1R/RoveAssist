import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:roveassist/app/data/models/type_model/place_model.dart';
import 'package:roveassist/app/modules/explore/place/widgets/place_details.dart';
import 'package:roveassist/app/widgets/loader.dart';

import '../../../core/theme/ui_helpers.dart';
import '../../../core/values/assets.dart';

class CardOne extends StatelessWidget {
  CardOne({Key? key, required this.place}) : super(key: key);
  final PlaceDataModel place;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    var screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: _themeData.primaryColor.withOpacity(0.06),
              blurRadius: 20,
              offset: Offset(0, 8), //position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0), //clipping open containder for whole card border radius
          child: OpenContainer(
            closedColor: _themeData.cardColor,
            openColor: _themeData.cardColor,
            closedElevation: 0,
            closedBuilder: (context, action) => GestureDetector(
              onTap: () {
                action.call();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      children: [
                        Container(
                          height: screenSize.height * 0.25,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: _themeData.primaryColor.withOpacity(0.80),
                                blurRadius: 20,
                                offset: Offset(0, 8), //position of shadow
                              ),
                            ],
                          ),
                          child: CachedNetworkImage(
                            imageUrl: place.photoUrl!,
                            placeholder: (context, url) => Loader(),
                            fit: BoxFit.fill,
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              height: 30,
                              width: 30,
                              color: Colors.grey.withOpacity(0.25),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.bookmark,
                                  size: 15,
                                  color: _themeData.scaffoldBackgroundColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  kVerticalSpaceL,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        place.name!,
                        style: _textTheme.headline6!.copyWith(color: _themeData.primaryColor),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: Colors.yellow[700],
                            size: 18,
                          ),
                          Text(
                            '4.3',
                            style: _textTheme.bodyText1!.copyWith(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            openBuilder: (context, action) => PlaceDetails(
              place: place,
            ),
          ),
        ),
      ),
    );
  }
}
