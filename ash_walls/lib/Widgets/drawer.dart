import 'package:ash_walls/Screens/about.dart';
import 'package:ash_walls/Screens/home.dart';
// ignore: unused_import
import 'package:ash_walls/Screens/wallpaper.dart';
import 'package:ash_walls/View/category_wallpaper_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';
// ignore: must_be_immutable
class AppDrawer extends StatefulWidget {
  
  Widget switchButton;
  AppDrawer({super.key, required this.switchButton});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          DrawerHeader(
            
            child: Center(
              child:  Row(
                      children: [
                        Text('Ash',style: GoogleFonts.dancingScript(fontSize:50,fontWeight: FontWeight.w800,color: Colors.cyan)),
                        Text('Walls',style: GoogleFonts.dancingScript(fontSize: 50,fontWeight: FontWeight.w800,))],),
            ),
          ),

          ListTile(
            selectedColor: Colors.cyan,
            leading: const Icon(FontAwesomeIcons.image, size: 20,),
            title: const Text("Wallpapers"),
             onTap: () => Navigator.of(context, rootNavigator: false).push(MaterialPageRoute(builder: (context)=>const HomePage(isSwitched: true,))),
            
          ),

          ExpansionTile(
            
            leading: const Icon(Icons.category,),
            title: const Text("Categories",),
            children: [
              CatTile(catIcon:Icons.waves , catTitle: 'Abstract',),
              CatTile(catIcon:UniconsLine.car , catTitle: 'Car',),
              CatTile(catIcon: Icons.circle, catTitle: 'Dark', ),
              CatTile(catIcon: UniconsLine.flower, catTitle: "Flower"),
              CatTile(catIcon: UniconsLine.restaurant, catTitle: "Food"),
              CatTile(catIcon: Icons.gamepad_rounded, catTitle: "Games"),
              CatTile(catIcon: Icons.waves_rounded, catTitle: "Gradient",),
              CatTile(catIcon: FontAwesomeIcons.circle, catTitle: "Minimal",),
              CatTile(catIcon: UniconsLine.moon, catTitle: "Moon"),
              CatTile(catIcon: UniconsLine.mountains, catTitle: "Mountain"),
              CatTile(catIcon: UniconsLine.trees, catTitle: "Nature"),
              CatTile(catIcon: UniconsLine.water, catTitle: "Ocean"),
              CatTile(catIcon: FontAwesomeIcons.cat, catTitle: "Pets"),
              CatTile(catIcon: UniconsLine.paragraph, catTitle: "Quotes"),
              CatTile(catIcon: UniconsLine.sun, catTitle: "Space"),
       
            ],
            ),
          
          ListTile(
            leading: const Icon(Icons.info_rounded, size: 20,),
            title: const Text("About"),
            onTap:() => Navigator.of(context, rootNavigator: false).push(MaterialPageRoute(builder: (context)=>const AboutApp())),
            
          ),
          const Divider(),

          ListTile(
            leading: const Text("Dark Mode"),
            trailing: widget.switchButton ,
          )
          
        ],
      ),
    );
  }
}



// ignore: must_be_immutable
class CatTile extends StatelessWidget {
  String  catTitle;
  IconData catIcon;

  CatTile({super.key, required this.catIcon, required this.catTitle,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryWallpaperView(categoryName: catTitle))),
      child: ListTile(
        leading: Icon(catIcon, color: const Color(0xff00bcd4),size: 2.5.h,),
        title: Text(catTitle),
      ),
    );
  }
}