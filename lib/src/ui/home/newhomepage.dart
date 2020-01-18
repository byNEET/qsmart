// import 'package:adminkursus/src/helper/Screen.dart';
import 'dart:convert';

import 'package:qsmart/src/provider/newloginprov.dart';
import 'package:qsmart/src/service/realdb_api.dart';
import 'package:qsmart/src/ui/admin/adminhome.dart';
import 'package:qsmart/src/ui/home/editprofilpage.dart';
import 'package:qsmart/src/ui/infoguru/infoguruindex.dart';
import 'package:qsmart/src/ui/informasi/list_informasi_page.dart';
import 'package:qsmart/src/ui/jadwal/jadwal_page.dart';
import 'package:qsmart/src/ui/materi/listmateri_page.dart';
import 'package:qsmart/src/ui/soal/carisoalpage.dart';
import 'package:qsmart/src/ui/tentang/tentangIndex_page.dart';
import 'package:qsmart/src/widget/carousel_movie_widget.dart';

//import 'package:carousel_pro/carousel_pro.dart';

// import 'package:adminkursus/src/ui/tentang/tentang_view.dart';
// import 'package:adminkursus/src/widgets/carousel_movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewHomePage extends StatefulWidget {
  @override
  _NewHomePageState createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  @override
  Widget build(BuildContext context) {
    // final newuserprov = Provider.of<NewLoginProv>(context);
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.amber,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          // bottomOpacity: 0.2,
          title: Text(
            "Q Smart",
            style: TextStyle(
              fontFamily: "Poppins-Bold",
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text("Admin"),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => AdminHomePage())),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CarouselItem(),
              Container(
                padding: EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.yellow[700],
                ),
                margin: EdgeInsets.all(12.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      child: Text(
                        'Menu Utama',
                        style: TextStyle(
                          fontFamily: "Poppins-Bold",
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CariSoalPage()));
                            },
                            child: Container(
                              width: 145,
                              height: 100,
                              // margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.cyan,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'images/carisoal.png',
                                    height: 40,
                                    width: 40,
                                    colorBlendMode: BlendMode.lighten,
                                  ),
                                  Text(
                                    'Cari soal',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins-Medium",
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        JadwalPelajaran()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 145,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.purple,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.schedule,
                                      size: 35, color: Colors.white),
                                  Text(
                                    'Jadwal\nPelajaran',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins-Medium",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ListMateriPage())),
                            child: Container(
                              width: 145,
                              height: 100,
                              // margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'images/tips.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                  Text(
                                    'Materi',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins-Medium",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        TentangIndexPage()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 145,
                              height: 100,
                              // margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.pink,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'images/about.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                  Text(
                                    'Tentang Q Smart',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: "Poppins-Medium",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ListInformasiPage()));
                            },
                            child: Container(
                              width: 145,
                              height: 100,
                              // margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.teal,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'images/wisuda.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                  Text(
                                    'Informasi sekolah atau perguruan tinggi',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins-Medium",
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        InfoGuruIndex()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 145,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'images/panduan.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                  Text(
                                    'Info Guru',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins-Medium",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () async {
                              var pref = await SharedPreferences.getInstance();
                              var akun = pref.getString("akun");
                              Map user = json.decode(akun);
                              var anunya = await RealdbApi().getUserDetil(user['id']);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => EditProfilPage(
                                        user: anunya,
                                      )));
                            },
                            child: Container(
                              width: 145,
                              height: 100,
                              // margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.orange,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.settings,
                                      size: 35, color: Colors.white),
                                  Text(
                                    'Pengaturan',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins-Medium",
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Provider.of<NewLoginProv>(context).usernewLogout();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 145,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.redAccent,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.exit_to_app,
                                      size: 35, color: Colors.white),
                                  Text(
                                    'Sign Out',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins-Medium",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class CarouselItem extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(bottom: 20.0),
//       width: Screen.width(context),
//       height: 200.0,
//       child: Carousel(
//         images: [
//           NetworkImage(
//               'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
//           NetworkImage(
//               'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
//         ],
//         dotSize: 4.0,
//         dotSpacing: 15.0,
//         dotColor: Colors.lightGreenAccent,
//         indicatorBgPadding: 5.0,
//         dotBgColor: Colors.red.withOpacity(0.5),
//         borderRadius: true,
//       ),
//     );
//   }
// }

// import 'package:adminkursus/src/provider/newloginprov.dart';
// import 'package:adminkursus/src/ui/admin/adminhome.dart';
// import 'package:adminkursus/src/ui/soal/carisoalpage.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class NewHomePage extends StatefulWidget {
//   @override
//   _NewHomePageState createState() => _NewHomePageState();
// }

// class _NewHomePageState extends State<NewHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     final newuserprov = Provider.of<NewLoginProv>(context);
//     return SafeArea(
//           child: Scaffold(
//             appBar: AppBar(actions: <Widget>[RaisedButton(child: Text("admen"),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>AdminHomePage())),)],),
//         body: SingleChildScrollView(
//           child: Column(children: <Widget>[
//             SizedBox(height: 100,),
//             Text(newuserprov.userNew.nama),
//             Text(newuserprov.userNew.id),

//             Container(child: Card(child: Text('carousel'),),height: 100,width: double.infinity,),
//             Container(child: Card(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 InkWell(
//                   onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (_)=>CariSoalPage())),
//                     child: Column(children: <Widget>[
//                     Icon(Icons.add_circle),
//                     Text('Cari soal')
//                   ],),
//                 ),
//                 Column(children: <Widget>[
//                   Icon(Icons.add_circle),
//                   Text('panduan')
//                 ],),
//                 Column(children: <Widget>[
//                   Icon(Icons.add_circle),
//                   Text('tips')
//                 ],),
//                 Column(children: <Widget>[
//                   Icon(Icons.add_circle),
//                   Text('tentang')
//                 ],),
//               ],
//             ),),),
//             RaisedButton(child: Text('LogOut'),onPressed: ()=>Provider.of<NewLoginProv>(context).usernewLogout(),)
//           ],),
//         ),
//       ),
//     );
//   }
// }
