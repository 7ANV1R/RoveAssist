import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';
import 'package:roveassist/app/modules/hotel_page/hotel_search_result/hotel_search_result_controller.dart';
import 'package:roveassist/app/modules/hotel_page/hotel_search_result/widgets/hotel_result_card.dart';

class HotelSearchResultView extends GetView<HotelSearchResultController> {
  const HotelSearchResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              'Search Hotels',
              style: _textTheme.headline1!.copyWith(
                  color: _themeData.secondaryHeaderColor,
                  fontWeight: FontWeight.w900),
            ),
            kVerticalSpaceXS,
            Text(
              'Find deals on hotels',
              style: _textTheme.subtitle1!.copyWith(color: Colors.grey),
            ),
            kVerticalSpaceM,
            Obx(
              () => ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: controller.hotelResultList.length,
                itemBuilder: (context, index) =>
                    HotelResultCard(hotel: controller.hotelResultList[index]),
                separatorBuilder: (context, index) => kVerticalSpaceL,
              ),
            )
          ],
        ),
      ),
    );
  }
}
