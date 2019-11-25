import 'package:qsmart/src/helper/lang.dart';
import 'package:qsmart/src/ui/tentang/gallery_tabbar.dart';
import 'package:qsmart/src/ui/tentang/misi_tabbar.dart';
import 'package:qsmart/src/ui/tentang/sejarahQsmart_tabbar.dart';
import 'package:qsmart/src/ui/tentang/visi_tabbar.dart';
import 'package:flutter/material.dart';

class TentangIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tentang Q Smart"),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          // physics: ScrollPhysics(),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 25.0),
                width: MediaQuery.of(context).size.width,
                height: 180,
                // color: Colors.amberAccent,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      height: 100.0,
                      // color: Colors.black45,
                      decoration: BoxDecoration(
                        // color: Colors.black26,
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage('images/about.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5.0),
                      width: MediaQuery.of(context).size.width - 135.0,
                      height: 120.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            Lang.qsmart,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            Lang.filosofi,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13.0,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                child: DefaultTabController(
                    length: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          // height: MediaQuery.of(context).size.height,
                          child: TabBar(
                            // isScrollable: true,
                            labelPadding: EdgeInsets.only(left: 15, right: 15),
                            unselectedLabelColor: Colors.black12,
                            labelColor: Colors.black,
                            // indicatorColor: Colors.black26,
                            tabs: <Widget>[
                              Tab(icon: Text("Visi")),
                              Tab(icon: Text("Misi")),
                              Tab(icon: Text("Sejarah Q Smart")),
                              Tab(icon: Text("Gallery")),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          // height: 400,
                          // color: Colors.black45,
                          child: TabBarView(
                            children: <Widget>[
                              Visi(),
                              Misi(),
                              SejarahQsmart(),
                              Gallery(),
                            ],
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
