import 'package:qsmart/src/helper/lang.dart';
import 'package:flutter/material.dart';

class SejarahQsmart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 400,
      padding: EdgeInsets.only(left: 12, right: 12, top: 10),
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              Lang.sejarahJudul,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(),
          Container(
            // height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Text(
                  Lang.sejarahIsi1,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14.0,
                    // fontWeight: FontWeight.w300,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  Lang.sejarahIsi2,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14.0,
                    // fontWeight: FontWeight.w300,
                    color: Colors.black87,
                  ),
                ),
                // SizedBox(height: 8),
                // Text(
                //   Lang.sejarahIsi3,
                //   textAlign: TextAlign.justify,
                //   style: TextStyle(
                //     fontSize: 14.0,
                //     // fontWeight: FontWeight.w300,
                //     color: Colors.black87,
                //   ),
                // ),
                // SizedBox(height: 8),
                // Text(
                //   Lang.sejarahIsi4,
                //   textAlign: TextAlign.justify,
                //   style: TextStyle(
                //     fontSize: 14.0,
                //     // fontWeight: FontWeight.w300,
                //     color: Colors.black87,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
