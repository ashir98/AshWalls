import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

// ignore: must_be_immutable
class WallpaperCard extends StatefulWidget {

  String wallpaper;
  String height;
  String width; 
  String photoGrapher;


  WallpaperCard({Key? key, required this.wallpaper, required this.height, required this.width, required this.photoGrapher}) : super(key: key);

  @override
  State<WallpaperCard> createState() => _WallpaperCardState();
}

class _WallpaperCardState extends State<WallpaperCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: widget.wallpaper,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
              fadeInDuration: const Duration(milliseconds: 600),
            )
          ),
            ListTile(
            title: Text(widget.photoGrapher),
            subtitle: Text("${widget.width}x${widget.height}"),
          )
        ],
      ),
    );
  }
}
