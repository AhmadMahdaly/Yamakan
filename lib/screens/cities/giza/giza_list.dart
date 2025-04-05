import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yamakan/components/next_arrow.dart';
import 'package:yamakan/data/cities/giza_places.dart';
import 'package:yamakan/screens/cities/giza/giza_grid_places.dart';
import 'package:yamakan/widgets/place_page_widgets/place_item.dart';

class GizaList extends StatelessWidget {
  const GizaList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      scrollDirection: Axis.horizontal,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.sp,
          ),
          child: Item(
            item: GizaPlaces().all[0],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.sp,
          ),
          child: Item(
            item: GizaPlaces().all[6],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.sp,
          ),
          child: Item(
            item: GizaPlaces().all[8],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.sp,
          ),
          child: Item(
            item: GizaPlaces().all[4],
          ),
        ),
        const NextArrow(
          path: GizaGrid(),
        ),
      ],
    );
  }
}
