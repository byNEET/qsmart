import 'package:flutter_html/flutter_html.dart';
import 'package:qsmart/src/model/materi_model.dart';
import 'package:flutter/material.dart';

class DetilMateri extends StatelessWidget {
  final MateriModel materi;
  DetilMateri({this.materi});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(materi.titel),
      ),
      body: SingleChildScrollView(
        child: Html(
          data: materi.isimateri,
        ),
      ),
    );
  }
}
