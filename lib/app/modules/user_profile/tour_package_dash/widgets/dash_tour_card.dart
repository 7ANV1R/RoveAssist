import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';
import 'package:roveassist/app/core/values/assets.dart';
import 'package:roveassist/app/data/models/service_model/package_tour_model.dart';

class DashTourPackCard extends StatelessWidget {
  const DashTourPackCard({Key? key, required this.packageTourModel}) : super(key: key);

  final PackageTourModel packageTourModel;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OpenContainer(
        closedElevation: 0.0,
        openElevation: 0.0,
        closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        closedColor: _themeData.cardColor,
        closedBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 90.0,
                height: 90.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: _themeData.primaryColor.withOpacity(0.15),
                      blurRadius: 15.0,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: packageTourModel.coverImage == null
                        ? Container()
                        : CachedNetworkImage(
                            imageUrl: packageTourModel.coverImage!,
                            fit: BoxFit.fill,
                          )),
              ),
              kHorizontalSpaceM,
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    packageTourModel.title,
                    style: _textTheme.headline6,
                  ),
                  // Row(
                  //   children: [
                  //     Icon(
                  //       Icons.location_on_outlined,
                  //       color: _themeData.primaryColor,
                  //       size: 12,
                  //     ),
                  //     kHorizontalSpaceS,
                  //   ],
                  // ),
                ],
              ))
            ],
          ),
        ),
        openBuilder: (context, index) => Container(),
      ),
    );
  }
}
