import 'package:flutter/material.dart';
import 'package:qsmart/src/ui/tentang/Misi_tabbar.dart';
import 'package:qsmart/src/ui/tentang/Visi_tabbar.dart';
import 'package:qsmart/src/ui/tentang/gallery_tabbar.dart';
import 'package:qsmart/src/ui/tentang/sejarahSingkat_tabbar.dart';

class TentangIndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            bottom: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.black26,
              labelColor: Colors.black,
              tabs: [
                Tab(text: 'Visi'),
                Tab(text: 'Misi'),
                Tab(text: 'Sejarah Singkat'),
                Tab(text: 'Gallery'),
              ],
            ),
            title: Text('Q_Sm@rt'),
            centerTitle: true,
          ),
          body: TabBarView(
            children: [
              VisiTabbarItem(),
              MisiTabbarItem(),
              SejarahSingkatTabbarItem(),
              GalleryTabbarItem()
            ],
          ),
        ),
      ),
    );
  }
}
