import 'package:flutter/material.dart';
import 'package:qsmart/src/helper/itemListGallery.dart';
import 'package:qsmart/src/widget/customImageView.dart';

class GalleryTabbarItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        itemCount: dummyListGallery.length,
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // childAspectRatio: 2.0 / 3.0,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          final gambar = dummyListGallery[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => CustomImageView(
                            images: gambar.urlgambar,
                            heroId: gambar.urlgambar,
                          )));
            },
            child: Container(
              width: 80.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                image: DecorationImage(
                  image: AssetImage(gambar.urlgambar),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
