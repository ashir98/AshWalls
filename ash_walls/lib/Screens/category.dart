import 'package:ash_walls/Provider/theme_settings.dart';
import 'package:ash_walls/View/category_wallpaper_view.dart';
import 'package:ash_walls/Widgets/category_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        final settings =Provider.of<ThemeSetting>(context);
        return MaterialApp(
          theme: settings.currentTheme,
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            
          body: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.h),
            children: [

              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryWallpaperView(
                  categoryName: 'Minimal',
                ))),
                child: CategoryTile(catName: "MINIMAL", catImage: 'images/minimal.jpeg' )),

              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryWallpaperView(
                  categoryName: 'Dark',
                ))),
                child: CategoryTile(catName: "DARK", catImage: 'images/dark.jpg' )),
              
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryWallpaperView(
                  categoryName: 'Space',
                ))),
                child: CategoryTile(catName: "SPACE", catImage: 'images/space.jpg' )),
             
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryWallpaperView(
                  categoryName: 'Nature',
                ))),
                child: CategoryTile(catName: "NATURE", catImage: 'images/nature.jpg' )),

              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryWallpaperView(
                  categoryName: 'Food',
                ))),
                child: CategoryTile(catName: "FOOD", catImage: 'images/food.jpg' )),  
             
              
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryWallpaperView(
                  categoryName: 'Quotes',
                ))),
                child: CategoryTile(catName: "QUOTES", catImage: 'images/quotes.jpg' )),
              
              
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryWallpaperView(
                  categoryName: 'Gaming',
                ))),
                child: CategoryTile(catName: "GAMING", catImage: 'images/games.jpg' )),
              

              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryWallpaperView(
                  categoryName: 'Gradient',
                ))),
                child: CategoryTile(catName: "GRADIENT", catImage: 'images/gradient.jpg' )),


              
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryWallpaperView(
                  categoryName: 'Abstract',
                ))),
                child: CategoryTile(catName: "ABSTRACT", catImage: 'images/abstract.jpg' )),
              

              
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryWallpaperView(
                  categoryName: 'Ocean',
                ))),
                child: CategoryTile(catName: "OCEAN", catImage: 'images/ocean.jpg' )),

              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryWallpaperView(
                  categoryName: 'Mountains',
                ))),
                child: CategoryTile(catName: "MOUNTAIN", catImage: 'images/mountain.jpg' )),


              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryWallpaperView(
                  categoryName: 'Moon',
                ))),
                child: CategoryTile(catName: "MOON", catImage: 'images/moon.jpg' )),    
              

              GestureDetector(
                
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryWallpaperView(
                  categoryName: 'Flowers',
                ))),
                child: CategoryTile(catName: "FLOWERS", catImage: 'images/flowers.jpg' )),
            
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryWallpaperView(
                  categoryName: 'Cars',
                ))),
                child: CategoryTile(catName: "CARS", catImage: 'images/car.jpg' )),

              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryWallpaperView(
                  categoryName: 'Pets',
                ))),
                child: CategoryTile(catName: "PETS", catImage: 'images/pets.jpg' )),  
            ],
          
          )),
        );
      },
    );
  }
}


