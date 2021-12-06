import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/ui_helpers.dart';
import '../../../widgets/default_button.dart';
import '../payment_methods_controller.dart';

class PaymentForm extends GetView<PaymentMethodsController> {
  const PaymentForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    return Scaffold(
      appBar: AppBar(
          // title: Text('Details'),
          ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Payment Details',
              style: _textTheme.headline1!
                  .copyWith(color: _themeData.secondaryHeaderColor, fontWeight: FontWeight.w900),
            ),
            kVerticalSpaceXS,
            Text(
              'Submit your information for book.',
              style: _textTheme.subtitle1!.copyWith(color: Colors.grey),
            ),
            kVerticalSpaceL,
            Form(
              key: controller.signUpFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.usernameTextController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.badge_outlined),
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  kVerticalSpaceM,
                  TextFormField(
                    controller: controller.emailTextController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      return controller.validateEmail(value!);
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  kVerticalSpaceM,
                  TextFormField(
                    controller: controller.phoneController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    // validator: (value) {
                    //   return controller.validateEmail(value!);
                    // },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.smartphone),
                      labelText: 'Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  kVerticalSpaceM,
                  TextFormField(
                    controller: controller.trxidController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.go,
                    // validator: (value) {
                    //   return controller.validateEmail(value!);
                    // },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.vpn_key),
                      labelText: 'TrxID',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            kVerticalSpaceM,
            DefaultButton(
              onTap: () {
                // controller.checkValid();
                if (!controller.checkValid()) {
                  if (controller.usernameTextController.text != "" &&
                      controller.emailTextController.text != "" &&
                      controller.phoneController.text != "") {
                    controller.onTapSignUp(
                      controller.usernameTextController.text,
                      controller.emailTextController.text,
                      controller.phoneController.text,
                    );
                  }
                }
              },
              label: Text(
                'BOOK',
                style: _textTheme.button!.copyWith(color: _themeData.scaffoldBackgroundColor),
              ),
              color: _themeData.primaryColor,
              //padding: EdgeInsets.symmetric(horizontal: 60.0),
            ),
          ],
        ),
      ),
    );
  }
}
