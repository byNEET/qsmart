import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qsmart/src/ui/jadwal/jadwalModel.dart';
import 'package:qsmart/src/ui/jadwal/selasa/tambahSelasa.dart';

import 'package:qsmart/src/ui/jadwal/selasa/ubahSelasa.dart';

class Selasa extends StatefulWidget {
  @override
  _SelasaState createState() => _SelasaState();
}

class _SelasaState extends State<Selasa> {
  FirebaseDatabase _database = FirebaseDatabase.instance;
  String nodeName = "jadwal/selasa";
  String pengajar;
  List<JadwalModel> jadwalSelasa = <JadwalModel>[];

  _childAdded(Event event) {
    setState(() {
      jadwalSelasa.add(JadwalModel.fromSnapshot(event.snapshot));
    });
  }

  void _childRemoves(Event event) {
    var deletedInformasiDarah = jadwalSelasa.singleWhere((informasi) {
      return informasi.key == event.snapshot.key;
    });

    setState(() {
      jadwalSelasa.removeAt(jadwalSelasa.indexOf(deletedInformasiDarah));
    });
  }

  void _childChanged(Event event) {
    var changedPost = jadwalSelasa.singleWhere((post) {
      return post.key == event.snapshot.key;
    });

    setState(() {
      jadwalSelasa[jadwalSelasa.indexOf(changedPost)] =
          JadwalModel.fromSnapshot(event.snapshot);
    });
  }

  @override
  void initState() {
    super.initState();
    _database.reference().child(nodeName).onChildAdded.listen(_childAdded);
    _database.reference().child(nodeName).onChildRemoved.listen(_childRemoves);
    _database.reference().child(nodeName).onChildChanged.listen(_childChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selasa'),
        centerTitle: true,
      ),
      body: Container(
        child: jadwalSelasa.length > 0
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: FirebaseAnimatedList(
                  query: _database.reference().child(nodeName),
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation animation, int index) {
                    final data = jadwalSelasa[index];
                    return InkWell(
                      onTap: () {
                        showSelasaDialog(context, data);
                      },
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                        margin: EdgeInsets.only(
                            left: 15, right: 15, top: 8, bottom: 8),
                        child: Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 100,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(17),
                                      image: DecorationImage(
                                        image: NetworkImage(data.urlgambar),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.timer),
                                        SizedBox(width: 10),
                                        Text(
                                          data.jam,
                                          style: GoogleFonts.arvo(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.person),
                                        SizedBox(width: 10),
                                        Text(
                                          data.guru,
                                          style: GoogleFonts.lato(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.book),
                                        SizedBox(width: 10),
                                        Text(
                                          data.pelajaran,
                                          style: GoogleFonts.lato(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.location_on),
                                        SizedBox(width: 10),
                                        Container(
                                          width: 180,
                                          child: Text(
                                            data.ruangan,
                                            style: GoogleFonts.arvo(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            )),
                      ),
                    );
                  },
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => TambahSelasa()));
        },
      ),
    );
  }
}

void showSelasaDialog(context, data) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Pilih Tindakan"),
          content: Container(
            height: 127,
            child: Column(
              children: <Widget>[
                RaisedButton.icon(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  icon: Icon(Icons.edit, color: Colors.white),
                  color: Colors.blue,
                  label: SizedBox(
                    width: 100,
                    height: 50,
                    child: Center(
                        child: Text("Ubah",
                            style: TextStyle(
                              color: Colors.white,
                            ))),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => UbahSelasa(
                                  jadwal: data,
                                )));
                  },
                ),
                SizedBox(height: 20),
                RaisedButton.icon(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  icon: Icon(Icons.delete, color: Colors.white),
                  color: Colors.red,
                  label: SizedBox(
                    width: 100,
                    height: 50,
                    child: Center(
                      child: Text("Hapus",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ),
                  onPressed: () {
                    FirebaseDatabase.instance
                        .reference()
                        .child('jadwal')
                        .child('selasa')
                        .child(data.uid)
                        .remove()
                        .then((del) {
                      Navigator.pop(context);
                    });
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Batal"),
            ),
          ],
        );
      });
}
