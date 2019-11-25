import 'package:qsmart/src/helper/itemListGallery.dart';
import 'package:flutter/material.dart';

class Gallery extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        // controller: _scrollController,
        itemCount: itemListGallery.length,
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2.0 / 3.0,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: kToolbarHeight + 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black38),
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(itemListGallery[index].urlgambar),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
