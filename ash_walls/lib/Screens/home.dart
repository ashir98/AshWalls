import 'package:ash_walls/Provider/theme_settings.dart';
import 'package:ash_walls/Screens/category.dart';
import 'package:ash_walls/Screens/wallpaper.dart';
import 'package:ash_walls/Widgets/drawer.dart';
import 'package:ash_walls/Widgets/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_remix/flutter_remix.dart';

class HomePage extends StatefulWidget {
  final bool isSwitched;
  const HomePage({Key? key, required this.isSwitched}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   bool isSwitched = false;
  // Future<bool> getValue()async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   isSwitched= prefs.getBool("switched")??false;
  //   return isSwitched;

  // }
  Icon customIcon = const Icon(Icons.search_rounded);
  Widget customText = Row(
    children: [
      Text('Ash',style:  GoogleFonts.dancingScript(fontSize: 35, fontWeight: FontWeight.w700, color: Colors.cyan)),
      Text('Walls',style:  GoogleFonts.dancingScript(fontSize: 35, fontWeight: FontWeight.w700, ))
    ],
  );

  int currentIndex = 0;

  final List<Widget> screens = [
    // ignore: prefer_const_constructors
    Wallpaper(),
    // ignore: prefer_const_constructors
    Category()
  ];


  

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    setState(() {
      isSwitched=widget.isSwitched;
    });
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
            //APP BAR
            appBar: AppBar(
              toolbarHeight: 8.h,
              title: customText,
              elevation: 0.5,
              leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(FlutterRemix.menu_2_fill),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
            ),

            //DRAWER
            drawer:  AppDrawer(switchButton: Switch(
                  
                  value: isSwitched,
                  onChanged: (value) async{
                    SharedPreferences prefs =await SharedPreferences.getInstance();
                    prefs.setBool("switched", value);
                    setState(() {
                      isSwitched =value;
                      settings.toggleTheme();
                    });

                  },
                ),),

            //BODY
            body: IndexedStack(
              index: currentIndex,
              children: screens,
            ),

            //NAVIAGTION BAR
            bottomNavigationBar: NavigationBar(
              elevation: 100,
              labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
              selectedIndex: currentIndex,
              animationDuration: const Duration(milliseconds: 250),
              onDestinationSelected: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              destinations: const [
                NavigationDestination(
                  icon: Icon(FontAwesomeIcons.image),
                  label: "WallPapers",
                ),
                NavigationDestination(
                  icon: Icon(Icons.category_rounded),
                  label: "Categories",
                )
              ],
            ),

            //FLOATING ACTION BUTTON CODE

            floatingActionButton: FloatingActionButton(
              onPressed: () {
                setState(() {
                  if (customIcon.icon == Icons.search_rounded) {
                    customIcon = const Icon(Icons.cancel_rounded);
                    customText = const SearchBar();
                  } else {
                    customIcon = const Icon(Icons.search_rounded);
                    customText = Row(
                      children: [
                        Text('Ash',style: GoogleFonts.dancingScript(fontSize: 35,fontWeight: FontWeight.w800,color: Colors.cyan)),
                        Text('Walls',style: GoogleFonts.dancingScript(fontSize: 35,fontWeight: FontWeight.w800,))],);                
                  }
                });
              },
              child: customIcon,
            ),
          ),
        );
      },
    );
  }
}
