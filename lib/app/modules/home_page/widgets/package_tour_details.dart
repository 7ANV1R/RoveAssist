import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';
import 'package:roveassist/app/data/models/service_model/package_tour_model.dart';
import 'package:roveassist/app/modules/home_page/home_page_controller.dart';
import 'package:roveassist/app/routes/app_pages.dart';
import 'package:roveassist/app/widgets/default_button.dart';
import 'package:roveassist/app/widgets/loader.dart';

class PackageTourDetails extends GetView<HomePageController> {
  PackageTourDetails({Key? key, required this.packageTour}) : super(key: key);
  final PackageTourModel packageTour;

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: DefaultButton(
          onTap: () {
            Get.defaultDialog(
                titlePadding: EdgeInsets.fromLTRB(0, 32, 0, 32),
                contentPadding: EdgeInsets.fromLTRB(32, 0, 32, 32),
                title: 'Select a booking option',
                titleStyle: _textTheme.headline5,
                middleText: 'Pay online hassle-free with various payment methods. You can also pay on site.',
                radius: 8,
                actions: [
                  kVerticalSpaceM,
                  DefaultButton(
                    onTap: () async {
                      Get.toNamed(Routes.PAYMENT_METHODS, preventDuplicates: false);
                    },
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      // border: Border.all(color: _themeData.primaryColor),
                      color: _themeData.primaryColor,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    label: Text(
                      'Book Now with Payment',
                      style: _textTheme.button!.copyWith(color: _themeData.cardColor),
                    ),
                  ),
                  DefaultButton(
                    onTap: () async {
                      Get.back();
                    },
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      border: Border.all(color: _themeData.primaryColor),
                      // color: _themeData.primaryColor,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    label: Text(
                      'Book Without Payment',
                      style: _textTheme.button!.copyWith(color: _themeData.primaryColor),
                    ),
                  ),
                ]);
          },
          color: _themeData.primaryColor,
          // padding: EdgeInsets.all(8.0),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Get Your Ticket',
                style: _textTheme.button!.copyWith(
                  color: Colors.white,
                ),
              ),
              kHorizontalSpaceS,
              Icon(
                Icons.confirmation_number_outlined,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          packageTour.coverImage != null
              ? Container(
                  height: screenSize.height * 0.5,
                  child: CachedNetworkImage(
                    height: screenSize.height * 0.3,
                    width: screenSize.width,
                    imageUrl: packageTour.coverImage!,
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
                  packageTour.title,
                  style: _textTheme.headline5,
                ),
                kVerticalSpaceL,
                Text(
                  'Details:',
                  style: _textTheme.subtitle1,
                ),
                kVerticalSpaceS,
                Text(
                  packageTour.description,
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
