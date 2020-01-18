import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qsmart/src/ui/informasi/detil_informasi_page.dart';
import 'package:qsmart/src/ui/informasi/informasi_api.dart';
import 'package:qsmart/src/ui/informasi/informasi_model.dart';

class ListInformasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi'),
      ),
      body: FutureBuilder<List<InformasiModel>>(
        future: InformasiApi().getListInformasi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: snapshot.data
                      .map(
                        (data) => Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (_) => DetilInformasiPage(
                                            data: data,
                                          )));
                            },
                            title: Text(
                              data.titel,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('Update: ' +
                                DateFormat('yyyy/MM/dd . kk:mm')
                                    .format(data.updateat)),
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            } else {
              return Center(
                child: Text('data tidak ada'),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
