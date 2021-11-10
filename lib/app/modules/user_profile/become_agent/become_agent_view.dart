import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';
import 'package:roveassist/app/widgets/default_button.dart';
import 'package:roveassist/app/widgets/loader.dart';

import 'become_agent_controller.dart';

class BecomeAgentView extends GetView<BecomeAgentController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          // title: Text(
          //   'Affiliate',
          //   style: _textTheme.bodyText2!.copyWith(color: Colors.grey),
          // ),
          centerTitle: true,
          leading: BackButton(
            color: Colors.grey,
          ),
        ),
        body: Obx(() => controller.userInfo.isNotEmpty
            ? Obx(() => !controller.userInfo.first.isAgent && controller.userInfo.first.companyName != null
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.youtube_searched_for,
                          color: Colors.grey[200],
                          size: 130,
                        ),
                        kVerticalSpaceM,
                        Text(
                          'Pending!',
                          style: _textTheme.headline1!
                              .copyWith(color: _themeData.secondaryHeaderColor, fontWeight: FontWeight.w900),
                        ),
                        kVerticalSpaceXS,
                        Expanded(
                          child: Text(
                            'You have already submitted a form. Please wait. Sorry for the delay. We\'ll let you know by email. After email confirmation just restarts the application.',
                            style: _textTheme.bodyText1!.copyWith(color: Colors.grey),
                          ),
                        ),
                        DefaultButton(
                          onTap: () {
                            Get.back();
                          },
                          color: _themeData.primaryColor,
                          label: Text(
                            'Go Back',
                            style: _textTheme.button!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : agentForm(_textTheme, _themeData))
            : Loader()));
  }

  Widget agentForm(TextTheme _textTheme, ThemeData _themeData) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          Text(
            'Become an Agent',
            style: _textTheme.headline1!
                .copyWith(color: _themeData.secondaryHeaderColor, fontWeight: FontWeight.w900),
          ),
          kVerticalSpaceXS,
          Text(
            'Promote your business with us. Fill out all the information to register your business.',
            style: _textTheme.subtitle1!.copyWith(color: Colors.grey),
          ),
          kVerticalSpaceXL,
          Form(
              key: controller.agentFormKey,
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: [
                  TextFormField(
                    autofocus: true,
                    controller: controller.companyNameTextController,
                    decoration: InputDecoration(
                      isDense: true,
                      fillColor: Colors.white,
                      suffixIcon: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 20),
                        child: Icon(
                          Icons.business,
                        ),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Company Name',
                    ),

                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    //onFieldSubmitted: controller.onTapSearch,
                    validator: controller.companyNameValidator,
                  ),
                  kVerticalSpaceL,
                  TextFormField(
                    controller: controller.companyDetailsTextController,
                    decoration: InputDecoration(
                      isDense: true,
                      fillColor: Colors.white,
                      suffixIcon: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 20),
                        child: Icon(
                          Icons.view_headline,
                        ),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Company Details',
                    ),

                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    //onFieldSubmitted: controller.onTapSearch,
                    validator: controller.companyDetailsValidator,
                  ),
                  kVerticalSpaceL,
                  TextFormField(
                    controller: controller.phoneTextController,
                    decoration: InputDecoration(
                      isDense: true,
                      fillColor: Colors.white,
                      suffixIcon: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 20),
                        child: Icon(
                          Icons.phone,
                        ),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Phone',
                    ),

                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    //onFieldSubmitted: controller.onTapSearch,
                    validator: controller.companyPhoneValidator,
                  ),
                  kVerticalSpaceL,
                  // TextFormField(
                  //   obscureText: true,
                  //   controller: controller.accountsPasswordTextController,
                  //   decoration: InputDecoration(
                  //     isDense: true,
                  //     fillColor: Colors.white,
                  //     suffixIcon: Padding(
                  //       padding: const EdgeInsetsDirectional.only(end: 20),
                  //       child: Icon(
                  //         Icons.password,
                  //       ),
                  //     ),
                  //     border: OutlineInputBorder(),
                  //     labelText: 'Accounts Password',
                  //   ),

                  //   keyboardType: TextInputType.text,
                  //   textInputAction: TextInputAction.next,
                  //   //onFieldSubmitted: controller.onTapSearch,
                  //   validator: controller.passwordValidator,
                  // ),
                  kVerticalSpaceL,
                  DefaultButton(
                    onTap: () {
                      if (controller.agentFormKey.currentState!.validate()) {
                        controller.onAgentSubmission(
                          controller.companyNameTextController.text,
                          controller.companyDetailsTextController.text,
                          controller.phoneTextController.text,
                        );
                      }
                    },
                    height: 50,
                    color: _themeData.primaryColor,
                    label: Text(
                      'Submit',
                      style: _textTheme.button!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
