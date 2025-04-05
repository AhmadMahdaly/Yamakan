import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yamakan/constants/color_constants.dart';
import 'package:yamakan/models/locale_model.dart';
import 'package:yamakan/screens/splash_screen.dart';

class YaMakan extends StatelessWidget {
  const YaMakan({
    required SharedPreferences prefs,
    super.key,
  }) : _prefs = prefs;
  final SharedPreferences _prefs;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        390,
        844,
      ),
      minTextAdapt: true,
      child: ChangeNotifierProvider(
        create: (context) => LocaleModel(_prefs),
        child: Consumer<LocaleModel>(
          builder: (context, localeModel, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            builder: (context, navigator) {
              final lang = Localizations.localeOf(context).languageCode;

              return Theme(
                data: ThemeData(
                  scaffoldBackgroundColor: kScaffoldBackgroundColor,
                  appBarTheme: const AppBarTheme(
                    backgroundColor: kScaffoldBackgroundColor,
                  ),
                  textTheme: Theme.of(context).textTheme.apply(
                        fontFamily: lang == 'ar' ? 'Tajawal' : 'Poppins',
                      ),
                ),
                child: navigator!,
              );
            },
          ),
        ),
      ),
    );
  }
}
