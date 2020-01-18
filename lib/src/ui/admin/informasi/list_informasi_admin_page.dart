import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qsmart/src/ui/admin/informasi/edit_informasi_admin_page.dart';
import 'package:qsmart/src/ui/informasi/informasi_model.dart';

import 'informasi_admin_api.dart';

class ListInformasiAdminPage extends StatefulWidget {
  @override
  _ListInformasiAdminPageState createState() => _ListInformasiAdminPageState();
}

class _ListInformasiAdminPageState extends State<ListInformasiAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi (Admin)'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.add),
        onPressed: () async => Navigator.push(context,
                CupertinoPageRoute(builder: (_) => EditInformasiAdminPage()))
            .then((_) {
          setState(() {});
        }),
      ),
      body: FutureBuilder<List<InformasiModel>>(
        future: InformasiAdminApi().getListInformasiAdmin(),
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
                            trailing: Container(
                              width: 100,
                              color: data.published == true
                                  ? Colors.pinkAccent
                                  : Colors.lightBlue,
                              child: Center(
                                child: data.published == true
                                    ? FlatButton(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(Icons.close,
                                                color: Colors.white),
                                            Text(
                                              'UNPUBLISH',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        onPressed: () => InformasiAdminApi()
                                            .unpublishInformasi(data.id)
                                            .then((_) {
                                          setState(() {});
                                        }),
                                      )
                                    : FlatButton(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.send,
                                              color: Colors.white,
                                            ),
                                            Text('PUBLISH',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ],
                                        ),
                                        onPressed: () => InformasiAdminApi()
                                            .publishInformasi(data.id)
                                            .then((_) {
                                          setState(() {});
                                        }),
                                      ),
                              ),
                            ),
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (_) => EditInformasiAdminPage(
                                            data: data,
                                          ))).then((_) {
                                setState(() {});
                              });
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
