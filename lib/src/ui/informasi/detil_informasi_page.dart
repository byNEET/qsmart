import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:qsmart/src/ui/informasi/informasi_model.dart';

class DetilInformasiPage extends StatelessWidget {
  final InformasiModel data;

  const DetilInformasiPage({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DateFormat('yyyy/MM/dd . kk:mm').format(data.updateat)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                data.titel,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),
            Html(
              data: data.body,
            ),
          ],
        ),
      ),
    );
  }
}
