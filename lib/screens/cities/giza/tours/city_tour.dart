import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yamakan/constants/key_language.dart';
import 'package:yamakan/data/cities/giza_places.dart';
import 'package:yamakan/models/tour_place_card_model.dart';
import 'package:yamakan/widgets/tour_widgets/components/tour_time.dart';
import 'package:yamakan/widgets/tour_widgets/tour_page.dart';
import 'package:yamakan/widgets/tour_widgets/tour_place_card_widget.dart';

class GizaCityTour extends StatelessWidget {
  const GizaCityTour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TourPagePathPaint(
        image4: [
          GizaPlaces().all[6].image!,
          GizaPlaces().all[8].image!,
          GizaPlaces().all[11].image!,
          GizaPlaces().all[10].image!,
        ],
        tourName: TR().cityTour,
        nomDestinations: 3,
        cardDestinations: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TourPlaceCardWidget(
              card: TourPlaceCardModel(
                placePage: GizaPlaces().all[6].page,
                image: GizaPlaces().all[6].image,
                placeName: GizaPlaces().all[6].text,
                point: 'Point1'.tr(),
                time: 'Hours3'.tr(),
                fees: '60 ${"EGP".tr()}',
              ),
            ),
            TourTime(
              carTime: 'Car15m5km'.tr(),
              walkTime: 'Walk15m'.tr(),
            ),
            TourPlaceCardWidget(
              card: TourPlaceCardModel(
                placePage: GizaPlaces().all[8].page,
                image: GizaPlaces().all[8].image,
                placeName: GizaPlaces().all[8].text,
                point: 'Point2'.tr(),
                time: 'Hours3'.tr(),
                fees: '350 ${"EGP".tr()}',
              ),
            ),
            TourTime(
              carTime: 'Car15m5km'.tr(),
              walkTime: 'Walk1h'.tr(),
            ),
            TourPlaceCardWidget(
              card: TourPlaceCardModel(
                placePage: GizaPlaces().all[11].page,
                image: GizaPlaces().all[11].image,
                placeName: GizaPlaces().all[11].text,
                point: 'Point3'.tr(),
                time: 'Hours1'.tr(),
                fees: 'Free'.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
