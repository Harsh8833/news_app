import 'package:flutter/material.dart';

import '../Model/category_model.dart';
import '../Screen/about_us.dart';
import '../Screen/categories_page.dart';
import '../Screen/category_articles.dart';
import '../Screen/contact_us.dart';
import '../Screen/home.dart';
import '../Screen/videos.dart';
import '../Utils/common.dart';
import '../Utils/style.dart';

class DrawerWidget extends StatelessWidget {
  final List<CategoryModel> categories;

  const DrawerWidget({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 230,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Image.asset(
                  "Assets/Images/smelogo.png",
                  height: 100,
                ),
              ),
              createDrawerBodyItem(
                text: 'Home',
                onTap: () => navigationRemoveUntil(context, const HomePage()),
              ),
              createDrawerBodyItem(
                text: 'About Us',
                onTap: () => navigationPush(context, const AboutUs()),
              ),
              const Divider(
                height: 1.0,
                color: Colors.black54,
              ),
              Theme(
                data: Theme.of(context).copyWith(dividerColor: transparent),
                child: ListTileTheme(
                  contentPadding: const EdgeInsets.all(0),
                  dense: true,
                  minVerticalPadding: 0.0,
                  horizontalTitleGap: 0.0,
                  minLeadingWidth: 0,
                  child: ExpansionTile(
                    collapsedIconColor: Colors.black54,
                    iconColor: Colors.black54,
                    childrenPadding: const EdgeInsets.only(),
                    tilePadding: const EdgeInsets.only(right: 10),
                    title: createDrawerBodyItem(
                      isExpansion: 1,
                      text: 'Categories',
                      onTap: () => navigationPush(
                          context, CategoriesPage(categories: categories)),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          children: List.generate(categories.length, (index) {
                            CategoryModel category = categories[index];
                            return createDrawerBodyItem(
                              text: category.categoryName,
                              onTap: () => navigationPush(
                                  context,
                                  CategoryArticles(
                                    categorySlug: convertTitleIntoSlug(
                                        category.categoryName ?? ''),
                                    // categoryType: category.categoryName ?? '',
                                  )),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              createDrawerBodyItem(
                text: 'News',
                onTap: () => navigationPush(
                    context,
                    const CategoryArticles(
                      keyWord: 'news',
                      // categoryType: "News",
                    )),
              ),
              createDrawerBodyItem(
                text: 'Videos',
                onTap: () => navigationPush(context, const VideosPage()),
              ),
              createDrawerBodyItem(
                text: 'Contact Us',
                onTap: () => navigationPush(context, const ContactUS()),
              ),
              const Divider(
                height: 1.0,
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget createDrawerBodyItem(
    {int? isExpansion, String? text, GestureTapCallback? onTap}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      isExpansion == 1
          ? const SizedBox()
          : const Divider(
              height: 1.0,
              color: Colors.black54,
            ),
      ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        title: Row(
          children: [
            Flexible(
              child: Text(
                text ?? '',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
        trailing: isExpansion == 1
            ? null
            : const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black54,
                size: 16,
              ),
        onTap: onTap,
      ),
    ],
  );
}
