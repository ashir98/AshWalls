import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


////LIGHT THEME
ThemeData lightTheme() {
  return ThemeData(
    canvasColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white
    ),
    textTheme: GoogleFonts.catamaranTextTheme(),
    useMaterial3: true,
    primarySwatch: Colors.cyan,
    //SCAFFOLD THEME
    scaffoldBackgroundColor: Colors.white,
      
    //APP BAR THEME
    appBarTheme:const AppBarTheme(
      surfaceTintColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark
        ),
        titleTextStyle: TextStyle(color: Colors.black),
        color: Colors.white
     ),



    //DRAWER 
     drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white
      
     ),

     listTileTheme: const ListTileThemeData(
      iconColor: Colors.black,
      textColor: Colors.black
     ), 

    //NAVIGATION BAR THEME
    navigationBarTheme: const NavigationBarThemeData(
      indicatorColor: Color(0xff00bcd4),
    backgroundColor: Color(0xffffffff)
    ),      
           
    //FLOATING ACTION BUTTON THEME  
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xff00bcd4),
    ),
    

    //TEXT FIELD THEME
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.cyan[100],
      hintStyle: GoogleFonts.catamaran(color: const Color(0xff00bcd4), fontWeight: FontWeight.w200),
       prefixIconColor: const Color(0xff00bcd4),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Color(0xff00bcd4)
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Color(0xff00bcd4)
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Color(0xff00bcd4)
        ),
      ),
    ),



    //OTHER WIDGETS
    dividerColor: const Color(0xffbdbdbd),
    cardColor: const Color(0xffb2ebf2),
    primaryIconTheme: const IconThemeData(
      color: Colors.white
    ),

    dialogBackgroundColor: Colors.white,
    expansionTileTheme: const ExpansionTileThemeData(
    collapsedIconColor: Colors.black,
    iconColor: Colors.black,
    textColor: Colors.black,
    collapsedTextColor: Colors.black
    ),
     
    
  );
}





//////DARK THEME
ThemeData darkTheme(){
  return ThemeData.dark().copyWith(
    iconTheme: const IconThemeData(
      color: Colors.white
    ),
    
    textTheme: GoogleFonts.catamaranTextTheme(

      const TextTheme(
        titleMedium: TextStyle(color: Colors.white),
        titleSmall: TextStyle(color: Colors.white),
      )
      
    ),

    useMaterial3: true,
     //SCAFFOLD THEME
    scaffoldBackgroundColor: const Color(0xff001010),


    //APP BAR THEME
    appBarTheme:const AppBarTheme(
      surfaceTintColor: Color(0xff001010),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xff001010),
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light
        ),
        titleTextStyle: TextStyle(color: Colors.white),
        color: Color(0xff001010)
    ),


    ///DRAWER THEME
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xff001010),
    ),

    dialogBackgroundColor: const Color(0xff001010),
    

    //NAVIGATION BAR THEME
    navigationBarTheme: NavigationBarThemeData(
      
      iconTheme: MaterialStateProperty.all(
        const IconThemeData(color: Colors.white)
      ),
    
    indicatorColor: const Color(0xff006a6a),  
    backgroundColor: const Color(0xff001010),
    ), 


    //FLOATING ACTION BUTTON THEME  
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      
      backgroundColor: Color(0xff006a6a) ,
    ),   


    //TEXT FIELD THEME
    inputDecorationTheme: InputDecorationTheme(
      
      hintStyle: GoogleFonts.catamaran(color: const Color(0xff009688), fontWeight: FontWeight.w200),
       prefixIconColor: const Color(0xff009688),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Color(0xff009688)
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Color(0xff009688)
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Color(0xff00dcdc)
        ),
      ),
    ),


    //OTHER WIDGETS
    dividerColor: const Color(0xffbdbdbd),
    cardTheme: const CardTheme(
      color: Color(0xff00abab),
    ),
    primaryIconTheme: const IconThemeData(
      color: Colors.white
    ),

    expansionTileTheme: const ExpansionTileThemeData(
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      textColor: Colors.white,
      collapsedTextColor: Colors.white
    ),



  
  );
}
