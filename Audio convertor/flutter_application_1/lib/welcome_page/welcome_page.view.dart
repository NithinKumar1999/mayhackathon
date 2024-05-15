// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/colors.dart';
import 'package:flutter_application_1/components/strings.dart';
import 'package:flutter_application_1/components/typograpthy.dart';
import 'package:flutter_application_1/home_page/home_page.view.dart';
import 'package:flutter_application_1/welcome_page/welcome_page.controller.dart';
import 'package:get/get.dart';

class WelcomePageView extends GetResponsiveView<WelcomePageController> {
  WelcomePageView({super.key, this.hintText}) {
    Get.lazyPut(() => WelcomePageController());
  }
  String? hintText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: body(context));
  }

  body(context) {
    return Column(
      children: [
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.welcomeText,
                  style: AppTypograpthy.mediumTitleSize.copyWith(
                      color: const Color.fromARGB(255, 132, 130, 130)),
                ),
              ],
            ),
            Image.asset('assets/images/Speech to text-bro.png',
                height: MediaQuery.of(context).size.height * 0.65),
            const SizedBox(height: 20),
          ],
        )),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: InkWell(
                onTap: () {
                  Get.to(HomePageView());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Start',
                      style: AppTypograpthy.appNameTextStyle
                          .copyWith(color: AppColors.primaryOrange),
                    ),
                    const Icon(
                      Icons.arrow_right,
                      size: 40,
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
