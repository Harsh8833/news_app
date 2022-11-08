import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../Model/report_model.dart';
import '../Screen/article_detail.dart';
import '../Utils/common.dart';
import '../Utils/loader.dart';
import '../Utils/style.dart';
import '../Utils/url_constants.dart';

class InterView extends StatefulWidget {
  final List<ReportModel> positionLists;

  const InterView({Key? key, required this.positionLists}) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<InterView> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return widget.positionLists.isEmpty
        ? const CircularProgressIndicator()
        : Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.positionLists.isNotEmpty)
                      Text(
                        widget.positionLists[0].categoryName?.toUpperCase() ??
                            '',
                        style: TextStyle(fontSize: 18, color: darkGreyColor),
                      ),
                    heightSizedBox(6.0),
                    Row(
                      children: [
                        Container(
                          color: blueColor,
                          height: 2.5,
                          width: 50,
                        ),
                        Expanded(
                          child: Container(
                            color: greyColor,
                            margin: const EdgeInsets.only(right: 5.0),
                            height: 1,
                            // width: double.infinity,
                          ),
                        ),
                        Row(
                          children: List.generate(widget.positionLists.length,
                              (index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 2.0),
                              child: Icon(
                                Icons.circle,
                                color:
                                    _current == index ? blueColor : greyColor,
                                size: 11,
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 10),
                  height: 520,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) =>
                      setState(() => _current = index),
                ),
                items: widget.positionLists.map((report) {
                  return Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        onTap: () {
                          navigationPush(
                              context, ArticleDetail(slug: report.slug!));
                        },
                        child: Container(
                          decoration: boxDecoration.copyWith(
                              borderRadius: BorderRadius.circular(5)),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 20),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                            ),
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  width: double.infinity,
                                  height: 390,
                                  fit: BoxFit.cover,
                                  imageUrl:
                                      "${URLConstants.imageUrl}${report.image ?? ''}",
                                  placeholder: (context, url) =>
                                      const Loader(height: 150),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      heightSizedBox(10),
                                      Text(
                                        report.title ?? '',
                                        maxLines: 2,
                                        style: headingTS,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.access_time_outlined,
                                              color: greyColor,
                                              size: 17,
                                            ),
                                            widthSizedBox(4),
                                            Text(
                                              report.postedDate ?? '',
                                              style: authorNameTS,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // heightSizedBox(10.0),
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
