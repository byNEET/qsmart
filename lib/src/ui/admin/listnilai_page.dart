import 'package:qsmart/src/model/banksoall_quicktype.dart';
import 'package:qsmart/src/model/listbanksoal_model.dart';
import 'package:flutter/material.dart';
import 'package:qsmart/src/service/realdb_api.dart';

class ListNilaiPage extends StatelessWidget {
  final Listbanksoal dsoal;
  ListNilaiPage({this.dsoal});

  final api = RealdbApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List nilai'),
      ),
      body: FutureBuilder<List<Selesai>>(
        future: api.getListNilaiSelesai(dsoal.id),
        builder: (context, snapsut) {
          if (snapsut.connectionState == ConnectionState.done) {
            print(snapsut.hasData);
            print('apaaaaaaaaaaaaaaaaaaaaaaaaaaa');
            if (snapsut.hasData) {
              print(snapsut.data[0].uid);
              return (snapsut.data[0].uid == null)
                  ? Center(
                      child: Text('data null'),
                    )
                  : BodyListNilai(
                      data: snapsut.data,
                    );
            } else {
              return Center(
                child: Text('belum ada yg selesai'),
              );
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class BodyListNilai extends StatelessWidget {
  final List<Selesai> data;
  BodyListNilai({this.data});
  @override
  Widget build(BuildContext context) {
    print(data[0]);
    return SingleChildScrollView(
        child: Column(
      children: data
          .map((f) => ListTile(
                title: Text(f.uid),
                subtitle: Text(f.nama ?? ''),
                trailing: Text(f.nilai.toString()),
              ))
          .toList(),
    ));
  }
}
