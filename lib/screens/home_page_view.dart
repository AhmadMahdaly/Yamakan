import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yamakan/animation/animation_do.dart';
import 'package:yamakan/components/title_text.dart';
import 'package:yamakan/constants/color_constants.dart';
import 'package:yamakan/constants/key_language.dart';
import 'package:yamakan/data/cities/alex_places.dart';
import 'package:yamakan/models/tour_card_model.dart';
import 'package:yamakan/screens/category/activity_page.dart';
import 'package:yamakan/screens/cities/alex/tours/museum_tour.dart';
import 'package:yamakan/widgets/category_widgets/categories_list_widget.dart';
import 'package:yamakan/widgets/city_widgets/cities_items_list.dart';
import 'package:yamakan/widgets/search_bar.dart';
import 'package:yamakan/widgets/tour_widgets/tour_card_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsets.only(
                  left: 24.sp,
                  right: 24.sp,
                  bottom: 45.sp,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 10.sp,
                        ),
                        SvgPicture.asset(
                          'assets/images/logo.svg',
                          width: 40.sp,
                        ),
                        SizedBox(
                          height: 24.sp,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 12.sp,
                          ),
                          child: CustomFadeInRight(
                            duration: 500,
                            child: Text(
                              'homeTitle'.tr(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.sp,
                      ),
                      child: SvgPicture.asset(
                        'assets/svg/Egypt_places_icon.svg',
                        height: 80.sp,
                      ),
                    ),
                  ],
                ),
              ),
              background: Localizations.localeOf(context) == const Locale('en')
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(
                            45.sp,
                          ),
                        ),
                        color: kMainColor,
                      ),
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                            45.sp,
                          ),
                        ),
                        color: kMainColor,
                      ),
                    ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(
                130.sp,
              ),
              child: Builder(
                builder: (context) => Padding(
                  padding: EdgeInsets.only(
                    bottom: 16.sp,
                    right: 24.sp,
                    left: 24.sp,
                  ),
                  child: HomeSearchBar(
                    hint: 'SearchBarTitle'.tr(),
                  ),
                ),
              ),
            ),
          ),

          /// Title categories
          SliverToBoxAdapter(
            child: CustomFadeInLeft(
              duration: 500,
              child: TitleHomePage(
                title: 'categoriesTitle'.tr(),
              ),
            ),
          ),

          /// Categories
          SliverToBoxAdapter(
            child: CustomFadeInRight(
              duration: 600,
              child: SizedBox(
                height: 92.sp,
                child: const CategoryItemsList(),
              ),
            ),
          ),

          /// Title cities
          SliverToBoxAdapter(
            child: CustomFadeInLeft(
              duration: 500,
              child: TitleHomePage(
                title: 'CitiesTitle'.tr(),
              ),
            ),
          ),

          //Cities
          SliverToBoxAdapter(
            child: CustomFadeInRight(
              duration: 650,
              child: SizedBox(
                height: 120.sp,
                child: const CitiesItems(),
              ),
            ),
          ),

          // activity
          SliverToBoxAdapter(
            child: CustomFadeInLeft(
              duration: 500,
              child: TitleHomePage(
                title: 'activityTitle'.tr(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: CustomFadeInRight(
              duration: 700,
              child: SizedBox(
                height: 210.sp,
                child: const ActivitiesItems(),
              ),
            ),
          ),

          //
          SliverToBoxAdapter(
            child: CustomFadeInLeft(
              duration: 500,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16.sp,
                  bottom: 8.sp,
                  right: 16.sp,
                ),
                child: Text(
                  'SuggestedTour'.tr(),
                  style: TextStyle(
                    color: kTitleSideColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: CustomFadeInLeft(
              duration: 500,
              child: TourCardWidget(
                cards: TourCardModel(
                  cityName: TR().alex,
                  tourName: TR().museumTour,
                  list4Image: [
                    AlexPlaces().all[9].image!,
                    AlexPlaces().all[11].image!,
                    AlexPlaces().all[12].image!,
                    AlexPlaces().all[13].image!,
                  ],
                  tourPage: const AlexMuseumTour(),
                  time: 'Hours7'.tr(),
                  fees: '80 ${"EGP".tr()}',
                ),
              ),
            ),
          ),
          //END OF PAGE
          SliverToBoxAdapter(
            child: SizedBox(
              height: 8.sp,
            ),
          ),
        ],
      ),
    );
  }
}
