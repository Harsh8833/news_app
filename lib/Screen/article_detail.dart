import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:news_app/Model/comment_model.dart';
import 'package:news_app/Utils/helper.dart';

import '../Controller/article_details_controller.dart';
import '../Elements/buttons.dart';
import '../Elements/image_widget.dart';
import '../Elements/input_field.dart';
import '../Elements/report_widget.dart';
import '../Model/report_model.dart';
import '../Utils/common.dart';
import '../Utils/header_page.dart';
import '../Utils/inpute_validation.dart';
import '../Utils/loader.dart';
import '../Utils/style.dart';
import '../Utils/url_constants.dart';
import 'category_articles.dart';

class ArticleDetail extends StatefulWidget {
  final String slug;

  const ArticleDetail({Key? key, required this.slug}) : super(key: key);

  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends StateMVC<ArticleDetail> {
  late ArticleDetailsController model;

  _ArticleDetailState() : super(ArticleDetailsController()) {
    model = controller as ArticleDetailsController;
  }

  @override
  void initState() {
    super.initState();
    model.getArticleDetailsBySlug(context, widget.slug);
    model.visitorCount(context, widget.slug);
    model.getSettings(context);
    model.getDigitalMagazinesData(context);
    model.getRecentPost(context);
  }

  @override
  Widget build(BuildContext context) {
    return HeaderPage(
      body: Form(
        key: model.formKey,
        child: Column(children: [
          heightSizedBox(20.0),
          model.articleDetails.id == null
              ? Loader(height: getHeight(context))
              : Container(
                  decoration: boxDecoration.copyWith(
                      borderRadius: BorderRadius.circular(5)),
                  margin:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.articleDetails.title ?? '',
                        style: headingTS,
                      ),
                      heightSizedBox(10),
                      Wrap(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 6.0),
                            child: Icon(
                              Icons.access_time_outlined,
                              color: greyColor,
                              size: 17,
                            ),
                          ),
                          widthSizedBox(3),
                          Text(
                            model.articleDetails.postedDate ?? '',
                            style: authorNameTS,
                          ),
                          widthSizedBox(8.0),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              style: authorNameTS,
                              children: [
                                const WidgetSpan(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 0.0),
                                    child: Icon(
                                      Icons.person_outline,
                                      color: greyColor,
                                      size: 18,
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "By: ${model.articleDetails.postedBy ?? ''}",
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      heightSizedBox(10),
                      CachedNetworkImage(
                        width: double.infinity,
                        // height: 250,
                        fit: BoxFit.contain,
                        imageUrl:
                            "${URLConstants.imageUrl}${model.articleDetails.image ?? ''}",
                        placeholder: (context, url) =>
                            const Loader(height: 150),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      heightSizedBox(20),
                      Html(
                        data: model.articleDetails.description ?? '',
                      ),
                      heightSizedBox(20),
                      // https://staging.smeworld.asia/indian-economy-ruined-by-praise-than-saved-by-criticism
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          shareBtn(
                            Icons.mail_outline,
                            const Color(0XFF7F7F7F),
                            "mailto:?subject=SME Worid&body=https://staging.smeworld.asia/${widget.slug}",
                          ),
                          shareBtn(
                            Icons.whatsapp_outlined,
                            const Color(0XFF25D366),
                            Platform.isAndroid
                                ? "https://wa.me/?text=https://staging.smeworld.asia/${widget.slug}"
                                : "https://api.whatsapp.com/send?text=https://staging.smeworld.asia/${widget.slug}",
                          ),
                          shareBtn(
                            Icons.telegram_outlined,
                            const Color(0XFF37AEE2),
                            /* "https://telegram.me/<telegram_username>"*/
                            "https://telegram.me/share/url?url=https://staging.smeworld.asia/${widget.slug}",
                          ),
                          shareBtn(
                            FontAwesomeIcons.facebookF,
                            const Color(0XFF3B5998),
                            'https://www.facebook.com/?text=https://staging.smeworld.asia/${widget.slug}',
                          ),
                          shareBtn(
                            FontAwesomeIcons.twitter,
                            const Color(0XFF37AEE2),
                            "https://twitter.com/intent/tweet?text=https://staging.smeworld.asia/${widget.slug}",
                          ),
                          shareBtn(
                            FontAwesomeIcons.pinterest,
                            const Color(0XFFCB2128),
                            "https://pinterest",
                          ),
                          shareBtn(
                            FontAwesomeIcons.redditAlien,
                            const Color(0XFFFF4500),
                            "",
                          ),
                          shareBtn(
                            FontAwesomeIcons.tumblr,
                            const Color(0XFF2C4762),
                            "",
                          ),
                        ],
                      ),
                      heightSizedBox(20),
                      if (model.authorDetails.id != null)
                        Container(
                          decoration: boxDecoration.copyWith(
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(35),
                                    child: CachedNetworkImage(
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.fill,
                                      imageUrl:
                                          "${URLConstants.imageUrl}images/upload/AuthorImages/${model.authorDetails.authorImage ?? ''}",
                                      placeholder: (context, url) =>
                                          const Loader(height: 60),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                  widthSizedBox(15.0),
                                  Flexible(
                                    child: Text(
                                      model.authorDetails.author ?? '',
                                      style: TextStyle(
                                          fontSize: 20, color: darkGreyColor),
                                    ),
                                  ),
                                ],
                              ),
                              heightSizedBox(7.0),
                              Text(
                                model.authorDetails.desc ?? '',
                                style: smallDescriptionTS,
                              ),
                            ],
                          ),
                        ),
                      heightSizedBox(20),
                      Row(
                        children: [
                          Expanded(
                              child: BigButton(
                            title: 'PREVIOUS',
                            onTap: () => navigationPush(context,
                                ArticleDetail(slug: model.prevSlug ?? '')),
                          )),
                          widthSizedBox(15.0),
                          Expanded(
                              child: BigButton(
                            title: 'NEXT',
                            onTap: () => navigationPush(context,
                                ArticleDetail(slug: model.nextSlug ?? '')),
                          )),
                        ],
                      ),
                      heightSizedBox(20),
                    ],
                  ),
                ),
          heightSizedBox(20.0),
          const ReportHeading(heading: "LEAVE A COMMENT"),
          heightSizedBox(20.0),
          Container(
            decoration:
                boxDecoration.copyWith(borderRadius: BorderRadius.circular(5)),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TextStyle(fontSize: 17, color: darkGreyColor),
                ),
                heightSizedBox(3.0),
                EditTextField(
                  validator: validateName,
                  onChanged: (v) => model.comment.commentName = v,
                  hint: 'Jhon',
                ),
                heightSizedBox(15.0),
                Text(
                  'Email',
                  style: TextStyle(fontSize: 17, color: darkGreyColor),
                ),
                heightSizedBox(3.0),
                EditTextField(
                  validator: validateEmail,
                  onChanged: (v) => model.comment.commentEmail = v,
                  hint: 'jhon@gmail.com',
                ),
                heightSizedBox(15.0),
                Text(
                  'Comments',
                  style: TextStyle(fontSize: 17, color: darkGreyColor),
                ),
                heightSizedBox(3.0),
                EditTextField(
                  validator: validateDec,
                  onChanged: (v) => model.comment.commentContent = v,
                  maxLines: 5,
                  hint: 'this is comment...',
                ),
                heightSizedBox(20.0),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: getWidth(context) / 2,
                    child: BigButton(
                      title: 'SUBMIT',
                      onTap: () => model.createComment(
                          context, model.articleDetails.id ?? 0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          heightSizedBox(20.0),
          const ReportHeading(heading: "COMMENTS"),
          heightSizedBox(20.0),
          Container(
            width: double.infinity,
            decoration:
                boxDecoration.copyWith(borderRadius: BorderRadius.circular(5)),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.all(20.0),
            child: model.commentList.isEmpty
                ? Text(
                    'No comments found!',
                    style: TextStyle(fontSize: 17, color: darkGreyColor),
                  )
                : Column(
                    children: List.generate(model.commentList.length, (index) {
                      CommentModel comment = model.commentList[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(15.0),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle, color: greyColor),
                                  child: Text(
                                    comment.commentName!.substring(0, 1),
                                    style: headingTS,
                                  ),
                                ),
                                widthSizedBox(10.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        comment.commentName!,
                                        style: headingTS,
                                      ),
                                      heightSizedBox(6.0),
                                      Text(
                                        comment.commentEmail!.replaceRange(
                                            1,
                                            comment.commentEmail!.indexOf("@") -
                                                1,
                                            getStars(comment.commentEmail!
                                                    .indexOf("@") -
                                                2)),
                                        style: smallDescriptionTS,
                                      ),
                                      heightSizedBox(6.0),
                                      Text(
                                        comment.commentContent!,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
                  ),
          ),
          heightSizedBox(20.0),
          const ReportHeading(heading: "RECENT POSTS"),
          heightSizedBox(20.0),
          Column(
            children: List.generate(
              model.recentPostList.length > 5 ? 5 : model.recentPostList.length,
              (index) {
                ReportModel report = model.recentPostList[index];

                return Container(
                  decoration: boxDecoration.copyWith(
                      borderRadius: BorderRadius.circular(5)),
                  margin:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        report.title ?? '',
                        maxLines: 2,
                        style: smallHeadingTS,
                      ),
                      heightSizedBox(10),
                      Wrap(
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
                            report.postedDate ?? '',
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
                                  "By: ${report.postedBy ?? ''}",
                                  maxLines: 1,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: authorNameTS,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          heightSizedBox(15.0),
          if (model.digitalMagazines.isNotEmpty)
            MagazineImageWidget(
              magazine: model.digitalMagazines[0],
            ),
          heightSizedBox(15.0),
          Column(
            children: List.generate(model.homeLastList.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: ImageWidget(adsModel: model.homeLastList[index]),
              );
            }),
          ),
          heightSizedBox(20.0),
          const ReportHeading(heading: "CATEGORIES"),
          heightSizedBox(20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Wrap(
              children: List.generate(
                model.categories.length,
                (index) => InkWell(
                  onTap: () => navigationPush(
                      context,
                      CategoryArticles(
                          categoryId: model.categories[index].id ?? 0)),
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      margin: const EdgeInsets.only(right: 10, bottom: 10),
                      decoration: boxDecoration.copyWith(
                          borderRadius: BorderRadius.circular(3)),
                      child: Text(
                        model.categories[index].categoryName ?? '',
                        style: TextStyle(fontSize: 16, color: darkGreyColor),
                      )),
                ),
              ),
            ),
          ),
          heightSizedBox(20.0),
          const ReportHeading(heading: "FOLLOW US"),
          heightSizedBox(20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "Assets/Images/facebook_backgound.png",
                    width: 25,
                    height: 25,
                    color: blackColor,
                  ),
                ),
                widthSizedBox(15.0),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "Assets/Images/twitter-sign_backgound.png",
                    width: 25,
                    height: 25,
                    color: blackColor,
                  ),
                ),
                widthSizedBox(15.0),
                InkWell(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      "Assets/Images/google-plus_backgound.png",
                      width: 25,
                      height: 25,
                      color: blackColor,
                    ),
                  ),
                ),
                widthSizedBox(15.0),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "Assets/Images/linkedin_backgound.png",
                    width: 25,
                    height: 25,
                    color: blackColor,
                  ),
                ),
                widthSizedBox(15.0),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "Assets/Images/youtube.png",
                    width: 29,
                    height: 29,
                    color: blackColor,
                  ),
                ),
              ],
            ),
          ),
          heightSizedBox(20.0),
        ]),
      ),
    );
  }

  Widget shareBtn(IconData icon, Color color, String url, {int? i}) {
    return InkWell(
      onTap: () {
        // if (i == null) {
        launchURL(url);
        // } else {
        //   _launchSocial(url, "");
        // }
      },
      child: Container(
        height: 32,
        width: 32,
        color: color,
        child: Icon(
          icon,
          color: primaryColor,
          size: 17,
        ),
      ),
    );
  }

  // void _launchSocial(String url, String fallbackUrl) async {
  //   // Don't use canLaunch because of fbProtocolUrl (fb://)
  //   try {
  //     bool launched =
  //         await launch(url, forceSafariVC: false, forceWebView: false);
  //     if (!launched) {
  //       await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
  //     }
  //   } catch (e) {
  //     await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
  //   }
  // }
}

String getStars(int l) {
  String starts = '';
  for (int i = 0; i < l; i++) {
    starts += '*';
  }
  return starts;
}
