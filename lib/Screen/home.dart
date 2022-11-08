import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:news_app/Model/report_model.dart';

import '../Controller/home_controller.dart';
import '../Elements/image_widget.dart';
import '../Elements/imageslider.dart';
import '../Elements/interview.dart';
import '../Elements/report_widget.dart';
import '../Elements/youtube_frame.dart';
import '../Utils/common.dart';
import '../Utils/header_page.dart';
import '../Utils/helper.dart';
import '../Utils/loader.dart';
import '../Utils/url_constants.dart';
import 'category_articles.dart';
import 'videos.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends StateMVC<HomePage> {
  late HomeController model;

  _HomePageState() : super(HomeController()) {
    model = controller as HomeController;
  }

  DateTime now1 = DateTime.now();

  late DateTime currentBackPressTime = DateTime(now1.day - 1);

  Future<bool> onWillPop() async {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Tap again to close app');
      return Future.value(false);
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }

  @override
  void initState() {
    super.initState();
    model.getHomeData(context);
    model.getSettings(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: HeaderPage(
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: ImageSlider(imageList: model.sliders),
          ),
          if (model.digitalMagazines.isNotEmpty)
            MagazineImageWidget(
              magazine: model.digitalMagazines[0],
            ),
          if (model.homeGrid != null) ImageWidget(adsModel: model.homeGrid!),
          // heightSizedBox(20),
          Column(
            children: List.generate(
                model.tops.length > 2 ? 2 : model.tops.length, (index) {
              ReportModel report = model.tops[index];
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: HomeTopStoriesWidget(
                  report: report,
                ),
              );
            }),
          ),
          heightSizedBox(20),
          ReportHeading(
            heading: "VIDEOS",
            onTap: () => navigationPush(
                context, const VideosPage(/*videos: model.videos*/)),
          ),
          Column(
            children: List.generate(model.videos.length, (index) {
              return Column(
                children: [
                  heightSizedBox(20),
                  YouTubeFrame(video: model.videos[index]),
                ],
              );
            }),
          ),
          Column(
            children: List.generate(model.positions.length, (index) {
              PositionModel position = model.positions[index];
              if (position.positionLists[0].categoryName != 'Interviews') {
                return Column(
                  children: [
                    heightSizedBox(20),
                    ReportHeading(
                      heading: position.positionLists[0].categoryName
                              ?.toUpperCase() ??
                          '',
                      onTap: () => navigationPush(
                          context,
                          CategoryArticles(
                            categorySlug: convertTitleIntoSlug(
                                position.positionLists[0].categoryName ?? ''),
                          )),
                    ),
                    heightSizedBox(20),
                    Column(
                      children: List.generate(
                        position.positionLists.length > 4
                            ? 4
                            : position.positionLists.length,
                        (i) => Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: ReportWidget(
                              index: i, article: position.positionLists[i]),
                        ),
                      ),
                    ),
                    if (index == 1 || index == 3 || index == 5)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: InkWell(
                          onTap: () {
                            launchURL(index == 1
                                ? model.home1?.link ?? ''
                                : index == 3
                                    ? model.home2?.link ?? ''
                                    : model.home3?.link ?? '');
                            // launchURL(adsModel.link ?? '');
                          },
                          child: CachedNetworkImage(
                            imageUrl:
                                "${URLConstants.imageUrl}${index == 1 ? model.home1?.file ?? '' : index == 3 ? model.home2?.file ?? '' : model.home3?.file ?? ''}",
                            placeholder: (context, url) =>
                                const Loader(height: 50),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    heightSizedBox(20),
                    InterView(positionLists: position.positionLists),
                  ],
                );
              }
            }),
          ),
          Column(
            children: List.generate(model.homeLastList.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: ImageWidget(adsModel: model.homeLastList[index]),
              );
            }),
          ),
          if (model.homeBottom != null)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 20.0),
              child: CachedNetworkImage(
                imageUrl:
                    "${URLConstants.imageUrl}${model.homeBottom?.file ?? ''}",
                placeholder: (context, url) => const Loader(height: 50),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          heightSizedBox(20),
        ]),
      ),
    );
  }
}
