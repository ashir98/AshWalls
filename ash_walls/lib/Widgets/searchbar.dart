import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../View/category_wallpaper_view.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {

    return TextField(
      cursorColor: Colors.cyan,
                      autofocus: true,
                      textInputAction: TextInputAction.search,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 2.h),
                          hintText: "Search Wallpapers",
                          prefixIcon: const Icon(Icons.search_rounded,)),
                      onSubmitted: (value) {
                        if (value == "") {
                          // ignore: avoid_print
                          return print("object");
                        } else {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  CategoryWallpaperView(categoryName: value)));
                        }
                      },
                    );
    
  }
}