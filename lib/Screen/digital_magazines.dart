import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:news_app/Utils/common.dart';
import 'package:news_app/Utils/loader.dart';

import '../Controller/home_controller.dart';
import '../Elements/drop_down.dart';
import '../Elements/image_widget.dart';
import '../Elements/report_widget.dart';
import '../Utils/header_page.dart';
import '../Utils/style.dart';

class DigitalMagazines extends StatefulWidget {
  // final String categoryType;

  const DigitalMagazines({
    Key? key,
  }) : super(key: key);

  @override
  _DigitalMagazinesState createState() => _DigitalMagazinesState();
}

class _DigitalMagazinesState extends StateMVC<DigitalMagazines> {
  late HomeController model;

  _DigitalMagazinesState() : super(HomeController()) {
    model = controller as HomeController;
  }

  //
  List<String> list = <String>[
    "2022",
    "2021",
    "2020",
    "2019",
    "2018",
    "2017",
    "2016",
    "2015",
    "2014",
    "2013",
    "2012",
    "2011",
    "2010",
  ];
  final ScrollController scrollController = ScrollController();

  // int selectedPage = 1;

  @override
  void initState() {
    super.initState();

    model.getDigitalMagazines(context);
  }

  @override
  Widget build(BuildContext context) {
    return HeaderPage(
      scrollController: scrollController,
      body: Column(
        children: [
          heightSizedBox(20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: DropDownDesign(
              values: model.selectedYear,
              isExpanded: true,
              items: list.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    // style: const TextStyle(color: primaryColor),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                model.totalPage = 0;
                model.totalCount = null;
                model.selectedYear = value;
                model.getDigitalMagazinesByYear(context);
              },
              hintText: 'Filter by Year',
            ),
          ),
          heightSizedBox(20.0),
          ReportHeading(heading: 'Digital Magazines'.toUpperCase()),
          heightSizedBox(20.0),
          model.digitalMagazines.isEmpty && !model.showError
              ? Loader(height: getHeight(context) / 3)
              : model.digitalMagazines.isEmpty && model.showError
                  ? SizedBox(
                      height: 200,
                      child: Text("No magazines found!", style: descriptionTS),
                    )
                  : Column(
                      children: List.generate(
                        model.digitalMagazines.length,
                        (index) => MagazineImageWidget(
                          magazine: model.digitalMagazines[index],
                        ),
                      ),
                    ),
          heightSizedBox(20.0),
          Container(
            height: 50,
            decoration:
                boxDecoration.copyWith(borderRadius: BorderRadius.circular(5)),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: List.generate(model.totalPage, (index) {
                return InkWell(
                  onTap: () async {
                    setState(() => model.page = index);
                    model.getDigitalMagazines(context);
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
                        if (index < model.totalPage - 1)
                          Container(height: 50, width: 1, color: greyColor)
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          heightSizedBox(20.0),
        ],
      ),
    );
  }
}
