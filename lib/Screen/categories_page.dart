import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:news_app/Model/category_model.dart';
import 'package:news_app/Screen/category_articles.dart';
import 'package:news_app/Utils/common.dart';

import '../Elements/report_widget.dart';
import '../Utils/header_page.dart';
import '../Utils/loader.dart';
import '../Utils/style.dart';
import '../Utils/url_constants.dart';

class CategoriesPage extends StatefulWidget {
  final List<CategoryModel> categories;
  const CategoriesPage({Key? key, required this.categories}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends StateMVC<CategoriesPage> {
  // List<String> list = <String>[
  //   "Editorials",
  //   "Features",
  //   "Focus",
  //   "Interviews",
  //   "Marketing",
  //   "Money",
  //   "Technology",
  //   "The Last Word",
  //   "Top Stories",
  // ];

  @override
  Widget build(BuildContext context) {
    return HeaderPage(
      body: Column(
        children: [
          heightSizedBox(20.0),
          const ReportHeading(heading: "CATEGORIES"),
          heightSizedBox(20.0),
          Column(
            children: List.generate(
              widget.categories.length,
              (index) {
                CategoryModel category = widget.categories[index];
                return Container(
                  decoration: boxDecoration.copyWith(
                      borderRadius: BorderRadius.circular(5)),
                  margin:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5),
                    ),
                    child: InkWell(
                      onTap: () => navigationPush(context,
                          CategoryArticles(categorySlug: category.slug)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                            width: double.infinity,
                            height: getHeight(context) / 2.5,
                            fit: BoxFit.cover,
                            imageUrl:
                                "${URLConstants.imageUrl}${category.categoryImage ?? ''}",
                            placeholder: (context, url) =>
                                const Loader(height: 150),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: Text(
                              category.categoryName ?? '',
                              style:
                                  TextStyle(fontSize: 20, color: darkGreyColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
