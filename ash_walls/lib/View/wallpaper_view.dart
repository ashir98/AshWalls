// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:ash_walls/Widgets/draggable_sheet_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

import 'package:sizer/sizer.dart';
import 'package:transparent_image/transparent_image.dart';

import '../Provider/theme_settings.dart';
import 'package:gallery_saver/gallery_saver.dart';

// ignore: must_be_immutable
class WallPaperView extends StatefulWidget {
  String wallPaper;
  String photoGrapher;
  String height;
  String width;
  WallPaperView({Key? key, required this.wallPaper, required this.photoGrapher, required this.height, required this.width}) : super(key: key);

  @override
  State<WallPaperView> createState() => _WallPaperViewState();
}

class _WallPaperViewState extends State<WallPaperView> {

  setHomeScreenWallpaper()async{
    int location = WallpaperManager.HOME_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.wallPaper);
    // ignore: unused_local_variable
    var result = WallpaperManager.setWallpaperFromFile(file.path, location);
  }


    setLockScreenWallpaper()async{
    int location = WallpaperManager.LOCK_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.wallPaper);
    // ignore: unused_local_variable
    var result = WallpaperManager.setWallpaperFromFile(file.path, location);
  }





  @override
  Widget build(BuildContext context) {
    return Sizer(builder:(context, orientation, deviceType) {
      final settings =Provider.of<ThemeSetting>(context);
      return MaterialApp(
        theme: settings.currentTheme,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.transparent
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_rounded),
            ),
          ),
          body: Stack(
            children: [
              Center(
                child: FadeInImage.memoryNetwork(
                  fadeInDuration: const Duration(milliseconds: 400),
                  placeholder: kTransparentImage,
                  image: widget.wallPaper,
                ),
              ),
        
              DraggableScrollableSheet(
                initialChildSize: 0.04,
                minChildSize: 0.04,
                maxChildSize: 0.23,
                builder: (context, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.cyan[400],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)
                      )
                    ),
        
                    
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Divider(
                              thickness: 5,
                              color: Colors.black45,
                              indent: 150,
                              endIndent: 150,
                              
                            ),
                             SizedBox(height:2.h,),
                            Row(
                              
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
        
                                GestureDetector(
                                  onTap: (){
        
                                    showDialog(context: context, builder:(BuildContext) {
                                      return AlertDialog(
                                        title: const Text("Set as Homescreen Wallpaper?"),
                                        actions: [
                                          TextButton(
                                            child: Text("No",style: GoogleFonts.catamaran(color: Colors.cyan, fontSize: 2.h),),
                                            onPressed:() =>Navigator.of(context, rootNavigator: true).pop()),
                                          TextButton(
                                            child: Text("Yes",style: GoogleFonts.catamaran(color: Colors.cyan, fontSize: 2.h), ),
                                            onPressed:(){
                                              setHomeScreenWallpaper();
                                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Wallpaper applied!")));
                                              Navigator.of(context, rootNavigator: true).pop();
                                            }),
                                        ],
                                      );
                                    },);
                                    
                                  },
                                  child: SheetButton(icon: FontAwesomeIcons.mobileScreen, buttonText: "HomeScreen",)),
        
                                
                                GestureDetector(
                                  onTap: (){
        
                                    showDialog(context: context, builder:(BuildContext) {
                                      return AlertDialog(
                                        title: const Text("Set as Lockscreen Wallpaper?"),
                                        actions: [
                                          TextButton(
                                            child: Text("No",style: GoogleFonts.catamaran(color: Colors.cyan, fontSize: 2.h),),
                                            onPressed:() =>Navigator.of(context, rootNavigator: true).pop()),
                                          TextButton(
                                            child: Text("Yes", style: GoogleFonts.catamaran(color: Colors.cyan, fontSize: 2.h),),
                                            onPressed:(){
                                              setLockScreenWallpaper();
                                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(seconds: 3),content: Text("Wallpaper applied!")));
                                              Navigator.of(context, rootNavigator: true).pop();
                                            }),
                                        ],
                                      );
                                    },);
                                    
                                  },
                                  child: SheetButton(icon: Icons.screen_lock_portrait, buttonText: "LockScreen",)),
        
        
        
        
                                
                                GestureDetector(
                                  onTap: ()async {
                                   await GallerySaver.saveImage(widget.wallPaper, albumName: "AshWalls");
                                   // ignore: use_build_context_synchronously
                                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Wallpaper downloaded!')));
                                  },
                                  child: SheetButton(icon: Icons.download_rounded, buttonText: "Download",))
                                
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric( vertical: 2.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${widget.photoGrapher}    |    ${widget.width}x${widget.height}", style: GoogleFonts.catamaran(fontSize: 2.5.h,fontWeight: FontWeight.w500),),
                            
                                  
                                ],
                              ),
                            )
                          ],
                        ),
                    )
                  );
                },
              )
            ],
          )
        ),
      );
    },);

    
  }
}