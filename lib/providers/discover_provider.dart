
import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier{

  VideoPostsRepository  videoPostRepository;
  bool initialLoading = true;
  List<VideoPost> videos = [];
  
  DiscoverProvider({ required this.videoPostRepository });


  Future<void> loadNextPage()async{
    List<VideoPost> newVideos = await videoPostRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading=false;
    notifyListeners();
  }
}



/*
await Future.delayed(const Duration(seconds: 2));
    final List<VideoPost> newVideos = videoPosts.map(  
      (video) => LocalVideoModel.fromJson(video).toVideoPostEntity()
    ).toList();

    videos.addAll(newVideos);
    initialLoading=false;
    notifyListeners();
 */