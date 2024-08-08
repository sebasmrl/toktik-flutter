
import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video/fullscreen_player.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {

  final List<VideoPost> videos;
  const VideoScrollableView({
    super.key, 
    required this.videos
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics( decelerationRate: ScrollDecelerationRate.fast ),
      itemCount: videos.length,
      itemBuilder: (context, index){
        final VideoPost videoPost= videos[index];

        return Stack(
          children: [
            //VideoPlayer + Gradiente
            SizedBox.expand(
              child: FullscreenPlayer(
                caption: videoPost.caption, 
                videoUrl: videoPost.videoUrl
              )
            ),
            //Botones
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost)
              ),
          ],
        );
      },
    );
  }
}