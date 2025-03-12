import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yamakan/data/cities/alex_places.dart';
import 'package:yamakan/data/cities/aswan_places.dart';
import 'package:yamakan/data/cities/cairo_places.dart';
import 'package:yamakan/data/cities/fayoum_places.dart';
import 'package:yamakan/data/cities/giza_places.dart';
import 'package:yamakan/data/cities/portsaid_places.dart';
import 'package:yamakan/widgets/category_widgets/category_page_widget.dart';

class CafesPage extends StatelessWidget {
  const CafesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoryPageItems(
      title: 'Cafes'.tr(),
      categoryLists: [
        CairoPlaces().cafes,
        GizaPlaces().cafes,
        AlexPlaces().cafes,
        PortsaidPlaces().cafes,
        FayoumPlaces().cafes,
        AswanPlaces().cafes,
      ],
    );
  }
}
