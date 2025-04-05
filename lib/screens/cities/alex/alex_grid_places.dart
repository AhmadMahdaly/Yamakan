import 'package:flutter/material.dart';
import 'package:yamakan/constants/key_language.dart';
import 'package:yamakan/data/cities/alex_places.dart';
import 'package:yamakan/widgets/city_widgets/city_see_all_page.dart';

class AlexGrid extends StatelessWidget {
  const AlexGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SeeAllPageItems(
      categoryLists: [
        AlexPlaces().all,
        AlexPlaces().historical,
        AlexPlaces().cultural,
        AlexPlaces().religious,
        AlexPlaces().park,
        AlexPlaces().cafes,
        AlexPlaces().restaurants,
      ],
      title: TR().alex,
    );
  }
}
