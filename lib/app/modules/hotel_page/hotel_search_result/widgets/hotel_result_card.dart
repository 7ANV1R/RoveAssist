import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';
import 'package:roveassist/app/data/models/service_model/hotel_model.dart';
import 'package:roveassist/app/widgets/default_button.dart';

class HotelResultCard extends StatelessWidget {
  const HotelResultCard({Key? key, required this.hotel}) : super(key: key);
  final HotelModel hotel;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          // await Get.to(() => PackageTourDetails(packageTour: packageTourModel));
        },
        //onTap: () async => controller.onTapRestaurant(restaurant),
        borderRadius: BorderRadius.circular(8.0),
        child: Ink(
          decoration: BoxDecoration(
            color: _themeData.cardColor,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: _themeData.primaryColor.withOpacity(0.15),
                blurRadius: 15,
                offset: Offset(0, 2), //position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: hotel.coverImage == null
                      ? Container()
                      : CachedNetworkImage(
                          imageUrl: hotel.coverImage!,
                          fit: BoxFit.fill,
                        ),
                ),
                kVerticalSpaceS,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(hotel.title, style: _textTheme.headline5),
                          Text('KM Away', style: _textTheme.bodyText1),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RatingBar(
                                  ignoreGestures: true,
                                  allowHalfRating: true,
                                  itemSize: 14,
                                  initialRating: 3.5,
                                  ratingWidget: RatingWidget(
                                    full: Icon(
                                      Icons.star_rate_rounded,
                                      color: Colors.amber,
                                    ),
                                    half: Icon(
                                      Icons.star_half_rounded,
                                      color: Colors.amber,
                                    ),
                                    empty: Icon(
                                      Icons.star_border_rounded,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  onRatingUpdate: (rating) {}),
                              kHorizontalSpaceS,
                              Text('3.5', style: _textTheme.bodyText2),
                              Text('(1200 ratings)',
                                  style: _textTheme.bodyText2),
                            ],
                          )
                        ],
                      ),
                    ),
                    DefaultButton(
                      onTap: () async {
                        // await Get.to(() => PackageTourDetails(packageTour: packageTourModel));
                      },
                      color: _themeData.primaryColor,
                      padding: EdgeInsets.all(8.0),
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          kHorizontalSpaceM,
                          Text(
                            'View Details',
                            style: _textTheme.button!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
