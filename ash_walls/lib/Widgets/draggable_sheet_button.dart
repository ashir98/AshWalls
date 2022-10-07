import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class SheetButton extends StatelessWidget {
  IconData icon;
  String buttonText;

  SheetButton({Key? key, required this.icon, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 7.h,
          width: 7.h,
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
        Text(buttonText)
      ],
    );
  }
}
