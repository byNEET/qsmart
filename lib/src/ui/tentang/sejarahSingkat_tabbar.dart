import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qsmart/src/helper/lang.dart';

class SejarahSingkatTabbarItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 25),
            Text("Misi",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                )),
            Divider(),
            Container(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
                top: 10,
                bottom: 10,
              ),
              child: Column(
                children: <Widget>[
                  Text(Lang.sejarahJudul,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                  SizedBox(height: 15),
                  Text(Lang.sejarahIsi1,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      )),
                  Text(Lang.sejarahIsi2,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      )),
                  Text(Lang.sejarahIsi3,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
