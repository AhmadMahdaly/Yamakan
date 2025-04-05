import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yamakan/components/next_arrow.dart';
import 'package:yamakan/data/cities/aswan_places.dart';
import 'package:yamakan/screens/cities/aswan/aswan_grid_place.dart';
import 'package:yamakan/widgets/place_page_widgets/place_item.dart';

class AswanList extends StatelessWidget {
  const AswanList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 8.sp,
      ),
      scrollDirection: Axis.horizontal,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.sp,
          ),
          child: Item(
            item: AswanPlaces().all[4],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.sp,
          ),
          child: Item(
            item: AswanPlaces().all[5],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.sp,
          ),
          child: Item(
            item: AswanPlaces().all[6],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.sp,
          ),
          child: Item(
            item: AswanPlaces().all[2],
          ),
        ),
        const NextArrow(
          path: AswanGrid(),
        ),
      ],
    );
  }
}
