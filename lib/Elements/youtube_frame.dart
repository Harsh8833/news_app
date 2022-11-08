import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Model/report_model.dart';
import '../Utils/common.dart';
import '../Utils/style.dart';

class YouTubeFrame extends StatelessWidget {
  final VideoModel video;
  final int? isVideoPage;
  const YouTubeFrame({Key? key, required this.video, this.isVideoPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(5), topLeft: Radius.circular(5)),
              child: YoutubePlayerIFrame(
                controller: YoutubePlayerController(
                  initialVideoId: video.videoPath ?? '' /*'K18cpp_-gP8'*/,
                  params: const YoutubePlayerParams(
                      startAt: Duration(seconds: 30),
                      autoPlay: true,
                      showFullscreenButton: true),
                ),
                aspectRatio: 16 / 9,
              ),
            ),
          ),
          heightSizedBox(15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              video.videoName ?? '',
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: headingTS,
            ),
          ),
          if (isVideoPage != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  heightSizedBox(10.0),
                  Wrap(
                    children: [
                      const Icon(
                        Icons.access_time_outlined,
                        color: greyColor,
                        size: 20,
                      ),
                      widthSizedBox(4),
                      Text(video.postedOn ?? '', style: authorNameTS),
                      widthSizedBox(7.0),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.person_outline,
                            color: greyColor,
                            size: 20,
                          ),
                          widthSizedBox(4),
                          Flexible(
                            child: Text(
                              "By: ${video.postedBy ?? ''}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
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
          heightSizedBox(15),
        ],
      ),
    );
  }
}
