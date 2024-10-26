import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ttt/components/custom_image_handler.dart';
import 'package:ttt/core/constants/app_consts.dart';
import 'package:ttt/core/extension/text_extension.dart';
import 'package:ttt/core/utils/app_images.dart';

import '../../../../components/custom_button.dart';
import '../../../../components/text_field_component.dart';
import '../../../../core/utils/app_colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageHandler(AppImages.onboarding,
                height: height(context) * .3,
                width: width(context),
                fit: BoxFit.fitWidth),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Register',
                      textAlign: TextAlign.center,
                      style: context.f12400!.copyWith(
                          fontSize: 24.sp, fontWeight: FontWeight.w700)),
                  SizedBox(height: 16.h),
                  TextFieldComponent(
                    hint: 'Name',
                    keyboardType: TextInputType.phone,
                    controller: TextEditingController(),
                  ),
                  SizedBox(height: 20.h),
                  TextFieldComponent(
                    hint: 'Phone',
                    keyboardType: TextInputType.phone,
                    controller: TextEditingController(),
                  ),
                  SizedBox(height: 20.h),
                  TextFieldComponent(
                    hint: 'Year of Experience',
                    keyboardType: TextInputType.phone,
                    controller: TextEditingController(),
                  ),
                  SizedBox(height: 20.h),
                  TextFieldComponent(
                    hint: 'Choose Experience Level',
                    keyboardType: TextInputType.phone,
                    controller: TextEditingController(),
                  ),
                  SizedBox(height: 20.h),
                  TextFieldComponent(
                    hint: 'Address',
                    keyboardType: TextInputType.phone,
                    controller: TextEditingController(),
                  ),
                  SizedBox(height: 20.h),
                  TextFieldComponent(
                    hint: 'Password',
                    keyboardType: TextInputType.name,
                    controller: TextEditingController(),
                  ),
                  SizedBox(height: 40.h),
                  CustomButton(
                      text: 'Register',
                      color: AppColors.whiteColor,
                      onTap: () {}),
                  SizedBox(height: 16.h),
                  Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Didn’t have any account? ',
                          style: context.f14400!
                              .copyWith(color: AppColors.bgGrey)),
                      InkWell(
                        onTap: () {},
                        child: Text('Sign In',
                            style: context.f14400!
                                .copyWith(color: AppColors.primaryColor)),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
