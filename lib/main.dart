import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/app_theme.dart';
import 'package:toktik/infractucture/datasources/local_video_datasource_impl.dart';
import 'package:toktik/infractucture/repositories/video_posts_repository_impl.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';
import 'package:toktik/providers/discover_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final  videoPostsRepository = VideoPostsRepositoryImpl(
      videoDatasource: LocalVideoDatasourceImpl()
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider( 
          lazy: false,
          create: (_)=>DiscoverProvider( videoPostRepository: videoPostsRepository )..loadNextPage(), 
        ),
      ],
      child: MaterialApp( 
        title: 'Toktik',
        debugShowCheckedModeBanner: false,
        theme:  AppTheme().getTheme(),
        home: const DiscoverScreen() 
      ),
    );
  }
}
