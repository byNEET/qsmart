import 'package:flutter/material.dart';
import 'package:qsmart/src/helper/lang.dart';

class VisiTabbarItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 25),
            Text(
              "Visi",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
                top: 10,
                bottom: 10,
              ),
              child: Text(
                Lang.visi,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
