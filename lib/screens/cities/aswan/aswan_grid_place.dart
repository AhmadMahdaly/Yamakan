import 'package:flutter/material.dart';
import 'package:yamakan/constants/key_language.dart';
import 'package:yamakan/data/cities/aswan_places.dart';
import 'package:yamakan/widgets/city_widgets/city_see_all_page.dart';

class AswanGrid extends StatelessWidget {
  const AswanGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SeeAllPageItems(
      categoryLists: [
        AswanPlaces().all,
        AswanPlaces().historical,
        AswanPlaces().cultural,
        AswanPlaces().religious,
        AswanPlaces().park,
        AswanPlaces().cafes,
        AswanPlaces().restaurants,
      ],
      title: TR().aswan,
    );
  }
}
