
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yamakan/models/locale_model.dart';
import 'package:yamakan/widgets/navigation_bar_app.dart';

class LanguageDropDownButton extends StatelessWidget {
  const LanguageDropDownButton({
    required this.selectedLocale, super.key,
  });

  final String selectedLocale;

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleModel>(
      builder: (context, localeModel, child) => DropdownButton(
        dropdownColor: Colors.white,
        borderRadius: BorderRadius.circular(
          15.sp,
        ),
        value: selectedLocale,
        items: [
          DropdownMenuItem(
            value: 'en',
            child: Text(
              'English',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF645E5E),
                fontSize: 15.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          DropdownMenuItem(
            value: 'ar',
            child: Text(
              'العربية',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF645E5E),
                fontFamily: 'Tajawal',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
        onChanged: (String? value) async {
          if (value != null) {
            await context.setLocale(
              Locale(value),
            );
            await Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          }
        },
      ),
    );
  }
}
