import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/app_theme.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>DiscoverProvider()..loadNextPage(), lazy: false ),
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
