import 'package:ash_walls/Provider/theme_settings.dart';
import 'package:ash_walls/Screens/category.dart';
import 'package:ash_walls/Screens/splash.dart';
import 'package:ash_walls/Screens/wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final isDark = sharedPreferences.getBool('is_Dark') ?? false;
  final isSwitched = sharedPreferences.getBool("switched") ?? false;
  runApp(AshWalls(
    isDark: isDark,
    isSwithced: isSwitched,
  ));
}

class AshWalls extends StatefulWidget {
  final bool isSwithced;
  final bool isDark;
  const AshWalls({super.key, required this.isDark, required this.isSwithced});

  @override
  State<AshWalls> createState() => _AshWallsState();
}

class _AshWallsState extends State<AshWalls> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeSetting(widget.isDark),
        builder: (context, snapshot) {
          final settings = Provider.of<ThemeSetting>(context, listen: false);
          return MaterialApp(
            theme: settings.currentTheme,
            debugShowCheckedModeBanner: false,
            home: Splash(isSwitched: widget.isSwithced,),
            routes: {
              // '/Home': (context) => const HomePage(),
              '/Wallpapers': (context) => const Wallpaper(),
              '/Category': (context) => const Category(),
              // '/WallpaperView' :(context) =>  WallPaperView(),
            },
          );
        });
  }
}
