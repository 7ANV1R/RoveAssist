import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core/theme/ui_helpers.dart';
import '../../../core/values/assets.dart';

class CardOne extends StatelessWidget {
  const CardOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    var screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: _themeData.primaryColor.withOpacity(0.15),
              blurRadius: 15,
              offset: Offset(0, 2), //position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0), //clipping open containder for whole card border radius
          child: OpenContainer(
            closedColor: _themeData.cardColor,
            openColor: _themeData.cardColor,
            closedElevation: 0,
            closedBuilder: (context, action) => GestureDetector(
              onTap: () {
                action.call();
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        kAssetCover1,
                        fit: BoxFit.cover,
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
                              Text(
                                "Cox's Bazar",
                                style: _textTheme.headline6!.copyWith(color: _themeData.primaryColor),
                              ),
                              kVerticalSpaceS,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RatingBar(
                                      ignoreGestures: true,
                                      allowHalfRating: true,
                                      itemSize: 14,
                                      initialRating: 4,
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
                                  Text(4.0.toString(), style: _textTheme.bodyText2),
                                  Text('(1200 ratings)', style: _textTheme.bodyText2),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            openBuilder: (context, action) => Container(),
          ),
        ),
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.only(right: 16, top: 16, bottom: 16), //padding of card in scaffold
    //   child: Container(
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.all(Radius.circular(8)),
    //       color: Colors.white,
    //       boxShadow: [
    //         BoxShadow(
    //           color: _themeData.primaryColor.withOpacity(0.15),

    //           blurRadius: 15,
    //           offset: Offset(0, 2), //position of shadow
    //         ),
    //       ],
    //     ),
    //     child: ClipRRect(
    //       borderRadius: BorderRadius.circular(8.0), //clipping open containder for whole card border radius
    //       child: OpenContainer(
    //         closedColor: _themeData.cardColor,
    //         openColor: _themeData.cardColor,
    //         closedElevation: 0,
    //         closedBuilder: (context, action) => ListView(
    //           //padding: EdgeInsets.all(10), //padding of card data
    //           shrinkWrap: true,
    //           physics: NeverScrollableScrollPhysics(),
    //           children: [
    //             ClipRRect(
    //                 borderRadius: BorderRadius.circular(8.0),
    //                 child: Image.asset(
    //                   kAssetCover1,
    //                   fit: BoxFit.fitWidth,
    //                 )),
    //             kVerticalSpaceS,
    //             Row(
    //               crossAxisAlignment: CrossAxisAlignment.end,
    //               children: [
    //                 Expanded(
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Text('Location Name', style: _textTheme.headline5),

    //                       // Row(
    //                       //   crossAxisAlignment: CrossAxisAlignment.start,
    //                       //   children: [
    //                       //     RatingBar(
    //                       //         ignoreGestures: true,
    //                       //         allowHalfRating: true,
    //                       //         itemSize: 14,
    //                       //         initialRating: flight.rating,
    //                       //         ratingWidget: RatingWidget(
    //                       //           full: Icon(
    //                       //             Icons.star_rate_rounded,
    //                       //             color: Colors.amber,
    //                       //           ),
    //                       //           half: Icon(
    //                       //             Icons.star_half_rounded,
    //                       //             color: Colors.amber,
    //                       //           ),
    //                       //           empty: Icon(
    //                       //             Icons.star_border_rounded,
    //                       //             color: Colors.amber,
    //                       //           ),
    //                       //         ),
    //                       //         onRatingUpdate: (rating) {}),
    //                       //     kHorizontalSpaceS,

    //                       //   ],
    //                       // )
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             )
    //           ],
    //         ),
    //         openBuilder: (context, action) => Container(),
    //       ),
    //     ),
    //   ),
    // );
  }
}
