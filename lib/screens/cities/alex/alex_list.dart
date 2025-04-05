import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yamakan/components/next_arrow.dart';
import 'package:yamakan/data/cities/alex_places.dart';
import 'package:yamakan/screens/cities/alex/alex_grid_places.dart';
import 'package:yamakan/widgets/place_page_widgets/place_item.dart';

class AlexItemsList extends StatelessWidget {
  const AlexItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 8.sp),
      scrollDirection: Axis.horizontal,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.sp),
          child: Item(item: AlexPlaces().all[0]),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.sp),
          child: Item(item: AlexPlaces().all[4]),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.sp),
          child: Item(item: AlexPlaces().all[3]),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.sp),
          child: Item(item: AlexPlaces().all[8]),
        ),
        const NextArrow(path: AlexGrid()),
      ],
    );
  }
}
