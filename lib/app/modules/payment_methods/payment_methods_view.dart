import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/ui_helpers.dart';
import '../../core/values/assets.dart';
import '../user_profile/widgets/profile_custom_tile.dart';
import 'payment_methods_controller.dart';

class PaymentMethodsView extends GetView<PaymentMethodsController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    return Scaffold(
        appBar: AppBar(
          // title: Text('C'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kVerticalSpaceL,
                  Text(
                    'CheckOut',
                    style: _textTheme.headline1!
                        .copyWith(color: _themeData.secondaryHeaderColor, fontWeight: FontWeight.w900),
                  ),
                  kVerticalSpaceXS,
                  Text(
                    'We accept the following payment methods.',
                    style: _textTheme.subtitle1!.copyWith(color: Colors.grey),
                  ),
                  kVerticalSpaceM,
                ],
              ),
            ),
            ProfileMenuTile(
              padding: EdgeInsets.all(8),
              onTap: controller.onTapPaymentMethod,
              icon: Row(
                children: [
                  Image.asset(
                    kAssetBkash,
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    color: Colors.grey[300],
                    height: 50,
                    width: 3,
                  )
                ],
              ),
              title: 'BKash',
              trailing: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Color(0xFFE1136E),
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            ProfileMenuTile(
              padding: EdgeInsets.all(8),
              onTap: controller.onTapPaymentMethod,
              icon: Row(
                children: [
                  Image.asset(
                    kAssetRocket,
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    color: Colors.grey[300],
                    height: 50,
                    width: 3,
                  )
                ],
              ),
              title: 'Rocket',
              trailing: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Color(0xFF8C3494),
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            ProfileMenuTile(
              padding: EdgeInsets.all(8),
              onTap: controller.onTapPaymentMethod,
              icon: Row(
                children: [
                  Image.asset(
                    kAssetNagad,
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    color: Colors.grey[300],
                    height: 50,
                    width: 3,
                  )
                ],
              ),
              title: 'Nagad',
              trailing: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Color(0xFFED1C24),
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            ProfileMenuTile(
              padding: EdgeInsets.all(8),
              onTap: controller.onTapPaymentMethod,
              icon: Row(
                children: [
                  Image.asset(
                    kAssetUpay,
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    color: Colors.grey[300],
                    height: 50,
                    width: 3,
                  )
                ],
              ),
              title: 'Upay',
              trailing: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Color(0xFF144A95),
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
