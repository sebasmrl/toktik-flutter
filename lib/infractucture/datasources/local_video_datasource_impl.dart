
import 'package:toktik/domain/datasources/video_posts_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infractucture/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_posts.dart';

class LocalVideoDatasourceImpl implements VideoPostsDatasource{

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) async{
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async{
    return await Future.delayed(const Duration(seconds: 1), () {
      final List<VideoPost> newVideos = videoPosts.map(  
        (video) => LocalVideoModel.fromJson(video).toVideoPostEntity()
      ).toList();
      return newVideos;
    });
  }

}