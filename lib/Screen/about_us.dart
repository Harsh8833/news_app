import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../Controller/setting_controller.dart';
import '../Elements/report_widget.dart';
import '../Model/services_model.dart';
import '../Model/team_model.dart';
import '../Utils/common.dart';
import '../Utils/header_page.dart';
import '../Utils/helper.dart';
import '../Utils/loader.dart';
import '../Utils/style.dart';
import '../Utils/url_constants.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends StateMVC<AboutUs> {
  late SettingController model;

  _AboutUsState() : super(SettingController()) {
    model = controller as SettingController;
  }

  @override
  void initState() {
    super.initState();
    model.getServicesList(context);
    model.getTeamList(context);
    model.getSettings(context);
  }

  @override
  Widget build(BuildContext context) {
    return HeaderPage(
      body: Column(
        children: [
          heightSizedBox(20.0),
          const ReportHeading(heading: "ABOUT US"),
          heightSizedBox(20.0),
          if (model.aboutUs.content != null && model.aboutUs.content != '')
            Container(
              decoration: boxDecoration.copyWith(
                  borderRadius: BorderRadius.circular(5)),
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(5),
                  topLeft: Radius.circular(5),
                ),
                child: Column(
                  children: [
                    CachedNetworkImage(
                      // width: double.infinity,
                      // height: getHeight(context) / 2.2,
                      // fit: BoxFit.fill,
                      imageUrl:
                          "${URLConstants.imageUrl}${model.aboutUs.image ?? ''}",
                      placeholder: (context, url) => const Loader(height: 150),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          heightSizedBox(15),
                          Text(
                            model.aboutUs.heading ?? '',
                            style: headingTS,
                          ),
                          heightSizedBox(10.0),
                          Html(
                            data: model.aboutUs.content,
                            style: {
                              '#': Style(
                                fontSize: const FontSize(15),
                              ),
                            },
                          ),
                        ],
                      ),
                    ),
                    heightSizedBox(10.0),
                  ],
                ),
              ),
            )
          else
            Loader(height: getHeight(context) / 2),
          heightSizedBox(20.0),
          const ReportHeading(heading: "SERVICES"),
          heightSizedBox(20.0),
          Column(
            children: List.generate(
              model.servicesList.length,
              (index) {
                ServicesModel service = model.servicesList[index];
                return Container(
                  decoration: boxDecoration.copyWith(
                      borderRadius: BorderRadius.circular(5)),
                  padding: const EdgeInsets.all(20.0),
                  margin:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                                index == 0
                                    ? FontAwesomeIcons.glasses
                                    : index == 1
                                        ? FontAwesomeIcons.handshake
                                        : FontAwesomeIcons.award,
                                color: blueColor,
                                size: 40),
                            widthSizedBox(10),
                            Text(
                              service.title ?? '',
                              style: headingTS,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            service.desc ?? '',
                            style: smallDescriptionTS,
                          ),
                        ),
                        heightSizedBox(10.0),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          heightSizedBox(20.0),
          const ReportHeading(heading: "OUR TEAM"),
          heightSizedBox(20.0),
          Column(
            children: List.generate(
              model.teamList.length,
              (index) {
                TeamModel team = model.teamList[index];
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
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          width: double.infinity,
                          height: getHeight(context) / 2,
                          fit: BoxFit.cover,
                          imageUrl:
                              "${URLConstants.imageUrl}images/upload/teams/${team.image ?? ''}",
                          placeholder: (context, url) =>
                              const Loader(height: 150),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                team.name ?? '',
                                style: headingTS,
                              ),
                              heightSizedBox(20.0),
                              SizedBox(
                                height: 180,
                                child: Scrollbar(
                                  child: ListView(
                                    children: [
                                      Text(team.desc ?? '',
                                          style: smallDescriptionTS),
                                    ],
                                  ),
                                ),
                              ),
                              heightSizedBox(10.0),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () => launchURL(team.facebook),
                                    child: Image.asset(
                                      "Assets/Images/facebook-app-symbol.png",
                                      width: 17,
                                      height: 17,
                                    ),
                                  ),
                                  widthSizedBox(10.0),
                                  InkWell(
                                    onTap: () => launchURL(team.twitter),
                                    child: Image.asset(
                                      "Assets/Images/twitter.png",
                                      width: 17,
                                      height: 17,
                                    ),
                                  ),
                                  widthSizedBox(10.0),
                                  InkWell(
                                    onTap: () => launchURL(team.google),
                                    child: Image.asset(
                                      "Assets/Images/google.png",
                                      width: 17,
                                      height: 17,
                                    ),
                                  ),
                                  widthSizedBox(10.0),
                                  InkWell(
                                    onTap: () => launchURL(team.linkdin),
                                    child: Image.asset(
                                      "Assets/Images/linkedin.png",
                                      width: 17,
                                      height: 17,
                                    ),
                                  ),
                                  widthSizedBox(10.0),
                                  InkWell(
                                    onTap: () => launchURL(team.youtube),
                                    child: Image.asset(
                                      "Assets/Images/youtube.png",
                                      width: 17,
                                      height: 17,
                                    ),
                                  ),
                                ],
                              ),
                              heightSizedBox(10.0),
                            ],
                          ),
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
    );
  }
}
