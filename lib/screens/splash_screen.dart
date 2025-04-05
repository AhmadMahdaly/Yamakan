import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yamakan/constants/color_constants.dart';
import 'package:yamakan/screens/onboarding_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    // This is setting the time for disappeare //
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ToOnBoard(),
        ),
      );
    });
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: kMainColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // add your images & Icon or Text //
            FadeInDown(
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                semanticsLabel: 'My SVG Image',
                width: 90.sp,
              ),
            ),
            SizedBox(height: 10.sp),
            Text(
              'YaMaKan',
              style: TextStyle(
                fontFamily: 'jura',
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.w800,
              ),
            ),

            // Text(
            //   'اكتشف أماكن وتجارب جديدة',
            //   style:
            //     TextStyle(
            //       color: Color(0xFF2D2D66),
            //       fontSize: 16.sp,
            //       fontWeight: FontWeight.w700,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
