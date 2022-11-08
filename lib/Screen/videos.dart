import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:news_app/Utils/loader.dart';

import '../Controller/videos_controller.dart';
import '../Elements/report_widget.dart';
import '../Elements/youtube_frame.dart';
import '../Utils/common.dart';
import '../Utils/header_page.dart';
import '../Utils/style.dart';

class VideosPage extends StatefulWidget {
  const VideosPage({Key? key}) : super(key: key);

  @override
  _VideosPageState createState() => _VideosPageState();
}

class _VideosPageState extends StateMVC<VideosPage> {
  late VideosController model;

  _VideosPageState() : super(VideosController()) {
    model = controller as VideosController;
  }
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    model.getVideos(context);
  }

  @override
  Widget build(BuildContext context) {
    return HeaderPage(
      scrollController: scrollController,
      body: model.videos.isEmpty
          ? Loader(height: getHeight(context))
          : Column(
              children: [
                heightSizedBox(20),
                const ReportHeading(heading: "VIDEOS"),
                Column(
                  children: List.generate(model.videos.length, (index) {
                    return Column(
                      children: [
                        heightSizedBox(20),
                        YouTubeFrame(
                            video: model.videos[index], isVideoPage: 1),
                      ],
                    );
                  }),
                ),
                heightSizedBox(20.0),
                Container(
                  height: 50,
                  decoration: boxDecoration.copyWith(
                      borderRadius: BorderRadius.circular(5)),
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(model.totalPage, (index) {
                      return InkWell(
                        onTap: () async {
                          setState(() => model.page = index);
                          model.getVideos(context);

                          // Delay to make sure the frames are rendered properly
                          await Future.delayed(
                              const Duration(milliseconds: 300));
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
                                Container(
                                    height: 50, width: 1, color: greyColor)
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
