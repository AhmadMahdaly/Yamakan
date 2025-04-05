import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yamakan/animation/animation_do.dart';
import 'package:yamakan/models/item_model.dart';
import 'package:yamakan/widgets/category_widgets/no_added_yet_page.dart';
import 'package:yamakan/widgets/place_page_widgets/place_item.dart';

class GridPlacesWidget extends StatelessWidget {
  const GridPlacesWidget({required this.list, super.key});

  final List<ItemModel> list;

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? const NoAddedYet()
        : CustomFadeInUp(
            duration: 800,
            child: GridView.builder(
              padding: EdgeInsets.all(16.sp),
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Item(item: list[index]);
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 150.sp,
                crossAxisSpacing: 16.sp,
                mainAxisSpacing: 16.sp,
                crossAxisCount: 2,
              ),
            ),
          );
  }
}
