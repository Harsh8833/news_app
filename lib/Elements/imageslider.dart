import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Model/report_model.dart';
import 'package:news_app/Screen/article_detail.dart';
import 'package:news_app/Utils/common.dart';
import 'package:news_app/Utils/url_constants.dart';

import '../Screen/category_articles.dart';
import '../Utils/loader.dart';
import '../Utils/style.dart';

class ImageSlider extends StatefulWidget {
  final List<ReportModel> imageList;

  const ImageSlider({Key? key, required this.imageList}) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  // int _current = 0;

  @override
  Widget build(BuildContext context) {
    return widget.imageList.isEmpty
        ? const Loader(height: 350)
        : Column(
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 10),
                  height: 360,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    // print('asdfghjsdfg');
                    // print(widget.imageList[index].slug);
                    // print(convertInSlug(widget.imageList[index].title ?? ""));
                    // setState(() => _current = index);
                  },
                ),
                items: widget.imageList.map((category) {
                  return Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        onTap: () {
                          navigationPush(context,
                              ArticleDetail(slug: category.slug ?? ''));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          elevation: 1,
                          margin: const EdgeInsets.only(
                              top: 10, bottom: 5, left: 5, right: 5),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                CachedNetworkImage(
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                  imageUrl:
                                      "${URLConstants.imageUrl}${category.image ?? ''}",
                                  placeholder: (context, url) =>
                                      const Loader(height: 150),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                                // Container(
                                //   width: double.infinity,
                                //   height: double.infinity,
                                //   decoration: const BoxDecoration(
                                //       gradient: LinearGradient(
                                //         begin: Alignment.topCenter,
                                //         end: Alignment.bottomCenter,
                                //         colors: [
                                //           transparent,
                                //           transparent,
                                //           transparent,
                                //           blackColor,
                                //           blackColor
                                //         ],
                                //       )),
                                // ),
                                Container(
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      transparent,
                                      blackColor,
                                      blackColor,
                                      blackColor,
                                      blackColor
                                    ],
                                  )),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 25,
                                        // width: 100,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: blueColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10)),
                                          onPressed: () => navigationPush(
                                              context,
                                              CategoryArticles(
                                                  categorySlug:
                                                      convertTitleIntoSlug(
                                                          category.categoryName ??
                                                              ''))),
                                          child: const Text(
                                            'LEAD STORY',
                                            style: TextStyle(fontSize: 13),
                                          ),
                                        ),
                                      ),
                                      heightSizedBox(10),
                                      Text(
                                        category.title ?? '',
                                        style: primaryHeadingTS.copyWith(
                                            fontSize: 22),
                                      ),
                                      heightSizedBox(8),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.access_time_outlined,
                                            color: greyColor,
                                            size: 17,
                                          ),
                                          widthSizedBox(4),
                                          Text(
                                            category.postedDate ?? '',
                                            style: primarySmallAuthorNameTS,
                                          ),
                                        ],
                                      ),
                                      heightSizedBox(25),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ],
          );
  }
}
