import 'package:ash_walls/Models/category_wallpaper_model.dart';
import 'package:ash_walls/Provider/theme_settings.dart';
import 'package:ash_walls/Services/service.dart';
import 'package:ash_walls/View/wallpaper_view.dart';
import 'package:ash_walls/Widgets/wallpaper_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CategoryWallpaperView extends StatefulWidget {
  String categoryName;
  CategoryWallpaperView({Key? key, required this.categoryName}) : super(key: key);

  @override
  State<CategoryWallpaperView> createState() => _CategoryWallpaperViewState();
}

class _CategoryWallpaperViewState extends State<CategoryWallpaperView> {
  @override
  Widget build(BuildContext context) {
    Service service = Service();
    return Sizer(
      builder: (context, orientation, deviceType) {
        final settings =Provider.of<ThemeSetting>(context);
        return MaterialApp(
          theme: settings.currentTheme,
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              appBar: AppBar(
                
                toolbarHeight: 8.h,
                title: Row(
                  children: [
                    Text(widget.categoryName,style: GoogleFonts.dancingScript(fontSize: 4.h,fontWeight: FontWeight.w700)),
                  ],
                ),
                elevation: 0.5,
              ),

              //Category Wallpaper GridView
              body: FutureBuilder(
                future: service.getCategoryWallpaper(widget.categoryName),
                builder:(context, AsyncSnapshot<CategoryWallpaperModel> snapshot) {
                  if(!snapshot.hasData){
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.cyan,
                      ),
                    );
                  }else if(snapshot.connectionState==ConnectionState.waiting){
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.cyan,
                      ),
                    );
                  }else if(snapshot.connectionState==ConnectionState.active||snapshot.connectionState==ConnectionState.done){
                    return GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.h,),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 9/16,
                        ),
                        itemCount: snapshot.data?.photos?.length??0,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>WallPaperView(
                              wallPaper: "${snapshot.data!.photos![index].src!.portrait}",
                              width: snapshot.data!.photos![index].width.toString(),
                              height: snapshot.data!.photos![index].height.toString(),
                              photoGrapher: "${snapshot.data!.photos![index].photographer}",
                            )) ),
                            child: WallpaperCard(
                              wallpaper: "${snapshot.data!.photos![index].src!.medium}",
                              photoGrapher: "${snapshot.data!.photos![index].photographer}",
                              width: snapshot.data!.photos![index].width.toString(),
                              height: snapshot.data!.photos![index].height.toString(),
                            )
                          );
                        },
                      );                 
                  }else{
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.cyan,
                      ),
                    );
                  }
                },
              )
              
              ),
        );
      },
    );
  }
}
