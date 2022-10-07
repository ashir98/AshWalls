// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CategoryTile extends StatelessWidget {
  String catName;
  String catImage;
  CategoryTile({Key? key, required this.catName, required this.catImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 0.5.h, vertical: 0.5.h),
      
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image:  DecorationImage(
                image: AssetImage(catImage),
                fit: BoxFit.fill
              )
            ),
          height: 130,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text(catName, style:  GoogleFonts.catamaran(fontWeight: FontWeight.w700, fontSize: 3.h, color: Colors.white),)),
          ),
        ),
      );
    
  }
}