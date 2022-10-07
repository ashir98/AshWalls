
import 'package:ash_walls/Provider/theme_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder:(context, orientation, deviceType) {
      final settings =Provider.of<ThemeSetting>(context);
      return MaterialApp(
        theme: settings.currentTheme,
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              appBar: AppBar(
                title: Row(
    children: [
      Text('Ash',style:  GoogleFonts.dancingScript(fontSize: 35, fontWeight: FontWeight.w700, color: Colors.cyan)),
      Text('Walls',style:  GoogleFonts.dancingScript(fontSize: 35, fontWeight: FontWeight.w700, ))
    ],
  ),
              ),
              
              
              body: SingleChildScrollView(
                child: Column(
                  children: [


                    // 1ST CARD
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 0.5.h),
                      child: Card(
                        elevation: 0.8,
                        color: Colors.cyan[50],
                        child: Container(
                          
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)
                          ),
                          width: double.infinity,
                          height: 20.h,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Ash", style: GoogleFonts.dancingScript(color: Colors.cyan, fontSize: 5.5.h, fontWeight: FontWeight.w600),),
                                    Text("Walls",style: GoogleFonts.dancingScript(fontSize: 5.5.h, fontWeight: FontWeight.w600, color: Colors.black),)
                                  ],
                                ),
                                Text("Version 1.0.1",style: GoogleFonts.catamaran(color: Colors.black),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Made with ", style: GoogleFonts.catamaran(color: Colors.black, fontSize: 2.h),),
                                    Icon(Icons.favorite, color: Colors.red,size: 2.h,),
                                    Text(" by Ashir",style: GoogleFonts.catamaran(color:Colors.black, fontSize: 2.h),)
                                  ],
                                ),
                              ],
                            )
                          ),
                        ),
                      ),
                    ),


                    //2ND CARD           
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.h),
                      child: Card(
                        elevation: 0.8,
                        color: Colors.cyan[50],
                        child: Container(
                          width: double.infinity,
                          height: 35.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child:Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 1.h,vertical: 1.h),
                              child: Column(
                                
                                children: [
                                  CircleAvatar(
                                    minRadius: 3.h,
                                    maxRadius: 6.h,
                                    
                                    backgroundImage: const AssetImage("images/dp.jpg")
                                  ),
                                  SizedBox(height: 1.h,),
                                  Text("Designer & Developer", style: GoogleFonts.catamaran(color: Colors.black,fontSize: 2.h),),
                                  SizedBox(height: 1.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(FlutterRemix.account_circle_fill, color: Colors.indigo,),
                                      Text("Syed Ashir Ali", style: GoogleFonts.catamaran(fontSize: 2.h,color:Colors.black),)
                                    ],
                                  ),
                                  SizedBox(height:0.5.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.location_on, color: Colors.pink[400],),
                                      Text("Karachi, Pakistan", style: GoogleFonts.catamaran(fontSize: 2.h, color: Colors.black),)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.5.h,
                                  ),
              
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: Icon(FontAwesomeIcons.facebook,color: const Color(0xff3B5998),size: 4.h,),
                                        onPressed:()async{
                                          await launchUrl(
                                            Uri.parse("https://www.facebook.com/axhir.ali/"),
                                            mode: LaunchMode.externalApplication
                                            );
                                          
                                        }
                                      ),
                                      
                                      IconButton(
                                        icon:Icon(FontAwesomeIcons.github,color: Colors.black,size:4.h),
                                        onPressed: ()async{
                                          await launchUrl(Uri.parse("http://www.github.com/ashir98"),
                                          mode: LaunchMode.externalNonBrowserApplication);
                                        },
                                      ),

                                      IconButton(
                                        icon: Icon(FontAwesomeIcons.youtube, color: Colors.red, size: 4.h),
                                        onPressed:() async{
                                          await launchUrl(Uri.parse("http://www.youtube.com/c/AshxGamer98",),
                                          mode: LaunchMode.externalApplication);
                                        }, 
                                      )
                                     
                                    ],
                                  ),
                                  
                                ],
                              ),
                            ),
                          )
                        ),
                      ),
                    ),
                    Text("Copyrights \u00a9 Syed Ashir Ali",style: GoogleFonts.catamaran(fontSize: 2.h),)
                    
                  ],
                ),
              )),
        );
    },);
      }
    
  }
