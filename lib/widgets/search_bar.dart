import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yamakan/constants/color_constants.dart';
import 'package:yamakan/models/page_model.dart';
import 'package:yamakan/widgets/place_page_widgets/place_page.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({required this.hint, super.key});
  final String hint;
  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

String searchText = ''; // النص المدخل

class _HomeSearchBarState extends State<HomeSearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      canRequestFocus: false,
      textInputAction: TextInputAction.route,
      showCursor: false,
      onTap: () async {
        await showSearch(
          context: context,
          delegate: CustomSearchDelegate(),
          useRootNavigator: true,
        );
      },
      onChanged: (value) {
        setState(() {
          searchText = value; // تحديث النص المدخل
        });
      },
      decoration: InputDecoration(
        filled: true, // تفعيل الخلفية الملونة
        fillColor: const Color(0xffFEF7FF),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.sp),
          borderSide: const BorderSide(
            color: Color(0xffFEF7FF),
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE5E5E5),
          ),
          borderRadius: BorderRadius.circular(24.sp),
        ),

        hintText: widget.hint,
        hintStyle: TextStyle(
          color: const Color(0x9989898A),
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),

        // نص تلميح داخل الحقل
        contentPadding: EdgeInsets.symmetric(
          vertical: 8.sp,
          horizontal: 16.sp,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: const Color(0x9989898A),
          size: 20.sp,
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  // These methods are mandatory you cannot skip them.

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.sp,
          ),
          child: Icon(
            Icons.clear,
            size: 24.sp,
            color: kMainColor,
          ),
        ),
        onPressed: () {
          query = '';
          // When pressed here the query will be cleared from the search bar.
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.sp,
        ),
        child: Icon(
          Icons.arrow_back_ios,
          size: 24.sp,
          color: kMainColor,
        ),
      ),
      onPressed: () => Navigator.of(context).pop(),
      // Exit from the search screen.
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // list of widget
    final searchList = <String>[];
    final searchResults = searchList
        .where(
          (item) => item.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index]),
          onTap: () {
            close(context, searchResults[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // list of widget
    final searchList = <String>[
      'ManasterlyPalace'.tr(),
      'FishGarden'.tr(),
      'Sphinx'.tr(),
      'AishaFahmyPalace'.tr(),
      'BikePark'.tr(),
      'SaltMountain'.tr(),
      'PortSaidFerry'.tr(),
      'SuezCanal'.tr(),
      'PortFouad'.tr(),
      'FaryalGarden'.tr(),
      'PortSaidBeach'.tr(),
      'Cassata'.tr(),
      'FishmarketBS'.tr(),
      'TunisVillage'.tr(),
      'WadiRayan'.tr(),
      'HawaraPyramid'.tr(),
      'DesertFayoum'.tr(),
      'TempleDionysias'.tr(),
      'LakeQarun'.tr(),
      'Sawaqi'.tr(),
      'AinSilien'.tr(),
      'PalaceofCulture'.tr(),
      'ValleyWhales'.tr(),
      'Magiclake'.tr(),
      'WatermelonValley'.tr(),
      'Pyramids'.tr(),
      'CairoCitadel'.tr(),
      'Nile'.tr(),
      'KhanKhalili'.tr(),
      'BeitAlsuhaimiItem'.tr(),
      'OperaItem'.tr(),
      'MahfouzMuseumItem'.tr(),
      'CairoLibraryItem'.tr(),
      'AlMuizzItem'.tr(),
      'ReligionsComplex'.tr(),
      'EgyptianMuseum'.tr(),
      'CopticMuseum'.tr(),
      'GrandMuseum'.tr(),
      'IslamicMuseum'.tr(),
      'CivilizationMuseum'.tr(),
      'CarriagesMuseum'.tr(),
      'NubianMuseum'.tr(),
      'SehilIsland'.tr(),
      'KitchenersIsland'.tr(),
      'UnfinishedObelisk'.tr(),
      'TempleKomOmbo'.tr(),
      'Philae'.tr(),
      'SimbelTemple'.tr(),
      'HighDam'.tr(),
      'NileMuseum'.tr(),
      'TouristMarket'.tr(),
      'NubianVillage'.tr(),
      'AswanCorniche'.tr(),
      'AlexandriaLibrary'.tr(),
      'MontazahPalace'.tr(),
      'BeyCitadel'.tr(),
      'RomanTheater'.tr(),
      'StanleyBridge'.tr(),
      'AlexandriaCorn'.tr(),
      'FaroukCafe'.tr(),
      'AndalusPark'.tr(),
      'AzharPark'.tr(),
      'FustatGarden'.tr(),
      'FamilyPark'.tr(),
      'IslandPark'.tr(),
      'FlowerGarden'.tr(),
      'GizaZoo'.tr(),
      'StGeorgesChurch'.tr(),
      'SayyidaZeinabMosque'.tr(),
      'SayyidaNafisaMosque'.tr(),
      'AbuSeifinChurch'.tr(),
      'HusseinMosque'.tr(),
      'AmrIbnElaasMosque'.tr(),
      'HangingChurch'.tr(),
      'AzharMosque'.tr(),
      'UmmKulthumMuseum'.tr(),
      'AquariumMuseum'.tr(),
      'AlexandriaNationalMuseum'.tr(),
      'GrecoRomanMuseum'.tr(),
      'DarwishTheater'.tr(),
      'ArtGarden'.tr(),
      'MaadiFerry'.tr(),
      'StreetOfStatues'.tr(),
      'OrmanGarden'.tr(),
      'Japanesegarden'.tr(),
      'StepPyramid'.tr(),
      'BentPyramid'.tr(),
      'RedPyramid'.tr(),
      'BlackPyramid'.tr(),
      'SerapeumSaqqara'.tr(),
      'MitRahinaMuseum'.tr(),
      'WaterPark'.tr(),
      'MahmoudKhalilMuseum'.tr(),
    ];

    final suggestionList = query.isEmpty
        ? <String>[]
        : searchList
            .where(
              (item) => item.toLowerCase().contains(
                    query.toLowerCase(),
                  ),
            )
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            final place = suggestionList[index];
            if (place == 'ManasterlyPalace'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'ManasterlyPalace'.tr(),
                      descriptionText: 'ManasterlyPalaceAbout'.tr(),
                      openingHours: 'f9at3p'.tr(),
                      tickets:
                          '${"EgyptianStudent".tr()}: 5 ${"EGP".tr()}\n${"Egyptian".tr()}: 10 ${"EGP".tr()}\n${"ForeignStudent".tr()}: 25 ${"EGP".tr()}\n${"Foreign".tr()}: 50 ${"EGP".tr()}',
                      locationUrl: 'https://maps.app.goo.gl/8HjP41C5QqdZYqCE8',
                      imagePaths: [
                        'https://scenenow.com/Content/Admin/Uploads/Articles/ArticlesMainPhoto/41017/0d85784c-f44e-49c2-93f1-cc1188879379.jpg',
                        'https://www.youregypttours.com/storage/1246/1681651430.jpg',
                        'https://fastly.4sqi.net/img/general/600x600/9063854_8_B8qPXezzmST4I4Iy-wFabOy8kAOfLkRWV9Taj42yw.jpg',
                        'https://upload.wikimedia.org/wikipedia/commons/e/e9/%D9%82%D8%B5%D8%B1_%D8%A7%D9%84%D9%85%D8%A7%D9%86%D8%B3%D8%AA%D8%B1%D9%84%D9%8A_%D8%A8%D9%85%D9%86%D9%8A%D9%84_%D8%A7%D9%84%D8%B1%D9%88%D8%B6%D8%A9.jpg',
                        'https://ik.imagekit.io/qidz/production_original_DHpimJ1Pi?tr=w-700,h-467,xc-700,yc-467,q-30',
                        'https://www.youregypttours.com/storage/manasterly-palace-cairo.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'FustatGarden'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      imagePaths: [
                        'https://www.urtrips.com/wp-content/uploads/2022/04/fustat-park-cairo.jpg',
                        'https://english.ahram.org.eg/Media/News/2014/1/30/2014-635266890022645330-264.jpg',
                      ],
                      placeName: 'FustatGarden'.tr(),
                      descriptionText: 'FustatGardenAbout'.tr(),
                      openingHours: 'f8at9p'.tr(),
                      tickets: '${"Egyptian".tr()}: 5 ${"EGP".tr()}',
                      locationUrl: 'https://maps.app.goo.gl/bsuEiavQ95WNhMDM9',
                      locationTitle: 'OldCairo'.tr(),
                    ),
                  ),
                ),
              );
            } else if (place == 'MahmoudKhalilMuseum'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'MahmoudKhalilMuseum'.tr(),
                      descriptionText: 'MahmoudKhalilMuseumAbout'.tr(),
                      openingHours: 'f10at3p'.tr(),
                      tickets:
                          '${"EgyptianStudent".tr()}: 10 ${"EGP".tr()}\n${"Egyptian".tr()}: 30 ${"EGP".tr()}\n${"ForeignStudent".tr()}: 50 ${"EGP".tr()}\n${"Foreign".tr()}: 100 ${"EGP".tr()}',
                      locationUrl: 'https://maps.app.goo.gl/Dy5EieaJCj1zZAvt8',
                      imagePaths: [
                        'https://www.arabcont.com/Images/ProjectImage/MahmoudKhalilMuseum-01.jpg',
                        'https://www.arabcont.com/Images/ProjectImage/khalyl4.jpg',
                        'https://scenehome.com/Content/Admin/Uploads/Articles/ArticlesMainPhoto/10425/a2053038-655e-497f-b04a-846b01384792.jpg',
                        'https://scoopempire.com/wp-content/uploads/2022/11/tempImagedpU7HU.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'FishGarden'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      imagePaths: [
                        'https://londoneyablog.wordpress.com/wp-content/uploads/2014/10/aq.jpg?w=878&h=585&crop=1',
                        'https://www.kuna.net.kw/NewsPictures/2023/3/19/98e9494e-9f32-419d-81e9-e6d34855dd37.jpg',
                        'https://media.spottedbylocals.com/spot/aquarium-grotto-garden-cairo-by-aquarium-grotto-garden-fb.jpg',
                        'https://www.egypttoday.com/siteimages/Larg/3962.jpg',
                        'https://scoopempire.com/wp-content/uploads/2022/09/tempImageS3qq6b.jpg',
                        'https://cairoscene.com/Content/Admin/Uploads/Articles/ArticlesMainPhoto/718193/b053c494-7d41-4607-9d2c-3f29c4d2ac4c.jpg',
                      ],
                      placeName: 'FishGarden'.tr(),
                      descriptionText: 'FishGardenAbout'.tr(),
                      openingHours: 'f9at5p'.tr(),
                      tickets:
                          '${"Egyptian".tr()}: 5 ${"EGP".tr()}\n${"Foreign".tr()}: 20 ${"EGP".tr()}',
                      locationUrl: 'https://maps.app.goo.gl/zefUJCtNXvymGBFq5',
                    ),
                  ),
                ),
              );
            } else if (place == 'Sphinx'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'Sphinx'.tr(),
                      descriptionText: 'SphinxAbout'.tr(),
                      openingHours: 'Am8PM45'.tr(),
                      tickets: 'PyramidsTicket'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/U9hFUtMNdRBe5NzD9',
                      imagePaths: [
                        'https://hips.hearstapps.com/hmg-prod/images/sphinx-in-front-of-pyramids-giza-cairo-egypt-royalty-free-image-1698594747.jpg',
                        'https://www.stellarhistory.com/img/blog/mceu_75810512311690539237224.jpg',
                        'https://static.scientificamerican.com/sciam/cache/file/C2015DC2-3B05-4B02-B37E1DFB642662F4_source.jpg',
                        'https://cdn.theatlantic.com/media/img/photo/2020/02/sphinx/s01_463911773-1/original.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'SaltMountain'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'SaltMountain'.tr(),
                      descriptionText: 'SaltMountainAbout'.tr(),
                      openingHours: 'f9at5p'.tr(),
                      tickets: 'EGP5'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/cRcevs2iMvzX8mhZ7',
                      imagePaths: [
                        'https://cnn-arabic-images.cnn.io/cloudinary/image/upload/w_1920,c_scale,q_auto/cnnarabic/2021/03/02/images/179012.jpg',
                        'https://www.dostor.org/Upload/libfiles/359/8/249.jpeg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'StreetOfStatues'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'StreetOfStatues'.tr(),
                      descriptionText: 'StreetOfStatuesAbout'.tr(),
                      openingHours: 'OpeningAllTime'.tr(),
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/MFAKGnU4oJxhDcCs7',
                      imagePaths: [
                        'https://img.youm7.com/ArticleImgs/2024/3/20/170769-%D8%AA%D9%85%D8%AB%D8%A7%D9%84-%D8%B1%D8%AC%D9%84-%D9%8A%D8%AD%D8%AA%D8%B6%D9%86-%D8%A7%D8%A8%D9%86%D8%AA%D8%A9-.jpeg',
                        'https://img.youm7.com/ArticleImgs/2024/8/10/199264-%D8%AA%D9%85%D8%AB%D8%A7%D9%84-%D8%B1%D8%AC%D9%84-%D9%8A%D8%B3%D8%AA%D8%AE%D8%AF%D9%85-%D8%A7%D9%84%D9%83%D9%85%D8%A8%D9%8A%D9%88%D8%AA%D8%B1-8.jpeg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'OrmanGarden'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      imagePaths: [
                        'https://upload.wikimedia.org/wikipedia/commons/7/79/Orman_Garden_-_Lotus_pond_01.jpg',
                      ],
                      placeName: 'OrmanGarden'.tr(),
                      descriptionText: 'OrmanGardenAbout'.tr(),
                      openingHours: 'f11to11'.tr(),
                      tickets:
                          '${"Egyptian".tr()}: 5 ${"EGP".tr()}\n${"Foreign".tr()}: 20 ${"EGP".tr()}',
                      locationUrl: 'https://maps.app.goo.gl/vRZgLULBTvroedkRA',
                      locationTitle: 'Giza'.tr(),
                    ),
                  ),
                ),
              );
            } else if (place == 'Japanesegarden'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      imagePaths: [
                        'https://www.trfihi-parks.com/images/parks/vgsyIo_1540347566_yyyyyyyy.jpg',
                        'https://www.flyingcarpettours.com/files/large/1091078020-Japanese-Garden.jpg',
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Helwan_Japanischer_Garten.jpg/1024px-Helwan_Japanischer_Garten.jpg',
                        'https://64.media.tumblr.com/9abbecfdd6aee66620600ecee9d3edb8/266c3dff5eb14c97-e3/s500x750/398314be6c5c59f17fc9a20fab798acffb28fb2f.jpg',
                        'https://www.dailynewsegypt.com/app/uploads/2012/09/8-1-Helwan.jpeg',
                      ],
                      placeName: 'Japanesegarden'.tr(),
                      descriptionText: 'JapanesegardenAbout'.tr(),
                      openingHours: 'f9at9p'.tr(),
                      tickets: 'EGP10'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/RZMWLHNmhK6DzvmJA',
                    ),
                  ),
                ),
              );
            } else if (place == 'StepPyramid'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'StepPyramid'.tr(),
                      descriptionText: 'StepPyramidAbout'.tr(),
                      openingHours: 'f9at4p'.tr(),
                      tickets:
                          '${"EgyptianStudent".tr()}: 20 ${"EGP".tr()}\n${"Egyptian".tr()}: 40 ${"EGP".tr()}\n${"ForeignStudent".tr()}: 75 ${"EGP".tr()}\n${"Foreign".tr()}: 150 ${"EGP".tr()}',
                      locationUrl: 'https://maps.app.goo.gl/tscnpckgJ6tAQz2q8',
                      imagePaths: [
                        'https://images.unsplash.com/photo-1636020895075-5e598638375e?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://images.unsplash.com/photo-1632836404155-271fb5bc1810?q=80&w=1471&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://cdn.al-ain.com/lg/images/2020/3/03/127-215950-egypt-pyramid-djoser-2.png',
                        'https://cdn.alweb.com/thumbs/egyptencyclopedia/article/fit710x532/%D9%87%D8%B1%D9%85-%D8%B2%D9%88%D8%B3%D8%B1-%D9%83%D9%84-%D9%85%D8%A7-%D9%8A%D9%87%D9%85%D9%83-%D8%B9%D9%86%D9%87.jpg',
                        'https://egymonuments.gov.eg//media/2793/_dsc8617.jpg?crop=0.42076541296164083,0.16226313539869217,0.19148199861856993,0.37024094096788068&cropmode=percentage&width=1200&height=630&rnd=133547227670000000',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'BentPyramid'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'BentPyramid'.tr(),
                      descriptionText: 'BentPyramidAbout'.tr(),
                      openingHours: 'f9at4p'.tr(),
                      tickets:
                          '${"EgyptianStudent".tr()}: 5 ${"EGP".tr()}\n${"Egyptian".tr()}: 10 ${"EGP".tr()}\n${"ForeignStudent".tr()}: 75 ${"EGP".tr()}\n${"Foreign".tr()}: 150 ${"EGP".tr()}',
                      locationUrl: 'https://maps.app.goo.gl/LxocQA5a83XpNiso9',
                      imagePaths: [
                        'https://cnn-arabic-images.cnn.io/cloudinary/image/upload/w_1606,c_scale,q_auto/cnnarabic/2021/05/26/images/185709.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'RedPyramid'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'RedPyramid'.tr(),
                      descriptionText: 'RedPyramidAbout'.tr(),
                      openingHours: 'f9at4p'.tr(),
                      tickets:
                          '${"EgyptianStudent".tr()}: 5 ${"EGP".tr()}\n${"Egyptian".tr()}: 10 ${"EGP".tr()}\n${"ForeignStudent".tr()}: 75 ${"EGP".tr()}\n${"Foreign".tr()}: 150 ${"EGP".tr()}',
                      locationUrl: 'https://maps.app.goo.gl/MfzMe5tqKCidDoYH7',
                      imagePaths: [
                        'https://upload.wikimedia.org/wikipedia/commons/4/4c/Egypt.Dashur.RedPyramid.01.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'BlackPyramid'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'BlackPyramid'.tr(),
                      descriptionText: 'BlackPyramidAbout'.tr(),
                      openingHours: 'f9at4p'.tr(),
                      tickets:
                          '${"EgyptianStudent".tr()}: 5 ${"EGP".tr()}\n${"Egyptian".tr()}: 10 ${"EGP".tr()}\n${"ForeignStudent".tr()}: 75 ${"EGP".tr()}\n${"Foreign".tr()}: 150 ${"EGP".tr()}',
                      locationUrl: 'https://maps.app.goo.gl/835UygxrjDsstNVBA',
                      imagePaths: [
                        'https://www.elbalad.news/Upload/libfiles/1012/9/380.jpg',
                        'https://lh3.googleusercontent.com/p/AF1QipMV9vb5XfbMY-LJ4hX-U8wdHmvY-n3z87TKQF9g=s680-w680-h510',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'SerapeumSaqqara'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'SerapeumSaqqara'.tr(),
                      descriptionText: 'SerapeumSaqqaraAbout'.tr(),
                      openingHours: 'f9at4p'.tr(),
                      tickets:
                          '${"EgyptianStudent".tr()}: 5 ${"EGP".tr()}\n${"Egyptian".tr()}: 20 ${"EGP".tr()}\n${"ForeignStudent".tr()}: 90 ${"EGP".tr()}\n${"Foreign".tr()}: 180 ${"EGP".tr()}',
                      locationUrl: 'https://maps.app.goo.gl/89fM8AaTcrqtZZCw7',
                      imagePaths: [
                        'https://lh4.googleusercontent.com/proxy/Nl259OMS1-Be1cRFekYQDCFiY64CZ5hZRQydjGVcvZZocM7rKPGp1VOMKScn_4_2vLynasQuo_wmvklViVXIGuJR_nTdGigL6E0DVOt546s',
                        'https://www.mojallad.com/wp-content/uploads/2020/12/127237459_390463735740755_1848475310331415217_n.jpg',
                        'https://www.albawabhnews.com/Upload/libfiles/722/7/442.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'MitRahinaMuseum'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'MitRahinaMuseum'.tr(),
                      descriptionText: 'MitRahinaMuseumAbout'.tr(),
                      openingHours: 'f9at4p'.tr(),
                      tickets:
                          '${"EgyptianStudent".tr()}: 5 ${"EGP".tr()}\n${"Egyptian".tr()}: 10 ${"EGP".tr()}\n${"ForeignStudent".tr()}: 75 ${"EGP".tr()}\n${"Foreign".tr()}: 150 ${"EGP".tr()}',
                      locationUrl: 'https://maps.app.goo.gl/TdnTwVrrJfsyjcqX6',
                      imagePaths: [
                        'https://upload.wikimedia.org/wikipedia/commons/d/db/Memphis_BW_2.jpg',
                        'https://www.alkhaleej.ae/sites/default/files/2021-05/3490941.jpeg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'WaterPark'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      imagePaths: [
                        'https://lh3.googleusercontent.com/p/AF1QipP_o9LBuv2PdZUeUMyhd-ktbOOYBuboZS9quUMZ=s680-w680-h510',
                        'https://lh3.googleusercontent.com/p/AF1QipMKm89ki6dmSlKia7bHKsTE9zqYl9wSaByT-v4P=s680-w680-h510',
                      ],
                      placeName: 'WaterPark'.tr(),
                      descriptionText: 'WaterParkAbout'.tr(),
                      openingHours: 'f9at4p'.tr(),
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/GXQDC4f7S72cQG5bA',
                    ),
                  ),
                ),
              );
            } else if (place == 'MaadiFerry'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'MaadiFerry'.tr(),
                      descriptionText: 'MaadiFerryAbout'.tr(),
                      openingHours: 'f6at12a'.tr(),
                      tickets: 'EGP5'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/Zc9mvKqJpFDQQw7f6',
                      imagePaths: [
                        'https://aqaryamasr.com/blog/wp-content/uploads/2022/08/%D8%A7%D9%84%D9%85%D8%B9%D8%A7%D8%AF%D9%8A-%D8%A7%D9%84%D9%85%D8%AF%D9%8A%D9%86%D8%A9-%D8%B0%D8%A7%D8%AA-%D8%A7%D9%84%D8%A7%D8%A8%D8%B1%D8%A7%D8%AC-%D8%A7%D9%84%D9%86%D9%87%D8%B1%D9%8A%D8%A9-%D8%A7%D9%84%D8%B4%D8%A7%D9%87%D9%82%D8%A9-5-1.jpg',
                        'https://www.uvisne.com/uploads/%D8%A7%D9%84%D9%85%D8%B9%D8%A7%D8%AF%D9%8A-1.webp',
                        'https://aqaryamasr.com/blog/wp-content/uploads/2023/01/%D8%AD%D9%8A-%D8%A7%D9%84%D9%85%D8%B9%D8%A7%D8%AF%D9%8A.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'ArtGarden'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'ArtGarden'.tr(),
                      descriptionText: 'ArtGardenAbout'.tr(),
                      openingHours: 'f9at12a'.tr(),
                      tickets: 'EGP20'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/WiULBJEE4ZshVDYf7',
                      imagePaths: [
                        'https://shbabbek.com/upload/webp/uploadyc7cljs1ok08scc8k0jpg_750X380.webp',
                        'https://al-rahhala.com/wp-content/uploads/2023/02/%D8%AD%D8%AF%D9%8A%D9%82%D8%A9-%D8%A7%D9%84%D9%81%D9%86%D9%88%D9%86-%D8%A8%D8%A7%D9%84%D9%85%D9%86%D9%8A%D9%84-1-78.jpeg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'BikePark'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'BikePark'.tr(),
                      descriptionText: 'BikeParkAbout'.tr(),
                      openingHours: 'f9at11p'.tr(),
                      tickets: 'EGP25'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/mLkzLzwnv7nV9gaw9',
                      imagePaths: [
                        'https://www.trfihi-parks.com/images/parks/iLaOMs_1574729102_daeee.jpg',
                        'https://www.afhotels.com.eg/img/upload/M1DJI_0557.JPG',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'AishaFahmyPalace'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'AishaFahmyPalace'.tr(),
                      descriptionText: 'AishaFahmyPalaceAbout'.tr(),
                      openingHours: 'f9at9p'.tr(),
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/6ozVKFgvnzP1z7yz9',
                      imagePaths: [
                        'https://www.arabcont.com/Images/ProjectImage/Aisha01.jpg',
                        'https://aqaryamasr.com/blog/wp-content/uploads/2022/07/%D8%B3%D9%84%D8%A7%D9%84%D9%85-%D9%82%D8%B5%D8%B1-%D8%B9%D8%A7%D8%A6%D8%B4%D8%A9-%D9%81%D9%87%D9%85%D9%8A.jpg',
                        'https://darelhilal.com/Media/News/2022/9/27/2022-637998970315789024-578.jpeg',
                        'https://www.independentarabia.com/sites/default/files/styles/1368x911/public/article/mainimage/2022/07/20/578666-1871220746.jpg?itok=6vkTQF60',
                        'https://sharkiatoday.com/wp-content/uploads/2018/09/%D9%82%D8%B5%D8%B1-%D8%B9%D8%A7%D8%B4.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'DarwishTheater'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'DarwishTheater'.tr(),
                      descriptionText: 'DarwishTheaterAbout'.tr(),
                      openingHours: '${"f11at3p".tr()}\n ${"OffFriSat".tr()}',
                      tickets: 'OperaTickets'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/DRaSevaMzrXCupzZ7',
                      imagePaths: [
                        'https://upload.wikimedia.org/wikipedia/commons/4/45/%D9%88%D8%A7%D8%AC%D9%87%D9%87_%D9%85%D8%B3%D8%B1%D8%AD_%D8%B3%D9%8A%D8%AF_%D8%AF%D8%B1%D9%88%D9%8A%D8%B4_%D8%A8%D8%A7%D9%84%D8%A3%D8%B3%D9%83%D9%86%D8%AF%D8%B1%D9%8A%D8%A9.jpg',
                        'https://www.cairoopera.org/media/r0mnwias/23199-60.jpg',
                        'https://www.albawabhnews.com/Upload/libfiles/625/2/65.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'PortSaidFerry'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'PortSaidFerry'.tr(),
                      descriptionText: 'PortSaidFerryAbout'.tr(),
                      openingHours: '${"f65at10a".tr()}\n${"f11at75p".tr()}',
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/TsVcJ2BEmGdnStAZ8',
                      imagePaths: [
                        'https://upload.wikimedia.org/wikipedia/commons/9/94/Port_said_egypt_%286%29.JPG',
                        'https://media-cdn.tripadvisor.com/media/photo-s/16/49/65/fa/caption.jpg',
                        'https://media-cdn.tripadvisor.com/media/photo-s/1a/48/25/c8/ferry-aproaching-port.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'StGeorgesChurch'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      imagePaths: [
                        'https://images.akhbarelyom.com/images/images/large/20180113233318008.jpg',
                        'https://scontent.fcai19-7.fna.fbcdn.net/v/t1.6435-9/56685691_1134359260076081_8444697721675186176_n.jpg?stp=dst-jpg_s720x720&_nc_cat=104&ccb=1-7&_nc_sid=13d280&_nc_ohc=GnAsVz4jTycQ7kNvgErEH44&_nc_ht=scontent.fcai19-7.fna&_nc_gid=Ac5yY2SAYOOe8gWU1PgzCRA&oh=00_AYDC-IxaI4pFMJ2RlYU3lhKthIuz_WJPLpk2D7jKs20TpQ&oe=670BA4A7',
                        'https://upload.wikimedia.org/wikipedia/commons/b/b8/Saint_george_church_%D9%83%D9%86%D9%8A%D8%B3%D8%A9_%D9%85%D8%A7%D8%B1%D9%8A_%D8%AC%D8%B1%D8%AC%D8%B3_%D8%A8%D9%85%D8%AC%D9%85%D8%B9_%D8%A7%D9%84%D8%A7%D8%AF%D9%8A%D8%A7%D9%86.jpg',
                        'https://arabcont.com/Images/ProjectImage/MaryGerges01.jpg',
                      ],
                      placeName: 'StGeorgesChurch'.tr(),
                      descriptionText: 'StGeorgesChurchAbout'.tr(),
                      openingHours: 'f9at3p'.tr(),
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/Q8Pk1BKiUEF6drwBA',
                    ),
                  ),
                ),
              );
            } else if (place == 'SayyidaZeinabMosque'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      imagePaths: [
                        'https://upload.wikimedia.org/wikipedia/commons/2/2c/Mosque_of_Sayeda_Zainab%2C_Cairo.JPG',
                        'https://www.arabcont.com/Images/ProjectImage/zynab4.jpg',
                        'https://upload.wikimedia.org/wikipedia/commons/4/48/Sayeda_Zainab_Mosque_040.jpg',
                        'https://49fe30bb3aa7406c16dc-5c968119d095dc32d807923c59347cc2.ssl.cf1.rackcdn.com/2013.522.080_1.jpg',
                      ],
                      placeName: 'SayyidaZeinabMosque'.tr(),
                      descriptionText: 'SayyidaZeinabMosqueAbout'.tr(),
                      openingHours: 'OpeningAllDay'.tr(),
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/2yEDtk17UWpwRWGa9',
                    ),
                  ),
                ),
              );
            } else if (place == 'SayyidaNafisaMosque'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      imagePaths: [
                        'https://upload.wikimedia.org/wikipedia/commons/4/43/Sayidah_Nafisah_Mosque_in_Egypt.jpg',
                        'https://assets.cairo360.com/app/uploads/2012/04/article_original_3742_2012244_27313364-600x323.jpeg',
                        'https://mediaaws.almasryalyoum.com/news/large/2016/06/12/477409_0.jpg',
                        'https://www.bawabatelalam.com/wp-content/uploads/2023/08/FB_IMG_1691477329314.jpg',
                      ],
                      placeName: 'SayyidaNafisaMosque'.tr(),
                      descriptionText: 'SayyidaNafisaMosqueAbout'.tr(),
                      openingHours: 'OpeningAllDay'.tr(),
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/k2nwHE1HVaAViw8w8',
                    ),
                  ),
                ),
              );
            } else if (place == 'AbuSeifinChurch'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      imagePaths: [
                        'https://www.tripsinegypt.com/wp-content/uploads/2018/11/Abu-Serga-Church-Trips-in-Egypt-3.jpg',
                      ],
                      placeName: 'AbuSeifinChurch'.tr(),
                      descriptionText: 'AbuSeifinChurchAbout'.tr(),
                      openingHours: 'f7at5p'.tr(),
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/UJjgYPcs5e1irZTG8',
                    ),
                  ),
                ),
              );
            } else if (place == 'HusseinMosque'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      imagePaths: [
                        'https://www.arabcont.com/Images/ProjectImage/hsyenn2.jpg',
                        'https://www.arabcont.com/Images/ProjectImage/hsyenn3.jpg',
                      ],
                      placeName: 'HusseinMosque'.tr(),
                      descriptionText: 'HusseinMosqueAbout'.tr(),
                      openingHours: 'OpeningAllDay'.tr(),
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/EJA5xDWWR1tUzJ5L9',
                    ),
                  ),
                ),
              );
            } else if (place == 'AzharMosque'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      imagePaths: [
                        'https://assets.raya.com/wp-content/uploads/2022/04/09194736/%D8%A7%D9%84%D8%AC%D8%A7%D9%85%D8%B9-%D8%A7%D9%84%D8%A7%D8%B2%D9%87%D8%B1-%D9%81%D9%8A-%D8%A7%D9%84%D9%82%D8%A7%D9%87%D8%B1%D8%A9..%D9%85%D8%B3%D8%AC%D8%AF-%D9%88%D8%AC%D8%A7%D9%85%D8%B9%D8%A9-%D9%85%D9%86%D8%B0-%D8%A3%D9%84%D9%81-%D8%B9%D8%A7%D9%85.jpg',
                        'https://darelhilal.com/Media/News/2023/3/29/2023-638156815143519713-351.jpg',
                      ],
                      placeName: 'AzharMosque'.tr(),
                      descriptionText: 'AzharMosqueAbout'.tr(),
                      openingHours: 'OpeningAllDay'.tr(),
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/6xEAPXUDDAKsyzum7',
                    ),
                  ),
                ),
              );
            } else if (place == 'HangingChurch'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      imagePaths: [
                        'https://images.unsplash.com/photo-1678812408008-1b132030b062?q=80&w=1332&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://images.unsplash.com/photo-1679522708551-1f21950921b1?q=80&w=1332&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://cdn1-m.alittihad.ae/store/archive/image/2021/3/18/2b24be50-117b-4d42-812f-9782204e19e3.jpg?width=1300',
                        'https://www.arabcont.com/Images/ProjectImage/Church01.jpg',
                      ],
                      placeName: 'HangingChurch'.tr(),
                      descriptionText: 'HangingChurchAbout'.tr(),
                      openingHours: 'f9at4p'.tr(),
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/TtBp2Nr9E3WvB9B19',
                    ),
                  ),
                ),
              );
            } else if (place == 'AmrIbnElaasMosque'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'AmrIbnElaasMosque'.tr(),
                      descriptionText: 'AmrMosqueAbout'.tr(),
                      openingHours: 'OpeningAllDay'.tr(),
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/zy1eFeZDf3Fd97QM8',
                      imagePaths: [
                        'https://upload.wikimedia.org/wikipedia/commons/c/c7/%D8%AC%D8%A7%D9%85%D8%B9_%D8%B9%D9%85%D8%B1%D9%88_%D8%A8%D9%86_%D8%A7%D9%84%D8%B9%D8%A7%D8%B5_Mosque_of_Amr_ibn_al-Aas.jpg',
                        'https://cnn-arabic-images.cnn.io/cloudinary/image/upload/w_1920,c_scale,q_auto/cnnarabic/2020/05/24/images/155448.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'SuezCanal'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'SuezCanal'.tr(),
                      descriptionText: 'SuezCanalAbout'.tr(),
                      openingHours: 'f9at4p'.tr(),
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/wiryXRVLc5cdh2L26',
                      imagePaths: [
                        'https://www.arabcont.com/Images/ProjectImage/Portsaid4.jpg',
                        'https://www.levantineheritage.com/i/portsaid9.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'PortFouad'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'PortFouad'.tr(),
                      descriptionText: 'PortFouadAbout'.tr(),
                      openingHours: 'OpeningAllTime'.tr(),
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/MWSTzuzcaVDjS62U9',
                      imagePaths: [
                        'https://gate.ahram.org.eg/daily/Media/News/2015/8/20/2015-635756961951085636-108.jpg',
                        'https://www.cairo24.com/Upload/libfiles/116/3/34.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'FaryalGarden'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'FaryalGarden'.tr(),
                      descriptionText: 'FaryalGardenAbout'.tr(),
                      openingHours: 'f7at12a'.tr(),
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/2ZPGhsTTy76NELrTA',
                      imagePaths: [
                        'https://gate.ahram.org.eg/Media/News/2021/2/23/2021-637496865483093947-309.jpg',
                        'https://r2.community.samsung.com/t5/image/serverpage/image-id/1411101i467A6AC8A36DDEAB?v=v2',
                        'https://scenenow.com/Content/editor_api/images/PortSaidFeryalGarden_Website03-8d0a7523-15d9-4db0-ae4d-662c48dc238d.jpg',
                        'https://scenenow.com/Content/editor_api/images/PortSaidFeryalGarden_Website02-45346d2f-ea21-4829-9a96-ebaef2e7e856.jpg',
                        'https://scenenow.com/Content/editor_api/images/PortSaidFeryalGarden_Website04-f43ba798-8c88-4c3e-9de7-56eac229e96c.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'PortSaidBeach'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'PortSaidBeach'.tr(),
                      descriptionText: 'PortSaidBeachAbout'.tr(),
                      openingHours: 'OpeningAllTime'.tr(),
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/YFqnYHdMx2FX63fcA',
                      imagePaths: [
                        'https://img.youm7.com/ArticleImgs/2021/7/25/203892-%D8%A3%D8%AD%D8%AF-%D8%B4%D9%88%D8%A7%D8%B7%D8%A6-%D8%A8%D9%88%D8%B1-%D8%B3%D8%B9%D9%8A%D8%AF.jpeg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'Cassata'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'Cassata'.tr(),
                      descriptionText: 'CassataAbout'.tr(),
                      openingHours: 'OpeningAllTime'.tr(),
                      tickets: 'EGP20'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/nKvBHHVNjdzRXxSt8',
                      imagePaths: [
                        'https://fastly.4sqi.net/img/general/600x600/30585027_CPOJCdA_vDFkLd_16zcEEDkvBlfnM1-uD6-l6LdrTiQ.jpg',
                        'https://m.gomhuriaonline.com/Upload/News/18-9-2023_12_35_06_GomhuriaOnline_1695029706.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'FishmarketBS'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'FishmarketBS'.tr(),
                      descriptionText: 'FishmarketBSAbout'.tr(),
                      openingHours: 'f8at10p'.tr(),
                      tickets: 'FeesOnOrder'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/s4NDAfnsZKCUvKRq5',
                      imagePaths: [
                        'https://m.gomhuriaonline.com/Upload/News/13-1-2019_15_33_39_GomhuriaOnline_1547386419.jpg',
                        'https://img.youm7.com/ArticleImgs/2024/5/3/210093-%D8%A3%D8%B3%D9%85%D8%A7%D9%83-%D8%A8%D9%88%D8%B1%D8%B3%D8%B9%D9%8A%D8%AF-%D8%A7%D9%84%D9%8A%D9%88%D9%85-%D8%A7%D9%84%D8%AC%D9%85%D8%B9%D9%87.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'TunisVillage'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'TunisVillage'.tr(),
                      descriptionText: 'TunisVAbout'.tr(),
                      openingHours: 'OpeningAllDay'.tr(),
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/gdRojxxFd5zpJgjh6',
                      imagePaths: [
                        'https://images.memphistours.com/large/1219746583_013a751bbfec5a31c860454864d1ab53.jpg',
                        'https://www.deluxetoursegypt.com/wp-content/uploads/2021/11/Tunis-village-fayoum.jpeg',
                        'https://www.propertyfinder.eg/blog/wp-content/uploads/2022/02/9-800x600-1.jpeg',
                        'https://www.sharm-club.com/assets/images/cities/fayoum/tunis-village-pottery.jpg',
                        'https://www.urtrips.com/wp-content/uploads/2018/08/Tunis-Village-1.jpg',
                        'https://cnn-arabic-images.cnn.io/cloudinary/image/upload/w_1920,c_scale,q_auto/cnnarabic/2022/02/10/images/204543.jpg',
                        'https://cnn-arabic-images.cnn.io/cloudinary/image/upload/w_1920,c_scale,q_auto/cnnarabic/2022/02/10/images/204540.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'WadiRayan'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'WadiRayan'.tr(),
                      descriptionText: 'RayanAbout'.tr(),
                      openingHours: 'OpeningAllDay'.tr(),
                      tickets: 'EGP10'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/mVLLc789MrC6a6Ji7',
                      imagePaths: [
                        'https://geotours.b-cdn.net/photos/excursions/Egypt%20Fayoum%20Wadi%20El%20Rayan_844c5_lg.jpg',
                        'https://unitedguidestravel.com/wp-content/uploads/2022/04/wadi-el-rayan-in-al-fayoum-oasis.jpg',
                        'https://www.alexsportingclub.com/new/wp-content/uploads/2018/12/wady-elryan.jpg',
                        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0e/18/65/a9/the-waterfalls.jpg?w=1200&h=-1&s=1',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'HawaraPyramid'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'HawaraPyramid'.tr(),
                      descriptionText: 'HawaraPAbout'.tr(),
                      openingHours: 'OpeningAllDay'.tr(),
                      tickets: 'EGP10'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/Hy3xjhoBNudNyopG6',
                      imagePaths: [
                        'https://media-cdn.tripadvisor.com/media/photo-s/04/56/68/c3/hawara-pyramid.jpg',
                        'https://www.shorouknews.com/uploadedimages/Other/original/%D9%87%D8%B1%D9%85%20%D9%87%D9%88%D8%A7%D8%B1%D8%A9%20%D9%81%D9%8A%20%D8%A7%D9%84%D9%81%D9%8A%D9%88%D9%85.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'DesertFayoum'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'DesertFayoum'.tr(),
                      descriptionText: 'SandSAbout'.tr(),
                      openingHours: 'OpeningAllDay'.tr(),
                      tickets: 'FeesOnOrder'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/qf65atHbPAdQpvgp9',
                      imagePaths: [
                        'https://www.sharm-club.com/assets/images/cities/fayoum/fayoum-magic-lake.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'TempleDionysias'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'TempleDionysias'.tr(),
                      descriptionText: 'TempleDAbout'.tr(),
                      openingHours: 'OpeningAllDay'.tr(),
                      tickets: 'EGP10'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/jfoibWoiipLceYpG9',
                      imagePaths: [
                        'https://www.cairo24.com/Upload/libfiles/58/0/121.jpg',
                        'https://upload.wikimedia.org/wikipedia/commons/f/f6/QasrQarunFacade.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'LakeQarun'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'LakeQarun'.tr(),
                      descriptionText: 'LakeQarunAbout'.tr(),
                      openingHours: 'OpeningAllTime'.tr(),
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/msG2tS3KCeQeuRdv7',
                      imagePaths: [
                        'https://images.akhbarelyom.com/UP/20180724111943424.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'Sawaqi'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'Sawaqi'.tr(),
                      descriptionText: 'SawaqiAbout'.tr(),
                      openingHours: 'OpeningAllTime'.tr(),
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/KPACAhuRr5f2vLkY7',
                      imagePaths: [
                        'https://upload.wikimedia.org/wikipedia/commons/c/c7/MadinatFayyumWaterWheel.jpg',
                        'https://www.etltravel.com/wp-content/uploads/2021/10/fayoum-waterwheels-053.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'AinSilien'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'AinSilien'.tr(),
                      descriptionText: 'SilinAbout'.tr(),
                      openingHours: 'OpeningAllDay'.tr(),
                      tickets: 'EGP10'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/5o92jvZZnAPMAVnQ8',
                      imagePaths: [
                        'https://scontent.fcai19-7.fna.fbcdn.net/v/t1.6435-9/31649365_1812733385455667_6718215461042913280_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=13d280&_nc_ohc=l8PI2Avb6-0Q7kNvgGJtBL_&_nc_ht=scontent.fcai19-7.fna&_nc_gid=AnKPMy54rR9Dr3VRqTMxQN0&oh=00_AYBU47p5dYdoUKsIAu-LqJ_oOH4lqcfNgEVp9iVDBxE5yw&oe=670C1715',
                        'https://www.propertyfinder.eg/blog/wp-content/uploads/2023/11/received_1027777608125821-800x422.jpeg',
                        'http://www.fayoum.gov.eg/tourism/%D8%B9%D9%8A%D9%86%20%D8%A7%D9%84%D8%B3%D9%8A%D9%84%D9%8A%D9%86.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'PalaceofCulture'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'PalaceofCulture'.tr(),
                      descriptionText: 'PalaceOfCFayoum'.tr(),
                      openingHours: 'OpeningAllDay'.tr(),
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/qqVNesDT6g2nEXf49',
                      imagePaths: [
                        'https://www.maspero.eg/image/750/450/2023/09/16947088310.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'ValleyWhales'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'ValleyWhales'.tr(),
                      descriptionText: 'VWhalesAbout'.tr(),
                      openingHours: 'OpeningAllDay'.tr(),
                      tickets: 'EGP25'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/PRyMJ4xpEtNbpQNw9',
                      imagePaths: [
                        'https://alnnhar.com/wp-content/uploads/2021/02/wadi-al-hitan-museum-16-780x470.jpg',
                        'https://d3rr2gvhjw0wwy.cloudfront.net/uploads/activity_headers/282853/2000x2000-0-70-5837215572beb6d0367a71179c75b6ee.jpg',
                        'https://www.ootlah.com/wp-content/uploads/2021/09/%D9%88%D8%A7%D8%AF%D9%8A-%D8%A7%D9%84%D8%AD%D9%8A%D8%AA%D8%A7%D9%86.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'Magiclake'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'Magiclake'.tr(),
                      descriptionText: 'MagicLakeAbout'.tr(),
                      openingHours: 'OpeningAllDay'.tr(),
                      tickets: 'EGP10'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/VwqfZxQ9bJYbf2cK8',
                      imagePaths: [
                        'https://gate.ahram.org.eg/Media/News/2017/9/10/2017-636406741215513930-551.jpg',
                        'https://watanimg.elwatannews.com/image_archive/original_lower_quality/14539454991683820049.jpg',
                        'https://www.elbalad.news/Upload/libfiles/959/4/202.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'WatermelonValley'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'WatermelonValley'.tr(),
                      descriptionText: 'WatermalonVAbout'.tr(),
                      openingHours: 'OpeningAllDay'.tr(),
                      tickets: 'EGP10'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/kfW8eGU2WFBED7gm9',
                      imagePaths: [
                        'https://img.soutalomma.com/Large/20180906080835835.jpg',
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/KhargaWadiBattikh.jpg/800px-KhargaWadiBattikh.jpg',
                        'https://i1.wp.com/almalnews.com/wp-content/uploads/2019/10/%D8%A7%D9%84%D8%A8%D8%B7%D9%8A%D8%AE-%D8%A7%D9%84%D8%AC%D9%8A%D9%88%D9%84%D9%88%D8%AC%D9%8A-0.jpg?fit=1024%2C1024&ssl=1',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'Pyramids'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'Pyramids'.tr(),
                      descriptionText: 'PyramidsAbout'.tr(),
                      openingHours: 'Am8PM45'.tr(),
                      tickets: 'PyramidsTicket'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/9zkBNivLXB5aW8RZ7',
                      imagePaths: [
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/All_Gizah_Pyramids.jpg/800px-All_Gizah_Pyramids.jpg',
                        'https://static.srpcdigital.com/2023-12/450250.jpeg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'CairoCitadel'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'CairoCitadel'.tr(),
                      descriptionText: 'CitadelAbout'.tr(),
                      openingHours: 'Am9Pm5'.tr(),
                      tickets: 'CitadelTicket'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/HBVuET6CuP7EaA7d6',
                      imagePaths: [
                        'https://images.unsplash.com/photo-1710659077556-6072c33d9afe?q=80&w=1389&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://egyptonlinetours.com/files/xlarge/696504356-Cairo-Citadel.jpg',
                        'https://middle-east-online.com/sites/default/files/styles/home_special_coverage_1920xauto/public/2024-02/Cairo%20citadel.jpg?itok=97FhNfgx',
                        'https://upload.wikimedia.org/wikipedia/commons/3/3d/%D9%85%D8%B3%D8%AC%D8%AF_%D9%85%D8%AD%D9%85%D8%AF_%D8%B9%D9%84%D9%8A_%D8%A8%D8%A7%D9%84%D9%82%D9%84%D8%B9%D9%87_1.jpg',
                        'https://i.ebayimg.com/images/g/yeIAAOSwv-NWZhk1/s-l1200.jpg',
                        'https://images.squarespace-cdn.com/content/v1/5f56423f4aca615934476295/263d8de0-ea0d-4b40-891f-6f5d52b8004c/Citadel+1.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'Nile'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'Nile'.tr(),
                      descriptionText: 'NileAbout'.tr(),
                      openingHours: 'OpeningAllTime'.tr(),
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://g.co/kgs/65n8V66',
                      imagePaths: [
                        'https://images.adsttc.com/media/images/6485/8197/7870/7215/2fd6/d94e/large_jpg/flowing-through-time-the-nile-river-and-cairos-urban-romance_1.jpg?1686471136',
                        'https://assets.cairo360.com/app/uploads/2023/03/08/The_River_Nile_Cairo_Egypt-1024x768.jpeg',
                        'https://media.tacdn.com/media/attractions-splice-spp-674x446/09/1f/59/5f.jpg',
                        'https://vid.alarabiya.net/images/2021/04/03/6af3875c-094a-4dbe-8e87-99e1b1900c7d/6af3875c-094a-4dbe-8e87-99e1b1900c7d.jpg?crop=1:1',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'KhanKhalili'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'KhanKhalili'.tr(),
                      descriptionText: 'KhanKhaliliAbout'.tr(),
                      openingHours: 'DaysNights'.tr(),
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/KocYwefnkgsSHDeW6',
                      imagePaths: [
                        'https://images.unsplash.com/photo-1710211288826-b7df3ab71588?q=80&w=1564&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://arabic.news.cn/20230108/d9726203bb25432db1c5ee38f7a33314/644d1b3828ef4e2da5d8e289fe44d75f.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'BeitAlsuhaimiItem'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'BeitAlsuhaimiItem'.tr(),
                      descriptionText: 'BeitAlsuhaimiDescription'.tr(),
                      openingHours: 'Am9Pm5'.tr(),
                      tickets: 'BeitAlsuhaimiTickets'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/z3FUgftcL24LNC4R7',
                      imagePaths: [
                        'https://gate.ahram.org.eg/daily/Media/News/2022/5/17/2022-637884160070516220-51.jpg',
                        'https://egymonuments.gov.eg/media/1524/dsc_0328.jpg',
                        'https://www.cairo.gov.eg/ar/Bank%20of%20Ideas/PublishingImages/Thaqafa_Fnoon/2-waghat/Culture_houses/sehemy1.jpg',
                        'https://upload.wikimedia.org/wikipedia/commons/e/e0/%D9%85%D9%86_%D8%AF%D8%A7%D8%AE%D9%84_%D8%A8%D9%8A%D8%AA_%D8%A7%D9%84%D8%B3%D8%AD%D9%8A%D9%85%D9%8A_%D8%A8%D8%A7%D9%84%D9%82%D8%A7%D9%87%D8%B1%D8%A9.jpg',
                        'https://middle-east-online.com/sites/default/files/styles/home_special_coverage_1920xauto/public/2018-10/wk2_1.jpg?itok=jGm0Hl_C',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'OperaItem'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'OperaItem'.tr(),
                      descriptionText: 'OperaDescription'.tr(),
                      openingHours: 'OpeningAllDay'.tr(),
                      tickets: 'OperaTickets'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/APXJYRxf3oRKXftPA',
                      imagePaths: [
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/%D8%AF%D8%A7%D8%B1_%D8%A7%D9%84%D8%A7%D9%88%D8%A8%D8%B1%D8%A7_%D8%A7%D9%84%D9%85%D8%B5%D8%B1%D9%8A%D8%A9.jpg/800px-%D8%AF%D8%A7%D8%B1_%D8%A7%D9%84%D8%A7%D9%88%D8%A8%D8%B1%D8%A7_%D8%A7%D9%84%D9%85%D8%B5%D8%B1%D9%8A%D8%A9.jpg',
                        'https://www.shorouknews.com/uploadedimages/Other/original/hdhzdsghzdsgzds.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'MahfouzMuseumItem'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'MahfouzMuseumItem'.tr(),
                      descriptionText: 'MahfouzMuseumDescription'.tr(),
                      openingHours: 'Am9Pm5'.tr(),
                      tickets: 'MahfousMuseumTickets'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/yCZHd8WsK5z32m819',
                      imagePaths: [
                        'https://static.sayidaty.net/inline-images/%D9%85%D8%AA%D8%AD%D9%81-%D9%86%D8%AC%D9%8A%D8%A8-%D9%85%D8%AD%D9%81%D9%88%D8%B8.jpg',
                        'https://media.gemini.media/img/original/2019/7/14/2019_7_14_15_54_11_477.jpg',
                        'https://middle-east-online.com/sites/default/files/styles/fws_home_section_articles_762x468/public/2021-07/xxsss_0.jpg?h=82f92a78&itok=ZL0KUf8J',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'CairoLibraryItem'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'CairoLibraryItem'.tr(),
                      descriptionText: 'CairoLibraryDescription'.tr(),
                      openingHours: 'Am9Pm25'.tr(),
                      tickets: 'CairoLibraryTickets'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/cszzEs5qR52XdBtr9',
                      imagePaths: [
                        'https://scontent.fcai19-7.fna.fbcdn.net/v/t1.6435-9/201949182_109308418056758_3150294034202860348_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=2a1932&_nc_ohc=Cy2g061Jb5MQ7kNvgGF4z2C&_nc_ht=scontent.fcai19-7.fna&oh=00_AYAL_xFhKS7H575_Hhojb6S5iO_ySDTibH2KJDWj3K7FxA&oe=670BC77E',
                        'https://www.albayan.ae/polopoly_fs/1.2269077.1475817768!/image/image.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'AlMuizzItem'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'AlMuizzItem'.tr(),
                      descriptionText: 'AlMuizzDescription'.tr(),
                      openingHours: 'OpeningAllDay'.tr(),
                      tickets: 'AlMuizzTickets'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/shmZ3EofaFzyU3PT9',
                      imagePaths: [
                        'https://lp-cms-production.imgix.net/2023-07/shutterstockeditorial1342943672.jpg',
                        'https://images.unsplash.com/photo-1636754991203-c4a2d6bda22e?q=80&w=1327&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://images.unsplash.com/photo-1597109145583-f739857c8d91?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://images.unsplash.com/photo-1597108871441-facdd8217ba6?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://images.unsplash.com/photo-1597108871210-5d34b46223b6?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://images.unsplash.com/photo-1673123413901-73d5748ad09e?q=80&w=1383&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://el-yom.com/wp-content/uploads/2020/08/elmo3z3.jpg',
                        'https://www.edarabia.com/ar/wp-content/uploads/2018/11/4-questions-answers-about-muizz-street.jpg',
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/%D8%B4%D8%A7%D8%B1%D8%B9_%D8%A7%D9%84%D9%85%D8%B9%D8%B2_%D9%84%D8%AF%D9%8A%D9%86_%D8%A7%D9%84%D9%84%D9%87_%D8%A7%D9%84%D9%81%D8%A7%D8%B7%D9%85%D9%8A_-_%D9%85%D8%B5%D8%B1_%D8%A7%D9%84%D9%82%D8%AF%D9%8A%D9%85%D8%A9.jpg/412px-%D8%B4%D8%A7%D8%B1%D8%B9_%D8%A7%D9%84%D9%85%D8%B9%D8%B2_%D9%84%D8%AF%D9%8A%D9%86_%D8%A7%D9%84%D9%84%D9%87_%D8%A7%D9%84%D9%81%D8%A7%D8%B7%D9%85%D9%8A_-_%D9%85%D8%B5%D8%B1_%D8%A7%D9%84%D9%82%D8%AF%D9%8A%D9%85%D8%A9.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'ReligionsComplex'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'ReligionsComplex'.tr(),
                      descriptionText: 'ReligionsComplexAbout'.tr(),
                      openingHours: 'f9at3p'.tr(),
                      tickets: 'EGP5'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/uJo28Ukz4g9P8eYz8',
                      imagePaths: [
                        'https://images.unsplash.com/photo-1678812408008-1b132030b062?q=80&w=1332&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://images.unsplash.com/photo-1678889413368-0f44c0627e5f?q=80&w=1332&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://images.unsplash.com/photo-1679364788423-2b9e3d78c2a0?q=80&w=1332&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://images.unsplash.com/photo-1677775767681-fa6ae58ee239?q=80&w=1325&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://images.akhbarelyom.com/images/images/large/20230104201710294.jpg',
                        'https://assets.cairo360.com/app/uploads/2022/10/05/800px-%D9%85%D8%AC%D9%85%D8%B9_%D8%A7%D9%84%D8%A7%D8%AF%D9%8A%D8%A7%D9%86_%D8%A7%D9%84%D9%83%D9%86%D9%8A%D8%B3%D9%87_%D8%A7%D9%84%D9%85%D8%B9%D9%84%D9%82%D9%87.jpg',
                        'https://www.independentarabia.com/sites/default/files/styles/800x600/public/article/mainimage/2023/09/17/841226-1291084636.jpg?itok=zEZOdQ_6',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'EgyptianMuseum'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'EgyptianMuseum'.tr(),
                      descriptionText: 'EgyptionMuseumDescription'.tr(),
                      openingHours: 'f9at5p'.tr(),
                      tickets:
                          '${"EgyptianStudent".tr()}: 10 ${"EGP".tr()}\n${"Egyptian".tr()}: 30 ${"EGP".tr()}\n${"ForeignStudent".tr()}: 230 ${"EGP".tr()}\n${"Foreign".tr()}: 450 ${"EGP".tr()}',
                      locationUrl: 'https://maps.app.goo.gl/hMCQf8UuA2RJ1amJ8',
                      imagePaths: [
                        'https://content.almalnews.com/wp-content/uploads/2015/03/2be9bea7-3088-4df3-83a8-3fdc14259348-1024x1024.jpg',
                        'https://www.otlaat.com/wp-content/uploads/2019/12/%D9%85%D8%AA%D8%A7%D8%AD%D9%81-%D9%85%D8%B5%D8%B1.jpg',
                        'https://egymonuments.gov.eg/media/5968/dsc05389.jpg?center=0.63888888888888884,0.44097222222222221&mode=crop&width=645&height=423&rnd=132320788960000000',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'CopticMuseum'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'CopticMuseum'.tr(),
                      descriptionText: 'CopticMuseumDescription'.tr(),
                      openingHours: 'f9at3p'.tr(),
                      tickets: 'CopticMuseumTickets'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/8x4SkbU7BEkF6sTK8',
                      imagePaths: [
                        'https://www.urtrips.com/wp-content/uploads/2022/06/the-coptic-museum-cairo5.jpg',
                        'https://mota.gov.eg/media/tywpcwwg/%D8%A7%D9%84%D9%82%D8%A8%D8%B7%D9%8A-3.jpg?width=1055&height=593&rnd=133023773987170000',
                        'https://m3lomah.news/wp-content/uploads/2024/01/%D8%A7%D9%84%D9%85%D8%AA%D8%AD%D9%81-%D8%A7%D9%84%D9%82%D8%A8%D8%B7%D9%8A4.png',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'GrandMuseum'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'GrandMuseum'.tr(),
                      descriptionText: 'GrandMuseumDescription'.tr(),
                      openingHours: 'GrandMuseumOpening'.tr(),
                      tickets: 'GrandMuseumTickets'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/y6GyvLzVUXLvsAgg9',
                      imagePaths: [
                        'https://visit-gem.com/storage/informations1675951038Side-Image-01.jpg',
                        'https://mediaaws.almasryalyoum.com/news/verylarge/2023/03/08/2050177_0.jpg',
                        'https://www.propertyfinder.eg/blog/wp-content/uploads/2022/03/Grand-Egyptian-museum-design.jpeg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'IslamicMuseum'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'IslamicMuseum'.tr(),
                      descriptionText: 'IslamicMuseumDescription'.tr(),
                      openingHours: 'f9at3p'.tr(),
                      tickets: 'IslamicMuseumTickets'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/p1UdCk4HsUm2LdPJA',
                      imagePaths: [
                        'https://static.srpcdigital.com/2023-12/473532.jpeg',
                        'https://www.propertyfinder.eg/blog/wp-content/uploads/2023/12/image-10-732x800.jpeg',
                        'https://qatarmuseumsstorageprd.blob.core.windows.net/media/images/MIA_Galleries_2022.10_G12-004-MQ.2e16d0ba.fill-400x450.jpg',
                        'https://mota.gov.eg/media/hflebtbc/%D8%A7%D8%B3%D9%84%D8%A7%D9%85%D9%8A-8.jpg?width=1055&height=593&rnd=133023786045330000',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'CivilizationMuseum'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'CivilizationMuseum'.tr(),
                      descriptionText: 'CivilizationMuseumDescription'.tr(),
                      openingHours: 'CivilizationMuseumOpening'.tr(),
                      tickets: 'CivilizationMuseumTickets'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/guPrhJZ2HrLWi7sn7',
                      imagePaths: [
                        'https://m3lomah.news/wp-content/uploads/2022/12/%D8%A7%D9%84%D9%85%D8%AA%D8%AD%D9%81-%D8%A7%D9%84%D9%82%D9%88%D9%85%D9%8A-%D9%84%D9%84%D8%AD%D8%B6%D8%A7%D8%B1%D8%A9-1024x686.jpg',
                        'https://aktsadna.com/wp-content/uploads/2022/09/hall-statue.jpg',
                        'https://www.kuna.net.kw/NewsPictures/2023/1/31/89e035c2-5577-49ea-9afb-af75cb77e968.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'CarriagesMuseum'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'CarriagesMuseum'.tr(),
                      descriptionText: 'CarriagesMuseumDescription'.tr(),
                      openingHours: 'f9at3p'.tr(),
                      tickets: 'CarriagesMuseumTickets'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/ADu3DGUGq2boDbw99',
                      imagePaths: [
                        'https://www.albawabhnews.com/Upload/libfiles/532/4/537.jpg',
                        'https://media.gemini.media/img/large/2020/8/21/2020_8_21_20_44_50_992.jpg',
                        'https://media.gemini.media/img/large/2019/8/6/2019_8_6_17_1_20_287.jpg',
                        'https://dla7m3h3caipg.cloudfront.net/wp-content/uploads/2020/11/IMG_20201109_113554.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'NubianMuseum'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'NubianMuseum'.tr(),
                      descriptionText: 'NubianMuseumAbout'.tr(),
                      openingHours: 'f8at8p'.tr(),
                      tickets: '${"E30EGP".tr()}\n${"F200EGP".tr()}',
                      locationUrl: 'https://maps.app.goo.gl/piTheS9PPv8g4mSy8',
                      imagePaths: [
                        'https://dla7m3h3caipg.cloudfront.net/wp-content/uploads/2023/04/13.png',
                        'https://cdn.elwatannews.com/watan/840x473/13767533351700749326.jpg',
                        'https://i2.wp.com/almalnews.com/wp-content/uploads/2020/02/%D9%85%D8%AA%D8%AD%D9%81-%D8%A7%D9%84%D9%86%D9%88%D8%A8%D8%A92.png?fit=1024%2C1024&ssl=1',
                        'https://assets.annahar.com/ContentFilesArchive/329691Image1-1180x677_d.jpg?version=2103689',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'SehilIsland'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'SehilIsland'.tr(),
                      descriptionText: 'SehilIslandAbout'.tr(),
                      openingHours: 'OpeningAllDay'.tr(),
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/A9FRwnXUztxXZq687',
                      imagePaths: [
                        'https://egymonuments.gov.eg/media/7854/img_20211213_143705.jpg?crop=0.19818298199546813,0,0.08260458334355876,0&cropmode=percentage&width=645&height=423&rnd=133653737480000000',
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Sehel_enscriptions.jpg/1200px-Sehel_enscriptions.jpg',
                        'https://www.cairo24.com/UploadCache/libfiles/52/5/600x338o/534.jpg',
                        'https://watanimg.elwatannews.com/image_archive/original_lower_quality/15393339161646478823.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'KitchenersIsland'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'KitchenersIsland'.tr(),
                      descriptionText: 'KitchenersIslandAbout'.tr(),
                      openingHours: 'f7at5p'.tr(),
                      tickets: 'E10EGP'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/Sf7ZrwSj4M5S9Jne7',
                      imagePaths: [
                        'https://d3rr2gvhjw0wwy.cloudfront.net/uploads/activity_galleries/301535/2000x2000-0-70-7b8e53922049dc670452425fcaff7f4b.jpg',
                        'https://www.deluxetoursegypt.com/wp-content/uploads/2020/01/Aswan-Botanical-Garden-4-scaled.jpg',
                        'https://d3rr2gvhjw0wwy.cloudfront.net/uploads/activity_galleries/51891/2000x2000-0-70-7e634430cb012f2ea730c5e7ed77ef39.jpg',
                        'https://www.luxorandaswan.com/images/15972532890153314896209bfa30c79c0272ceeb34f18a0eaff3a3-aswan-botanical-gardens.jpg',
                        'https://www.egypttoursportal.com/images/2023/11/Aswan-Botanical-Garden-Gallery-1-Egypt-Tours-Portal.jpg',
                        'https://scenenow.com/Content/editor_api/images/WhatsApp%20Image%202021-09-07%20at%206.03.55%20PM-7771a15e-d98c-4ed5-8dbc-5d489c740b65.jpeg',
                        'https://upload.wikimedia.org/wikipedia/commons/0/02/Aswan_Botanical_Garden_09.jpg',
                        'https://literarytoursegypt.com/wp-content/uploads/2022/09/Aswan-Botonical-Garden-view.jpg',
                        'https://images.memphistours.com/large/8d89779ad38854432b9c08c95195b165.jpg',
                        'https://assets.annahar.com/ContentFilesArchive/335924Image1-1180x677_d.jpg?version=2146183',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'UnfinishedObelisk'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'UnfinishedObelisk'.tr(),
                      descriptionText: 'UnfinishedObeliskAbout'.tr(),
                      openingHours: 'f7at4p'.tr(),
                      tickets: '${"E20EGP".tr()}\n${"F200EGP".tr()}',
                      locationUrl: 'https://maps.app.goo.gl/5kYjoHbgXkZvofJd6',
                      imagePaths: [
                        'https://www.egypttoursportal.com/images/2018/09/The-Unfinshed-Obelisk-Egypt-Egypt-Portal.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'TempleKomOmbo'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'TempleKomOmbo'.tr(),
                      descriptionText: 'TempleKomOmboAbout'.tr(),
                      openingHours: 'f7at9p'.tr(),
                      tickets: '${"E40EGP".tr()}\n${"F360EGP".tr()}',
                      locationUrl: 'https://maps.app.goo.gl/mTm2gpJpQJUCPfov6',
                      imagePaths: [
                        'https://www.egipto.com/wp-content/uploads/2022/02/templo-kom-ombo.jpg',
                        'https://www.traveltoegypt.net/front/images/blog/KomOmbo2.jpg',
                        'https://www.traveltoegypt.net/front/images/blog/KomOmbo.jpg',
                        'https://al-rahhala.com/wp-content/uploads/2019/06/%D9%85%D8%B9%D8%A8%D8%AF-%D9%83%D9%88%D9%85-%D8%A7%D9%85%D8%A8%D9%88.jpg',
                        'https://mf.b37mrtl.ru/media/pics/2018.09/article/5b8e4790d43750995a8b45db.jpg',
                        'https://upload.wikimedia.org/wikipedia/commons/2/22/KomOmboToSE.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'Philae'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'Philae'.tr(),
                      descriptionText: 'PhilaeAbout'.tr(),
                      openingHours: 'f7at4p'.tr(),
                      tickets: '${"E40EGP".tr()}\n${"F450EGP".tr()}',
                      locationUrl: 'https://maps.app.goo.gl/UyomLYZHsbmyA2Le9',
                      imagePaths: [
                        'https://cnn-arabic-images.cnn.io/cloudinary/image/upload/w_1920,c_scale,q_auto/cnnarabic/2021/02/22/images/178268.jpg',
                        'https://cnn-arabic-images.cnn.io/cloudinary/image/upload/w_1920,c_scale,q_auto/cnnarabic/2021/02/26/images/178648.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'SimbelTemple'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'SimbelTemple'.tr(),
                      descriptionText: 'SimbelTempleAbout'.tr(),
                      openingHours: 'f7at6p'.tr(),
                      tickets: '${"E160EGP".tr()}\n${"F400EGP".tr()}',
                      locationUrl: 'https://maps.app.goo.gl/9VqrUZrD8zs6WYYc9',
                      imagePaths: [
                        'https://images.unsplash.com/photo-1502250493741-939d1c76eaad?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://images.unsplash.com/photo-1648139210599-aa27a54177a4?q=80&w=1299&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://images.unsplash.com/photo-1648139210599-aa27a54177a4?q=80&w=1299&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://cnn-arabic-images.cnn.io/cloudinary/image/upload/w_1920,c_scale,q_auto/cnnarabic/2021/02/24/images/178440.jpg',
                        'https://cnn-arabic-images.cnn.io/cloudinary/image/upload/w_1920,c_scale,q_auto/cnnarabic/2021/02/24/images/178433.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'HighDam'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'HighDam'.tr(),
                      descriptionText: 'HighDamAbout'.tr(),
                      openingHours: 'f9at5p'.tr(),
                      tickets: '${"E40EGP".tr()}\n${"F100EGP".tr()}',
                      locationUrl: 'https://maps.app.goo.gl/CMA4mRM1q5FXoDs18',
                      imagePaths: [
                        'https://new.almogaz.com/sites/default/files/styles/almgoaz_img/public/feed_images/24/01/31/1011.jpg?itok=sRYEllDs',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'NileMuseum'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'NileMuseum'.tr(),
                      descriptionText: 'NileMuseumAbout'.tr(),
                      openingHours: 'f9at4p'.tr(),
                      tickets: 'EGP10'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/o8iccqQyFyEMf5GRA',
                      imagePaths: [
                        'https://sonsofegypt.net/wp-content/uploads/2023/08/%D9%85%D8%AA%D8%AD%D9%81-%D8%A7%D9%84%D9%86%D9%8A%D9%84-%D8%A7%D9%84%D8%AC%D8%AF%D9%8A%D8%AF-%D8%A8%D8%A7%D8%B3%D9%88%D8%A7%D9%86.jpg',
                        'https://arabic.news.cn/2022-03/13/1310512560_16471668249011n.jpg',
                        'https://yallabook.com/blog/admincp/userfiles/%D9%85%D8%AA%D8%AD%D9%81%20%D8%A7%D9%84%D9%86%D9%8A%D9%8413.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'TouristMarket'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'TouristMarket'.tr(),
                      descriptionText: 'TouristMarketAbout'.tr(),
                      openingHours: 'OpeningAllDay'.tr(),
                      tickets: 'FeesOnOrder'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/Zu4Z1XJkyJmUNyQE6',
                      imagePaths: [
                        'https://www.propertyfinder.eg/blog/wp-content/uploads/2023/11/shutterstock_245165713-1-1-800x533.jpg',
                        'https://www.elbalad.news/Upload/libfiles/777/5/566.jpg',
                        'https://elmeezan.com/wp-content/uploads/2020/10/aswan_market_street.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'NubianVillage'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'NubianVillage'.tr(),
                      descriptionText: 'NubianVillageAbout'.tr(),
                      openingHours: 'OpeningAllDay'.tr(),
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/bo5DCxhJxF1CBABm7',
                      imagePaths: [
                        'https://images.unsplash.com/photo-1655163394362-97de2d3c5c85?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://explore.rehlat.ae/static/media/searchdestination/thingstodo/images/aswan/nubian_village/large_1best-location-and-the.webp',
                        'https://wujhat.com/wp-content/uploads/2021/07/%D8%A7%D9%84%D9%82%D8%B1%D9%8A%D8%A9-%D8%A7%D9%84%D9%86%D9%88%D8%A8%D9%8A%D8%A9-%D8%A8%D8%A7%D8%B3%D9%88%D8%A7%D9%86-2-1.png',
                        'https://watanimg.elwatannews.com/image_archive/original_lower_quality/9141436101620981229.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'AswanCorniche'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'AswanCorniche'.tr(),
                      descriptionText: 'AswanCornicheAbout'.tr(),
                      openingHours: 'OpeningAllTime'.tr(),
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/fDrtEA4S6jfgzpuw7',
                      imagePaths: [
                        'https://img.youm7.com/ArticleImgs/2023/10/31/184619-%D8%AC%D8%A7%D9%86%D8%A8-%D9%85%D9%86-%D8%A7%D9%84%D8%A3%D8%B9%D9%85%D8%A7%D9%84-(2).jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'AlexandriaLibrary'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'AlexandriaLibrary'.tr(),
                      descriptionText: 'AlexLib'.tr(),
                      openingHours: 'AlexLibOpen'.tr(),
                      tickets: 'AlexLibTicket'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/BYrhoUjRkyFcjdL8A',
                      imagePaths: [
                        'https://arquitecturaviva.com/assets/uploads/obras/40325/av_imagen.webp',
                        'https://www.egypttoursportal.com/images/2017/11/Alexandria-Library-Egypt-Tours-Portal.jpg',
                        'https://www.youregypttours.com/storage/850/1667735700.jpg',
                        'https://upload.wikimedia.org/wikipedia/commons/5/5e/Alexandria%27s_Bibliotheca.jpg',
                        'https://d-techinternational.com/wp-content/uploads/2017/12/new-alexandria-library1.jpg',
                        'https://amimagazine.org/wp-content/uploads/2023/09/the-ancient-library-at-alexandria-midjourney-v0-nc2oqvjxjdb91.webp',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'MontazahPalace'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'MontazahPalace'.tr(),
                      descriptionText: 'MontazahAbout'.tr(),
                      openingHours: 'MontazahOpen'.tr(),
                      tickets: '25 ${"EGP".tr()}',
                      locationUrl: 'https://maps.app.goo.gl/AV5pPoUoTtLmW1HL9',
                      imagePaths: [
                        'https://scenenow.com/Content/editor_api/images/Al%20Montazah%20Palace_WEBSITE02-aa83b056-d6d8-4df0-a1ae-bffff8d9c77a.jpg',
                        'https://www.youregypttours.com/storage/1084/1678608620.jpg',
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Alexandria-MontazahPalace.jpg/1200px-Alexandria-MontazahPalace.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'BeyCitadel'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'BeyCitadel'.tr(),
                      descriptionText: 'BeyAbout'.tr(),
                      openingHours: 'Am9Pm5'.tr(),
                      tickets: 'BeyCitadelTic'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/7zwR5NnHgHRYQfQk9',
                      imagePaths: [
                        'https://images.unsplash.com/photo-1682090471391-413a38705abe?q=80&w=1364&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://images.unsplash.com/photo-1697546889969-27f7b5be8664?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://images.unsplash.com/photo-1610131042652-42d6f3754c51?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://images.unsplash.com/photo-1600238771534-3413182d64eb?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://images.unsplash.com/photo-1551772097-121d550d46e4?q=80&w=1335&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://upload.wikimedia.org/wikipedia/commons/1/17/Alexandria_Egypt_%28235108463%29.jpeg',
                        'https://cnn-arabic-images.cnn.io/cloudinary/image/upload/w_1920,c_scale,q_auto/cnnarabic/2020/09/06/images/164256.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'UmmKulthumMuseum'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'UmmKulthumMuseum'.tr(),
                      descriptionText: 'UmmKulthumMuseumAbout'.tr(),
                      openingHours: 'f9at4p'.tr(),
                      tickets:
                          '${"EgyptianStudent".tr()}: 2 ${"EGP".tr()}\n${"Egyptian".tr()}: 5 ${"EGP".tr()}\n${"ForeignStudent".tr()}: 10 ${"EGP".tr()}\n${"Foreign".tr()}: 20 ${"EGP".tr()}\n${"photography".tr()}',
                      locationUrl: 'https://maps.app.goo.gl/rDJ7tTCChtqDBz9n8',
                      imagePaths: [
                        'https://www.cairo.gov.eg/ar/Bank%20of%20Ideas/PublishingImages/Thaqafa_Fnoon/2-waghat/Museums/om_kalsom.jpg',
                        'https://kids.pink-mag.com/wp-content/uploads/2017/04/arab_travelers_tours_photo_1415009678_274.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'AquariumMuseum'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'AquariumMuseum'.tr(),
                      descriptionText: 'AquariumMuseumAbout'.tr(),
                      openingHours: 'f9at5p'.tr(),
                      tickets:
                          '${"EgyptianStudent".tr()}: 5 ${"EGP".tr()}\n${"Egyptian".tr()}: 10 ${"EGP".tr()}\n${"ForeignStudent".tr()}: 15 ${"EGP".tr()}\n${"Foreign".tr()}: 20 ${"EGP".tr()}',
                      locationUrl: 'https://maps.app.goo.gl/xqWJ4PnSv1Qzi1po8',
                      imagePaths: [
                        'https://www.tar7al.com/wp-content/uploads/2022/12/aquarium-in-alexandria-9.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'AlexandriaNationalMuseum'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'AlexandriaNationalMuseum'.tr(),
                      descriptionText: 'AlexandriaNationalMuseumAbout'.tr(),
                      openingHours: 'f9at4p'.tr(),
                      tickets:
                          '${"EgyptianStudent".tr()}: 5 ${"EGP".tr()}\n${"Egyptian".tr()}: 20 ${"EGP".tr()}\n${"ForeignStudent".tr()}: 50 ${"EGP".tr()}\n${"Foreign".tr()}: 100 ${"EGP".tr()}',
                      locationUrl: 'https://maps.app.goo.gl/k7dh1TfZRnCjoFSv6',
                      imagePaths: [
                        'https://media.gemini.media/img/Original/2023/8/30/2023_8_30_17_38_39_626.jpg',
                        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiqVvcJzabZPtjxef6n3EGYivzvzWA7k9AwvsIymZ1XT5VgXdHEqWGqN9dLGBxYz84HMVFAXXT4tr6rYetBWAHChXNe3Yub1NqPTlU460b4U7zxA05ZSWR00Tgd2VJXkZPM-pTbO13YuHthPUpzDf87rMyTtW--VFvTL2y7MvTQwpPqHdJR3iFxJ8PR/s320/FCEF916B-68DC-4B9B-B371-99073739C4A7.jpeg',
                        'https://mediaaws.almasryalyoum.com/news/large/2022/10/15/1919903_0.jpeg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'GrecoRomanMuseum'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'GrecoRomanMuseum'.tr(),
                      descriptionText: 'GrecoRomanMuseumAbout'.tr(),
                      openingHours: 'f9at5p'.tr(),
                      tickets:
                          '${"EgyptianStudent".tr()}: 20 ${"EGP".tr()}\n${"Egyptian".tr()}: 40 ${"EGP".tr()}\n${"ForeignStudent".tr()}: 150 ${"EGP".tr()}\n${"Foreign".tr()}: 300 ${"EGP".tr()}',
                      locationUrl: 'https://maps.app.goo.gl/2cZf3fLL33XTx3Zi6',
                      imagePaths: [
                        'https://www.alkhaleej.ae/sites/default/files/2023-10/5480007.jpeg',
                        'https://alnnhar.com/wp-content/uploads/2021/02/Graeco-Roman-Museum2.jpg',
                        'https://www.masrtimes.com/Upload/libfiles/34/2/236.jpg',
                        'https://www.maspero.eg/images/2023/10/16979826334.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'RomanTheater'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'RomanTheater'.tr(),
                      descriptionText: 'RomanTAbout'.tr(),
                      openingHours: 'Am9Pm5'.tr(),
                      tickets: 'RomanTTic'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/44G8bKdqArPqcmqf9',
                      imagePaths: [
                        'https://admin.ask-aladdin.com/photos/egypt/articles/amphitheatre-askaladdin.webp',
                        'https://i0.wp.com/ancienttheatrearchive.com/wp-content/uploads/2022/05/alexandria-1-Edit.jpg?fit=1936%2C1288&ssl=1',
                        'https://st5.depositphotos.com/3531125/66969/i/450/depositphotos_669691996-stock-photo-archaeological-site-roman-amphitheater-kom.jpg',
                        'https://www.abou-alhool.com/ima/40439_160125_1423_6ecfb.jpg',
                        'https://cnn-arabic-images.cnn.io/cloudinary/image/upload/w_1920,c_scale,q_auto/cnnarabic/2020/11/18/images/170426.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'StanleyBridge'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'StanleyBridge'.tr(),
                      descriptionText: 'StanlyAbout'.tr(),
                      openingHours: 'OpeningAllTime'.tr(),
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/rz4DUftXNbW2qWri6',
                      imagePaths: [
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Stanley_Bridge%2C_Alexandria%2C_Egypt.jpg/1200px-Stanley_Bridge%2C_Alexandria%2C_Egypt.jpg',
                        'https://us.images.westend61.de/0001402027pw/egypt-alexandria-stanley-bridge-at-sunrise-TAMF02342.jpg',
                        'https://www.arabcont.com/Images/ProjectImage/Stanly02.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'AlexandriaCorn'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'AlexandriaCorn'.tr(),
                      descriptionText: 'AlexCorn'.tr(),
                      openingHours: 'OpeningAllTime'.tr(),
                      tickets: 'Free'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/1bXKR1ugqQRCqWEu5',
                      imagePaths: [
                        'https://www.urtrips.com/wp-content/uploads/2022/09/alexanderia-corniche5.jpg',
                        'https://media.capitalgate.news/img/24/02/19/1919.jpg',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'FaroukCafe'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      placeName: 'FaroukCafe'.tr(),
                      descriptionText: 'FaroukCafeAbout'.tr(),
                      openingHours: 'OpeningAllTime'.tr(),
                      tickets: 'FeesOnOrder'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/7mFF8iCmDvo8fAVQ7',
                      imagePaths: [
                        'https://pbs.twimg.com/media/FcVv-0yXwAAcorr?format=jpg&name=large',
                      ],
                    ),
                  ),
                ),
              );
            } else if (place == 'AndalusPark'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      imagePaths: [
                        'https://mantiqti.cairolive.com/wp-content/uploads/2018/07/IMG_0185edited.jpg',
                        'https://assets.annahar.com/ContentFilesArchive/326503Image1-1180x677_d.jpg?version=2082252',
                      ],
                      placeName: 'AndalusPark'.tr(),
                      descriptionText: 'AndalusAbout'.tr(),
                      openingHours: 'f9at10p'.tr(),
                      tickets: 'AndalusTicket'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/zBMy5bmoWLk9UYFfA',
                    ),
                  ),
                ),
              );
            } else if (place == 'AzharPark'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      imagePaths: [
                        'https://images.unsplash.com/photo-1693273647671-b25ecd2c7174?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://images.unsplash.com/photo-1693273647333-4553b3b58c77?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://images.unsplash.com/photo-1693273647745-10f31ae894bf?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        'https://hiragate.com/wp-content/uploads/2021/08/%D8%A7%D9%84%D8%A3%D8%B2%D9%87%D8%B1-%D8%A8%D8%A7%D8%B1%D9%83-1.jpg',
                        'https://scenenow.com/Content/editor_api/images/2-17275071-3cba-443b-9d8a-b689601c351c.jpg',
                      ],
                      placeName: 'AzharPark'.tr(),
                      descriptionText: 'AzharParkAbout'.tr(),
                      openingHours: 'f9at10p'.tr(),
                      tickets: 'AzharParkTicket'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/6BcSqmUJ62LtQJFa6',
                    ),
                  ),
                ),
              );
            } else if (place == 'FamilyPark'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      imagePaths: [
                        'https://tourism-ar.com/wp-content/uploads/2020/08/%D8%AD%D8%AF%D9%8A%D9%82%D8%A9-%D8%A7%D9%84%D8%A3%D8%B3%D8%B1%D8%A9.jpg',
                        'https://www.egypttoday.com/siteimages/Larg/21154.jpg',
                      ],
                      placeName: 'FamilyPark'.tr(),
                      descriptionText: 'FamilyParkAbout'.tr(),
                      openingHours: 'f9at11p'.tr(),
                      tickets: 'FamilyParkTicket'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/r4Vwf2buQbebaQCaA',
                    ),
                  ),
                ),
              );
            } else if (place == 'IslandPark'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      imagePaths: [
                        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/06/4b/3f/8c/zamalek-gezira-island.jpg?w=1200&h=1200&s=1',
                      ],
                      placeName: 'IslandPark'.tr(),
                      descriptionText: 'IslandParkAbout'.tr(),
                      openingHours: 'f9at11p'.tr(),
                      tickets: 'EGP10'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/FxuUPFo2HmjwhJ5u6',
                    ),
                  ),
                ),
              );
            } else if (place == 'FlowerGarden'.tr()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      imagePaths: [
                        'https://cnn-arabic-images.cnn.io/cloudinary/image/upload/w_1920,c_scale,q_auto/cnnarabic/2020/01/22/images/145098.jpg',
                        'https://cnn-arabic-images.cnn.io/cloudinary/image/upload/w_1920,c_scale,q_auto/cnnarabic/2020/01/22/images/145093.jpg',
                        'https://cdn.elwatannews.com/watan/840x473/6686138801668968556.jpg',
                      ],
                      placeName: 'FlowerGarden'.tr(),
                      descriptionText: 'FlowerGardenAbout'.tr(),
                      openingHours: 'f9at3p'.tr(),
                      tickets: 'EGP5'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/gc1jjT1uMBmd4hfR7',
                    ),
                  ),
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacePageCategory(
                    place: PageModel(
                      imagePaths: [
                        'https://www.independentarabia.com/sites/default/files/styles/1368x911/public/article/mainimage/2022/11/18/650396-252737104.jpg?itok=OWTzWKPO',
                      ],
                      placeName: 'GizaZoo'.tr(),
                      descriptionText: 'GizaZooAbout'.tr(),
                      openingHours: 'f9at3p'.tr(),
                      tickets: 'EGP5'.tr(),
                      locationUrl: 'https://maps.app.goo.gl/QbUVn3sxQdGVKn4i9',
                    ),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
