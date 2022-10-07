
import 'package:ash_walls/Models/wallpaper_model.dart';
import 'package:ash_walls/Provider/theme_settings.dart';
import 'package:ash_walls/Services/service.dart';
import 'package:ash_walls/View/wallpaper_view.dart';
import 'package:ash_walls/Widgets/wallpaper_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class Wallpaper extends StatefulWidget {
  const Wallpaper({Key? key}) : super(key: key);

  @override
  State<Wallpaper> createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {



  Service service = Service();
  String status= "";
  Future<String> connection()async{
    Connectivity connectivity = Connectivity();
    var connectionResult = await connectivity.checkConnectivity();
    if(connectionResult == ConnectivityResult.none){
      return status = "No internet connection";
    }else{
      return status="";
    }
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connection();
  }

  

  @override
  Widget build(BuildContext context) {

    return Sizer(
      builder: (context, orientation, deviceType) {
        final settings = Provider.of<ThemeSetting>(context);
        
        return MaterialApp(
          theme: settings.currentTheme,
          debugShowCheckedModeBanner: false,
          home: Scaffold(

              //Wallpapers GridView
              body: FutureBuilder(
            future: service.getWallpaper(),
            builder: (context, AsyncSnapshot<WallpaperModel> snapshot) {


              if(status=="No internet connection"){
                return Center(
                  child: Image.asset(
                    
                    "images/404.png",
                    height: 37.h,
                    width: 37.h,
                    )
                );
              }



              else if (!snapshot.hasData) {
                return  Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: Colors.cyan,),
                      SizedBox(height: 4.h,),
                      // Text(status, style: GoogleFonts.catamaran(fontSize: 3.h),)
                      
                      
                    ],
                  ),
                );
              }

              
              
              
               else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.cyan,
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.active ||
                  snapshot.connectionState == ConnectionState.done) {
                return RefreshIndicator(
                  color: Colors.cyan,
                  onRefresh: ()async {
                    setState(() {
                      service.getWallpaper();
                    });
                  },
                  child: GridView.builder(
                    padding:
                        EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.h),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 9 / 16,
                    ),
                    itemCount: snapshot.data?.photos?.length ?? 0,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () =>
                              Navigator.of(context, rootNavigator: true)
                                  .push(MaterialPageRoute(
                                      builder: (context) => WallPaperView(
                                            wallPaper:
                                                "${snapshot.data!.photos![index].src!.large2x}",
                                            height: snapshot
                                                .data!.photos![index].height
                                                .toString(),
                                            width: snapshot
                                                .data!.photos![index].width
                                                .toString(),
                                            photoGrapher:
                                                "${snapshot.data!.photos![index].photographer}",
                                          ))),
                          child: WallpaperCard(
                            wallpaper:
                                "${snapshot.data!.photos![index].src!.large}",
                            height:
                                snapshot.data!.photos![index].height.toString(),
                            width:
                                snapshot.data!.photos![index].width.toString(),
                            photoGrapher:
                                "${snapshot.data!.photos![index].photographer}",
                          ));
                    },
                  ),
                );
              } else {
                return Center(child: Image.asset('images/404.png'));
              }
            },
          )),
        );
      },
    );
  }
}
