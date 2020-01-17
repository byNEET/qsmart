import 'package:qsmart/src/helper/Screen.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      width: Screen.width(context),
      height: 250.0,
      child: Carousel(
        images: [
          AssetImage('images/gallery/1.jpeg'),
          AssetImage('images/gallery/2.jpeg'),
          AssetImage('images/gallery/3.jpeg'),
          AssetImage('images/gallery/5.jpeg'),
          AssetImage('images/gallery/7.jpeg'),
          AssetImage('images/gallery/8.jpeg'),
          AssetImage('images/gallery/9.jpeg'),
          AssetImage('images/gallery/10.jpeg'),
        ],
        dotSize: 4.0,
        dotSpacing: 15.0,
        dotColor: Colors.lightGreenAccent,
        indicatorBgPadding: 5.0,
        dotBgColor: Colors.red.withOpacity(0.5),
        borderRadius: true,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25))),
    );
  }
}
