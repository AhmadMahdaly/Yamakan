import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yamakan/components/custom_button.dart';
import 'package:yamakan/components/custom_textfield.dart';
import 'package:yamakan/constants/color_constants.dart';
import 'package:yamakan/features/auth/presentation/widgets/sign_header.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.sp),
      children: [
        SignHeader(
          welcomeText: 'Welcomeback'.tr(),
          text: 'ContinueExplore'.tr(),
        ),
        SizedBox(height: 36.sp),
        CustomTextField(text: 'Mobile'.tr()),
        SizedBox(height: 16.sp),
        CustomPasswordField(text: 'Password'.tr()),
        SizedBox(height: 16.sp),
        Text(
          'Forgotpassword'.tr(),
          textAlign: TextAlign.end,
          style: TextStyle(
            color: kMainColor,
            fontSize: 14.sp,
            decoration: TextDecoration.underline,
            decorationColor: kMainColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 16.sp),
        CustomButton(text: 'SignIn'.tr()),
      ],
    );
  }
}
