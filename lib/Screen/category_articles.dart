import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:news_app/Model/report_model.dart';
import 'package:news_app/Screen/article_detail.dart';
import 'package:news_app/Utils/common.dart';
import 'package:news_app/Utils/loader.dart';

import '../Controller/home_controller.dart';
import '../Elements/image_widget.dart';
import '../Elements/report_widget.dart';
import '../Utils/header_page.dart';
import '../Utils/style.dart';

class CategoryArticles extends StatefulWidget {
  // final String categoryType;
  final int? categoryId;
  final String? categorySlug;
  final String? keyWord;

  const CategoryArticles(
      {Key? key, this.categorySlug, this.keyWord, this.categoryId})
      : super(key: key);

  @override
  _CategoryArticlesState createState() => _CategoryArticlesState();
}

class _CategoryArticlesState extends StateMVC<CategoryArticles> {
  late HomeController model;

  _CategoryArticlesState() : super(HomeController()) {
    model = controller as HomeController;
  }

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if (widget.categoryId != null) {
      model.gatArticlesByCategoryId(context, widget.categoryId, model.page);
    } else if (widget.categorySlug != null) {
      model.gatArticlesByCategorySlug(context, widget.categorySlug, model.page);
    } else if (widget.keyWord != null) {
      model.gatArticlesByKeyWord(context, widget.keyWord, model.page);
    }
    model.getRecentPost(context);
    model.getHomeData(context);
    model.getSettings(context);
  }

  @override
  Widget build(BuildContext context) {
    return HeaderPage(
      scrollController: scrollController,
      body: Column(
        children: [
          heightSizedBox(20.0),
          if (widget.keyWord != null)
            ReportHeading(heading: widget.keyWord?.toUpperCase() ?? '')
          else if (model.articlesList.isNotEmpty)
            ReportHeading(
                heading:
                    model.articlesList[0].categoryName?.toUpperCase() ?? ''),
          heightSizedBox(20.0),
          model.articlesList.isEmpty && !model.showError
              ? Loader(height: getHeight(context) / 3)
              : model.articlesList.isEmpty && model.showError
                  ? SizedBox(
                      height: 200,
                      child: Text("No articles found!", style: descriptionTS),
                    )
                  : Column(
                      children: List.generate(
                        model.articlesList.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: CategoryReportWidget(
                              article: model.articlesList[index]),
                        ),
                      ),
                    ),
          if (model.totalPage > 1)
            Container(
              height: 50,
              decoration: boxDecoration.copyWith(
                  borderRadius: BorderRadius.circular(5)),
              margin: const EdgeInsets.fromLTRB(15, 20, 15, 00),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: List.generate(model.totalPage, (index) {
                  return InkWell(
                    onTap: () async {
                      setState(() => model.page = index);
                      if (widget.categoryId != null) {
                        model.gatArticlesByCategoryId(
                            context, widget.categoryId, model.page);
                      } else if (widget.categorySlug != null) {
                        model.gatArticlesByCategorySlug(
                            context, widget.categorySlug, model.page);
                      } else if (widget.keyWord != null) {
                        model.gatArticlesByKeyWord(
                            context, widget.keyWord, model.page);
                      }

                      // Delay to make sure the frames are rendered properly
                      await Future.delayed(const Duration(milliseconds: 300));
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        scrollController.animateTo(
                            scrollController.position.minScrollExtent,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.fastOutSlowIn);
                      });
                    },
                    child: Container(
                      color: model.page == index ? blueColor : primaryColor,
                      child: Row(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              width: 50,
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                    color: model.page == index
                                        ? primaryColor
                                        : blueColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )),
                          if (index < 10 - 1)
                            Container(height: 50, width: 1, color: greyColor)
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          heightSizedBox(20.0),
          model.recentPostList.isEmpty
              ? Loader(height: getHeight(context) / 3)
              : Column(
                  children: [
                    const ReportHeading(heading: "RECENT POSTS"),
                    heightSizedBox(20.0),
                    Column(
                      children: List.generate(
                        model.recentPostList.length > 5
                            ? 5
                            : model.recentPostList.length,
                        (index) {
                          ReportModel report = model.recentPostList[index];
                          return InkWell(
                            onTap: () => navigationPush(context,
                                ArticleDetail(slug: report.slug ?? '')),
                            child: Container(
                              decoration: boxDecoration.copyWith(
                                  borderRadius: BorderRadius.circular(5)),
                              margin: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 15),
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    report.title ?? '',
                                    style: smallHeadingTS,
                                  ),
                                  heightSizedBox(10),
                                  Wrap(
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
                                      widthSizedBox(7),
                                      //////////////

                                      /////////////
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
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
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
                              categoryId: model.categories[index].id ?? 0,
                            )),
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 7),
                            margin:
                                const EdgeInsets.only(right: 10, bottom: 10),
                            decoration: boxDecoration.copyWith(
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              model.categories[index].categoryName ?? '',
                              style:
                                  TextStyle(fontSize: 16, color: darkGreyColor),
                            )),
                      )),
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
                    borderRadius: BorderRadius.circular(3),
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
        ],
      ),
    );
  }
}
