import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';
import 'package:roveassist/app/widgets/default_button.dart';

import 'hotel_page_controller.dart';

class HotelPageView extends GetView<HotelPageController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: _themeData.primaryColor.withOpacity(0.25),
                blurRadius: 15,
                offset: Offset(0, 2), //position of shadow
              ),
            ],
          ),
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(36),
          child: Form(
            key: controller.globalFormKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                Text(
                  'Search Hotels',
                  style: _textTheme.headline1!
                      .copyWith(color: _themeData.secondaryHeaderColor, fontWeight: FontWeight.w900),
                ),
                kVerticalSpaceXS,
                Text(
                  'Find deals on hotels',
                  style: _textTheme.subtitle1!.copyWith(color: Colors.grey),
                ),
                kVerticalSpaceL,
                TextFormField(
                  controller: controller.destinationTextController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    suffixIcon: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 20),
                      child: Icon(
                        Icons.search_outlined,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'City',
                  ),

                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  //onFieldSubmitted: controller.onTapSearch,
                  //validator: controller.searchValidator,
                ),
                kVerticalSpaceL,
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    suffixIcon: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 20),
                      child: Icon(
                        Icons.date_range,
                      ),
                    ),
                    labelText: 'Check-in',
                    border: OutlineInputBorder(),
                  ),
                  controller: controller.checkInDateController,
                  readOnly: true,
                  onTap: () async {
                    final DateTime? datetime = await showDatePicker(
                      context: context,
                      initialDate: DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day + 1,
                      ),
                      firstDate: DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                      ),
                      lastDate: DateTime(
                        DateTime.now().year,
                        DateTime.now().month + 1,
                        DateTime.now().day,
                      ),
                    );

                    if (datetime != null) controller.formatAndSetCheckInDate(datetime);
                  },
                ),
                kVerticalSpaceL,
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    suffixIcon: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 20),
                      child: Icon(
                        Icons.date_range,
                      ),
                    ),
                    labelText: 'Check-out',
                    border: OutlineInputBorder(),
                  ),
                  controller: controller.checkOutDateController,
                  readOnly: true,
                  onTap: () async {
                    final DateTime? datetime = await showDatePicker(
                      context: context,
                      initialDate: DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day + 2,
                      ),
                      firstDate: DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day + 1,
                      ),
                      lastDate: DateTime(
                        DateTime.now().year,
                        DateTime.now().month + 2,
                        DateTime.now().day,
                      ),
                    );

                    if (datetime != null) controller.formatAndSetCheckOutDate(datetime);
                  },
                ),
                kVerticalSpaceL,
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    suffixIcon: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 20),
                      child: Icon(
                        Icons.person,
                      ),
                    ),
                    labelText: 'Number of guests',
                    labelStyle: TextStyle(),
                    border: OutlineInputBorder(),
                  ),
                  controller: controller.adultsCountTextController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  //onFieldSubmitted: controller.onTapSearch,
                  //validator: controller.searchValidator,
                ),
                kVerticalSpaceL,
                DefaultButton(
                  onTap: () {},
                  color: _themeData.primaryColor,
                  label: Text(
                    'Search Hotels',
                    style: _textTheme.button!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                kVerticalSpaceL,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
