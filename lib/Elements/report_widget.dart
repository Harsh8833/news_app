import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:news_app/Screen/article_detail.dart';

import '../Model/report_model.dart';
import '../Utils/common.dart';
import '../Utils/loader.dart';
import '../Utils/style.dart';
import '../Utils/url_constants.dart';

class ReportWidget extends StatelessWidget {
  final ReportModel article;

  final int? index;

  const ReportWidget({Key? key, this.index, required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          navigationPush(context, ArticleDetail(slug: article.slug ?? '')),
      child: Container(
        width: double.infinity,
        decoration:
            boxDecoration.copyWith(borderRadius: BorderRadius.circular(5)),
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(5),
            topLeft: Radius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (index == 0)
                CachedNetworkImage(
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  imageUrl: "${URLConstants.imageUrl}${article.image ?? ''}",
                  placeholder: (context, url) => const Loader(height: 150),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    heightSizedBox(10),
                    Text(
                      article.title ?? '',
                      style: index == 0 ? headingTS : smallHeadingTS,
                    ),
                    heightSizedBox(10),
                    Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6.0),
                          child: Icon(
                            Icons.access_time_outlined,
                            color: greyColor,
                            size: index == 0 ? 17 : 15,
                          ),
                        ),
                        widthSizedBox(4),
                        Text(
                          article.postedDate ?? '',
                          style: index == 0 ? authorNameTS : smallAuthorNameTS,
                        ),
                        widthSizedBox(7.0),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.person_outline,
                              color: greyColor,
                              size: index == 0 ? 17 : 15,
                            ),
                            widthSizedBox(4),
                            Flexible(
                              child: Text(
                                article.postedBy ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: index == 0
                                    ? authorNameTS
                                    : smallAuthorNameTS,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    heightSizedBox(7.0),
                    // if (index == 0)
                    //   Padding(
                    //     padding: const EdgeInsets.only(top: 10.0),
                    //     child: Text(
                    //       article.descriptionInString ?? '',
                    //       maxLines: 3,
                    //       softWrap: true,
                    //       overflow: TextOverflow.ellipsis,
                    //       style: smallDescriptionTS,
                    //     ),
                    //   ),
                    if (index == 0)
                      Text(
                        article.descriptionInString1?.trimLeft() ?? '',
                        maxLines: 3,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: smallDescriptionTS,
                      ),

                    // if (index == 0)
                    //   SizedBox(
                    //     height: 100,
                    //     child: Html(
                    //       data: article.description?.toString().trim() ?? '',
                    //       style: {
                    //         '#': Style(
                    //           fontSize: const FontSize(14),
                    //           maxLines: 3,
                    //           fontWeight: FontWeight.normal,
                    //           textOverflow: TextOverflow.ellipsis,
                    //         ),
                    //       },
                    //     ),
                    //   ),
                  ],
                ),
              ),
              heightSizedBox(10.0),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryReportWidget extends StatelessWidget {
  final ReportModel article;

  const CategoryReportWidget({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          navigationPush(context, ArticleDetail(slug: article.slug ?? "")),
      child: Container(
        decoration:
            boxDecoration.copyWith(borderRadius: BorderRadius.circular(5)),
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(5),
            topLeft: Radius.circular(5),
          ),
          child: Column(
            children: [
              CachedNetworkImage(
                width: double.infinity,
                height: getHeight(context) / 2.9,
                fit: BoxFit.cover,
                imageUrl: "${URLConstants.imageUrl}${article.image ?? ''}",
                placeholder: (context, url) => const Loader(height: 150),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heightSizedBox(10),
                    Text(
                      article.title ?? '',
                      style: headingTS,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Wrap(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 6.0),
                            child: Icon(
                              Icons.access_time_outlined,
                              color: greyColor,
                              size: 17,
                            ),
                          ),
                          widthSizedBox(4),
                          Text(
                            article.postedDate ?? '',
                            style: authorNameTS,
                          ),
                          widthSizedBox(7),
                          Row(
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
                                  "By: ${article.postedBy ?? ''}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: authorNameTS,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    heightSizedBox(8.0),
                    Text(
                      article.descriptionInString1?.trimLeft() ?? '',
                      maxLines: 5,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: smallDescriptionTS,
                    ),
                    // SizedBox(
                    //   height: 140,
                    //   child: Html(
                    //     data: article?.description ?? '',
                    //     style: {
                    //       '#': Style(
                    //         fontSize: const FontSize(16),
                    //         maxLines: 6,
                    //         fontWeight: FontWeight.normal,
                    //         textOverflow: TextOverflow.ellipsis,
                    //       ),
                    //     },
                    //     // style: {
                    //     //   "style": Style(fontSize: const FontSize(20.0))
                    //     // },
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 10.0),
                    //   child: Text(
                    //     article?.description ?? '',
                    //     maxLines: 6,
                    //
                    //     overflow: TextOverflow.ellipsis,
                    //     softWrap: true,
                    //     // "Lorem ipsum, dolor sit consectetur adipisicing elit. Dignissimos, excepturi cumque adipisci",
                    //     style: TextStyle(fontSize: 16, color: darkGreyColor),
                    //   ),
                    // ),
                  ],
                ),
              ),
              heightSizedBox(10.0),
            ],
          ),
        ),
      ),
    );
  }
}

class ReportHeading extends StatelessWidget {
  final String heading;
  final VoidCallback? onTap;

  const ReportHeading({Key? key, required this.heading, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                heading,
                style: const TextStyle(
                    fontSize: 16,
                    color: blackColor,
                    fontWeight: FontWeight.bold),
              ),
              if (onTap != null)
                InkWell(
                  onTap: onTap,
                  child: Text(
                    "SEE ALL",
                    style: TextStyle(fontSize: 12, color: darkGreyColor),
                  ),
                ),
            ],
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
                  height: 1,
                ),
              ),
              if (onTap != null)
                Container(
                  color: blueColor.withOpacity(0.5),
                  height: 2.5,
                  width: 50,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
