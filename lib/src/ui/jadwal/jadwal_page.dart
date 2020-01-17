import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qsmart/src/ui/jadwal/senin/senin.dart';
import 'package:qsmart/src/ui/jadwal/selasa/selasa.dart';
import 'package:qsmart/src/ui/jadwal/rabu/rabu.dart';
import 'package:qsmart/src/ui/jadwal/kamis/kamis.dart';
import 'package:qsmart/src/ui/jadwal/jumat/jumat.dart';
import 'package:qsmart/src/ui/jadwal/sabtu/sabtu.dart';

class JadwalPelajaran extends StatefulWidget {
  @override
  _JadwalPelajaranState createState() => _JadwalPelajaranState();
}

class _JadwalPelajaranState extends State<JadwalPelajaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(34),
                    bottomRight: Radius.circular(34)),
                image: DecorationImage(
                  image: AssetImage('images/bgjadwal.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(left: 20, top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Image.asset(
                      'images/logoo.png',
                      width: 90,
                      height: 180,
                    ),
                    Text('Jadwal KBM\nRumah Belajar Q-Smart',
                        style: GoogleFonts.lato(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            textStyle: TextStyle(color: Colors.white)))
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Senin()));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17)),
                            elevation: 8,
                            child: Container(
                              padding: EdgeInsets.only(left: 20),
                              width: 150,
                              height: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.asset(
                                    'images/equation.png',
                                    width: 55,
                                    height: 55,
                                  ),
                                  Text('Senin',
                                      style: GoogleFonts.arvo(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        // textStyle: TextStyle(color: Colors.white),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Selasa()));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17)),
                            elevation: 8,
                            child: Container(
                              padding: EdgeInsets.only(left: 20),
                              width: 150,
                              height: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.asset(
                                    'images/science.png',
                                    width: 55,
                                    height: 55,
                                  ),
                                  Text('Selasa',
                                      style: GoogleFonts.arvo(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        // textStyle: TextStyle(color: Colors.white),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => Rabu()));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17)),
                            elevation: 8,
                            child: Container(
                              padding: EdgeInsets.only(left: 20),
                              width: 150,
                              height: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.asset(
                                    'images/telescope.png',
                                    width: 55,
                                    height: 55,
                                  ),
                                  Text('Rabu',
                                      style: GoogleFonts.arvo(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        // textStyle: TextStyle(color: Colors.white),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Kamis()));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17)),
                            elevation: 8,
                            child: Container(
                              padding: EdgeInsets.only(left: 20),
                              width: 150,
                              height: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.asset(
                                    'images/triangle.png',
                                    width: 55,
                                    height: 55,
                                  ),
                                  Text('Kamis',
                                      style: GoogleFonts.arvo(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        // textStyle: TextStyle(color: Colors.white),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Jumat()));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17)),
                            elevation: 8,
                            child: Container(
                              padding: EdgeInsets.only(left: 20),
                              width: 150,
                              height: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.asset(
                                    'images/encyclopedia.png',
                                    width: 55,
                                    height: 55,
                                  ),
                                  Text('Jumat',
                                      style: GoogleFonts.arvo(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        // textStyle: TextStyle(color: Colors.white),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Sabtu()));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17)),
                            elevation: 8,
                            child: Container(
                              padding: EdgeInsets.only(left: 20),
                              width: 150,
                              height: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.asset(
                                    'images/mortarboard.png',
                                    width: 55,
                                    height: 55,
                                  ),
                                  Text('Sabtu',
                                      style: GoogleFonts.arvo(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        // textStyle: TextStyle(color: Colors.white),
                                      ))
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
            )
          ],
        ),
      ),
    ));
  }
}
