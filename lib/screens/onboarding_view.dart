import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yamakan/animation/animation_do.dart';
import 'package:yamakan/constants/color_constants.dart';
import 'package:yamakan/widgets/navigation_bar_app.dart';
import 'package:yamakan/widgets/onboarding_widget.dart';

class ToOnBoard extends StatelessWidget {
  const ToOnBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _checkOnboarding(),
      builder: (context, snapshot) {
        if (snapshot.data != true) {
          return const OnBoarding();
        } else {
          return const HomePage();
        }
      },
    );
  }

  Future<bool> _checkOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    final hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
    if (!hasSeenOnboarding) {
      await prefs.setBool('hasSeenOnboarding', true);
    }
    return hasSeenOnboarding;
  }
}

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Spacer(),
            Row(
              children: [
                const Spacer(),
                SizedBox(width: 60.sp),
              ],
            ),
            //
            Padding(
              padding: EdgeInsets.all(20.sp),
              child: SizedBox(
                height: 463.sp,
                width: 333.sp,
                child: Wrap(
                  clipBehavior: Clip.antiAlias,
                  direction: Axis.vertical,
                  spacing: 9.sp,
                  runSpacing: 9.sp,
                  children: [
                    CustomFadeInLeft(
                      duration: 500,
                      child: OnboardingWidget(
                        image: 'assets/images/onboarding/1.jpg',
                        height: 97.95.sp,
                      ),
                    ),
                    CustomFadeInLeft(
                      duration: 500,
                      child: OnboardingWidget(
                        image: 'assets/images/onboarding/2.jpg',
                        height: 196.1.sp,
                      ),
                    ),
                    CustomFadeInLeft(
                      duration: 500,
                      child: OnboardingWidget(
                        image: 'assets/images/onboarding/3.jpg',
                        height: 147.sp,
                      ),
                    ),
                    CustomFadeInDown(
                      duration: 500,
                      child: OnboardingWidget(
                        image: 'assets/images/onboarding/4.jpg',
                        height: 155.sp,
                      ),
                    ),
                    CustomFadeInDown(
                      duration: 500,
                      child: OnboardingWidget(
                        image: 'assets/images/onboarding/5.jpg',
                        height: 183.sp,
                      ),
                    ),
                    CustomFadeInUp(
                      duration: 500,
                      child: OnboardingWidget(
                        image: 'assets/images/onboarding/6.jpg',
                        height: 103.sp,
                      ),
                    ),
                    CustomFadeInRight(
                      duration: 500,
                      child: OnboardingWidget(
                        image: 'assets/images/onboarding/7.jpg',
                        height: 143.sp,
                      ),
                    ),
                    CustomFadeInRight(
                      duration: 500,
                      child: OnboardingWidget(
                        image: 'assets/images/onboarding/8.jpg',
                        height: 189.sp,
                      ),
                    ),
                    CustomFadeInRight(
                      duration: 500,
                      child: OnboardingWidget(
                        image: 'assets/images/onboarding/9.jpg',
                        height: 109.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomFadeInUp(
              duration: 500,
              child: SizedBox(
                width: 330.sp,
                child: Text(
                  'titleOnBoard'.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kMainColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            CustomFadeInUp(
              duration: 500,
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: SizedBox(
                  width: 342.sp,
                  child: Text(
                    'onboardingText'.tr(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: const Color(0xFF2D2D66),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            CustomFadeInUp(
              duration: 500,
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kMainColor,
                    fixedSize: Size(327.sp, 56.sp),
                  ),
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  ),
                  child: Text(
                    'startOnBoard'.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      height: 0.07.sp,
                    ),
                  ),
                ),
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
