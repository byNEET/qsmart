import 'package:flutter/material.dart';

class CustomImageView extends StatelessWidget {
  final String heroId;
  final String images;
  CustomImageView({@required this.images, this.heroId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: ,
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.black12,
      body: Hero(
        tag: heroId,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            image: DecorationImage(
              image: AssetImage(images),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
