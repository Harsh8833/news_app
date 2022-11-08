import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:news_app/Screen/article_detail.dart';
import 'package:news_app/Screen/category_articles.dart';
import 'package:news_app/Screen/digital_magazines.dart';
import 'package:news_app/Utils/base_controller.dart';
import 'package:news_app/Utils/helper.dart';
import 'package:news_app/Utils/url_constants.dart';

import '../Elements/drawer.dart';
import '../Model/report_model.dart';
import '../Screen/home.dart';
import '../Utils/common.dart';
import '../Utils/my_custom_page.dart';
import '../Utils/style.dart';
import 'loader.dart';

class HeaderPage extends StatefulWidget {
  final Widget body;
  final ScrollController? scrollController;

  const HeaderPage({Key? key, required this.body, this.scrollController})
      : super(key: key);

  @override
  _HeaderPageState createState() => _HeaderPageState();
}

class _HeaderPageState extends StateMVC<HeaderPage> {
  late BaseController model;

  _HeaderPageState() : super(BaseController()) {
    model = controller as BaseController;
  }

  // List<String> years = <String>[
  //   'Feb 2022',
  //   'Jan 2022',
  //   'Dec 2021',
  //   'Nov 2021',
  //   'Oct 2021',
  //   'Sep 2021',
  // ];

  @override
  void initState() {
    super.initState();
    model.getSettings(context);
    model.getMagazines(context);
  }

  String? searchKeyWord;

  // final bool _showTrackOnHover = false;
  // final bool _isAlwaysShown = true;

  @override
  Widget build(BuildContext context) {
    return MyCustomPage(
      drawer: model.categories.isEmpty
          ? null
          : DrawerWidget(categories: model.categories),
      scaffoldKey: model.scaffoldKey,
      // widthSizedBox(10),

      isAppBar: false,
      body: ListView(
        controller: widget.scrollController,
        children: [
          Container(
            height: 60,
            color: blueColor,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text("In The News", style: primaryAuthorNameTS),
                ),
                Container(
                  color: primaryColor,
                  width: 1,
                  height: 60,
                ),
                Expanded(
                  // width: getWidth(context) / 1.6,
                  child: CarouselSlider(
                    items: model.breakingList.map((i) {
                      return Builder(builder: (BuildContext context) {
                        return GestureDetector(
                          child: Stack(
                            children: <Widget>[
                              Marquee(
                                text: i.title?.trim() ?? '',
                                style: primarySmallAuthorNameTS,
                                // scrollAxis: Axis.horizontal,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                blankSpace: 70.0,
                                velocity: 100.0,
                                // pauseAfterRound: const Duration(seconds: 1),
                                startPadding: 10.0,
                                accelerationDuration:
                                    const Duration(seconds: 1),
                                accelerationCurve: Curves.linear,
                                decelerationDuration:
                                    const Duration(seconds: 3),
                                decelerationCurve: Curves.easeOut,
                              ),

                              // Align(
                              //     alignment: Alignment.topCenter,
                              //     child: Text(
                              //       i.title ?? '',
                              //       style: const TextStyle(
                              //           fontSize: 30,
                              //           color: Colors.white,
                              //           fontWeight: FontWeight.bold),
                              //     ))
                            ],
                          ),
                          onTap: () {
                            navigationPush(
                                context, ArticleDetail(slug: i.slug ?? ''));
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => HomePage()),
                            // );
                          },
                        );
                      });
                    }).toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 10),
                      height: getWidth(context),
                      viewportFraction: 1,
                      // aspectRatio: 0,
                    ),
                  ),
                ),
                //     Expanded(
                //       // width: getWidth(context) / 1.6,
                //       child: Scrollbar(
                //         isAlwaysShown: _isAlwaysShown,
                //         showTrackOnHover: _showTrackOnHover,
                //         hoverThickness: 50.0,
                //         child: ListView.builder(
                //           itemCount: 20,
                //           scrollDirection: Axis.horizontal,
                //           itemBuilder: (context, index) => MyItem(index),
                //         ),
                //       ), /*Marquee(
                //   text: 'Some sample text that takes some space.',
                //   style: const TextStyle(fontSize: 17),
                //   // scrollAxis: Axis.horizontal,
                //   // crossAxisAlignment: CrossAxisAlignment.center,
                //   blankSpace: 70.0,
                //   velocity: 100.0,
                //   // pauseAfterRound: const Duration(seconds: 1),
                //   startPadding: 10.0,
                //   accelerationDuration: const Duration(seconds: 1),
                //   accelerationCurve: Curves.linear,
                //   decelerationDuration: const Duration(seconds: 3),
                //   decelerationCurve: Curves.easeOut,
                // ),*/
                //     )
              ],
            ),
          ),
          const Divider(height: 1),
          Container(
            height: 60.0,
            color: blueColor,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => model.scaffoldKey.currentState!.openDrawer(),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(5)),
                    padding: const EdgeInsets.all(5),
                    child: const Icon(
                      Icons.filter_list_rounded,
                      color: primaryColor,
                    ),
                  ),
                ),
                widthSizedBox(10),
                InkWell(
                  onTap: () =>
                      navigationPush(context, const DigitalMagazines()),
                  child: const Text('Digital Magazines',
                      style: TextStyle(fontSize: 17, color: primaryColor)),
                ),
                const Expanded(child: SizedBox()),
                PopupMenuButton<MagazineModel>(
                  child: Row(
                    children: [
                      Text(model.selectedMenu?.magazineTitle ?? '',
                          style: const TextStyle(
                              color: primaryColor, fontSize: 20)),
                      const Icon(Icons.keyboard_arrow_down, color: primaryColor)
                    ],
                  ),
                  onSelected: (MagazineModel item) {
                    setState(() {
                      model.selectedMenu = item;
                    });
                    launchURL(
                        "${URLConstants.imageUrl}images/upload/${model.selectedMenu?.magazinePath}");
                    // launchURL(model.selectedMenu?.magazinePath ?? '');
                  },
                  itemBuilder: (BuildContext context) =>
                      List.generate(model.magazineYears.length, (index) {
                    return PopupMenuItem(
                      value: model.magazineYears[index],
                      child:
                          Text(model.magazineYears[index].magazineTitle ?? ''),
                    );
                  }),
                ),
              ],
            ),
          ),
          if (model.homeTop != null)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 20.0),
              child: InkWell(
                onTap: () {
                  launchURL(model.homeTop?.link ?? '');
                },
                child: CachedNetworkImage(
                  imageUrl:
                      "${URLConstants.imageUrl}${model.homeTop?.file ?? ''}",
                  placeholder: (context, url) => const Loader(height: 50),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          Container(
            decoration: boxDecoration,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Row(
              children: [
                InkWell(
                  onTap: () => navigationRemoveUntil(context, const HomePage()),
                  child: Image.asset(
                    "Assets/Images/smelogo.png",
                    width: getWidth(context) / 3.5,
                  ),
                ),
                widthSizedBox(40.0),
                Expanded(
                  child: Container(
                    height: 42,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    decoration: fieldDecoration,
                    child: TextField(
                      controller: model.searchCon,
                      cursorColor: Colors.black,
                      maxLines: 1,
                      maxLength: 40,
                      onChanged: (v) {
                        searchKeyWord = v;
                      },
                      decoration: InputDecoration(
                        hintText: "Search here..",
                        border: InputBorder.none,
                        suffixIcon: InkWell(
                            onTap: () {
                              navigationPush(
                                  context,
                                  CategoryArticles(
                                    keyWord: searchKeyWord,
                                  ));
                            },
                            child: const Icon(Icons.search, color: greyColor)),
                        suffixIconConstraints:
                            const BoxConstraints(minWidth: 0, minHeight: 0),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: -1),
                        counterText: "",
                        hintStyle:
                            const TextStyle(fontSize: 14.0, color: greyColor),
                      ),
                      // onChanged: (input) {},
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Add body
          widget.body,
        ],
      ),
    );
  }
}

// class MyItem extends StatelessWidget {
//   final int index;
//
//   const MyItem(this.index, {Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final color = Colors.primaries[index % Colors.primaries.length];
//     final hexRgb = color.shade500.toString().substring(10, 16).toUpperCase();
//     return Text('Material Color #${index + 1}');
//   }
// }
