import 'package:qsmart/src/helper/lang.dart';
import 'package:flutter/material.dart';

class Misi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 400,
      padding: EdgeInsets.only(left: 12, right: 12, top: 10),
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              "Misi",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Text(
              "Rumah Belajar Q_SM@RT",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              Lang.misi,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 14.0,
                // fontWeight: FontWeight.w300,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
