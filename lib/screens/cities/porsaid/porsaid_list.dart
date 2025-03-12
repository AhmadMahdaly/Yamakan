import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yamakan/components/next_arrow.dart';
import 'package:yamakan/data/cities/portsaid_places.dart';
import 'package:yamakan/screens/cities/porsaid/porsaid_grid_places.dart';
import 'package:yamakan/widgets/place_page_widgets/place_item.dart';

class PortsaidList extends StatelessWidget {
  const PortsaidList({
    super.key,
  });

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
            item: PortsaidPlaces().all[0],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.sp,
          ),
          child: Item(
            item: PortsaidPlaces().all[1],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.sp,
          ),
          child: Item(
            item: PortsaidPlaces().all[3],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.sp,
          ),
          child: Item(
            item: PortsaidPlaces().all[6],
          ),
        ),
        const NextArrow(
          path: PortsaidGrid(),
        ),
      ],
    );
  }
}
