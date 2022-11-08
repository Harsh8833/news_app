import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../Model/report_model.dart';
import '../Model/setting_models.dart';
import '../Screen/article_detail.dart';
import '../Screen/category_articles.dart';
import '../Utils/common.dart';
import '../Utils/helper.dart';
import '../Utils/loader.dart';
import '../Utils/style.dart';
import '../Utils/url_constants.dart';

class ImageWidget extends StatelessWidget {
  final AdsModel adsModel;

  const ImageWidget({Key? key, required this.adsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: InkWell(
        onTap: () => launchURL(adsModel.link ?? ''),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          child: CachedNetworkImage(
            width: double.infinity,
            fit: BoxFit.cover,
            imageUrl: "${URLConstants.imageUrl}${adsModel.file ?? ''}",
            placeholder: (context, url) => const Loader(height: 150),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}

class MagazineImageWidget extends StatelessWidget {
  final MagazineModel magazine;

  const MagazineImageWidget({Key? key, required this.magazine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: getHeight(context) / 1.8,
      padding: const EdgeInsets.fromLTRB(15, 00, 15, 20),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CachedNetworkImage(
                  width: double.infinity,
                  // height: double.infinity,
                  fit: BoxFit.contain,
                  imageUrl:
                      "${URLConstants.imageUrl}images/upload/${magazine.imagePath ?? ''}",
                  placeholder: (context, url) => const Loader(height: 150),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                // Container(
                //   width: double.infinity,
                //   height: 80,
                //   decoration: BoxDecoration(
                //     gradient: LinearGradient(
                //       begin: Alignment.topCenter,
                //       end: Alignment.bottomCenter,
                //       colors: [transparent, blackColor.withOpacity(0.8)],
                //     ),
                //   ),
                // ),
              ],
            ),
            Transform.rotate(
              angle: 0.8,
              transformHitTests: false,
              origin: const Offset(0, 65),
              child: Container(
                color: redColor,
                width: 175,
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        magazine.magazineMonth?.toUpperCase() ?? '',
                        style: primarySmallAuthorNameTS.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 30,
              child: SizedBox(
                height: 25,
                // width: 125,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: blueColor,
                      padding: const EdgeInsets.symmetric(horizontal: 10)),
                  onPressed: () => launchURL(
                      "${URLConstants.imageUrl}images/upload/${magazine.magazinePath}"),
                  child: const Text(
                    "DOWNLOAD NOW",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomeTopStoriesWidget extends StatelessWidget {
  final ReportModel report;

  const HomeTopStoriesWidget({Key? key, required this.report})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigationPush(context, ArticleDetail(slug: report.slug ?? ''));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        height: 330,
        decoration: boxDecoration.copyWith(
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CachedNetworkImage(
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                imageUrl: "${URLConstants.imageUrl}${report.image ?? ''}",
                placeholder: (context, url) => const Loader(height: 150),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              // Container(
              //   width: double.infinity,
              //   height: double.infinity,
              //   decoration: const BoxDecoration(
              //     gradient: LinearGradient(
              //       begin: Alignment.topCenter,
              //       end: Alignment.bottomCenter,
              //       colors: [
              //         transparent,
              //         transparent,
              //         transparent,
              //         blackColor,
              //         blackColor
              //       ],
              //     ),
              //   ),
              // ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 20),
                    child: SizedBox(
                      height: 25,
                      // width: 108,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: blueColor,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10)),
                        onPressed: () {
                          navigationPush(
                              context,
                              CategoryArticles(
                                  categorySlug: convertTitleIntoSlug(
                                      report.categoryName ?? '')));
                        },
                        child: Text(
                          report.categoryName?.toUpperCase() ?? '',
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox.shrink()),
                  Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      // stops: [0.1, 05],
                      colors: [
                        transparent,
                        // transparent,
                        blackColor,
                        blackColor,
                        blackColor,
                        blackColor,
                        blackColor
                      ],
                    )),
                    padding: const EdgeInsets.fromLTRB(
                        20, 00, 20, 25 /*horizontal: 20, vertical: 25*/),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            report.title ?? '',
                            style: primaryHeadingTS,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Wrap(
                            children: [
                              const Icon(
                                Icons.access_time_outlined,
                                color: greyColor,
                                size: 17,
                              ),
                              widthSizedBox(4),
                              Text(
                                report.postedDate ?? '',
                                style: primarySmallAuthorNameTS,
                              ),
                              widthSizedBox(7.0),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.person_outline,
                                    color: greyColor,
                                    size: 17,
                                  ),
                                  widthSizedBox(4),
                                  Flexible(
                                    child: Text(
                                      'By: ${report.postedBy ?? ''}',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      style: smallAuthorNameTS,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
