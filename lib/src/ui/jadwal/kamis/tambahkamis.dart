import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Tambahkamis extends StatefulWidget {
  @override
  _TambahkamisState createState() => _TambahkamisState();
}

class _TambahkamisState extends State<Tambahkamis> {
  final jamCtrl = TextEditingController();
  final pelajaranCtrl = TextEditingController();
  final ruanganCtrl = TextEditingController();
  String pengajar;
  List<DropdownMenuItem<String>> pengajarItems = [
    new DropdownMenuItem(
      child: Text("R. Ananta WK"),
      value: "R. Ananta WK",
    ),
    new DropdownMenuItem(
      child: Text("Darlena, S.Si., M.Sc"),
      value: "Darlena, S.Si., M.Sc",
    ),
    new DropdownMenuItem(
      child: Text("Janiati, S.Si"),
      value: "Janiati, S.Si",
    ),
    new DropdownMenuItem(
      child: Text("Titin, A.Md"),
      value: "Titin, A.Md",
    ),
    new DropdownMenuItem(
      child: Text("Yulita"),
      value: "Yulita",
    ),
    new DropdownMenuItem(
      child: Text("Puji Nina, S.Pd"),
      value: "Puji Nina, S.Pd",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Jadwal"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: <Widget>[
            SizedBox(height: 40),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Jam berapa?',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
              ),
              validator: (val) => val.isEmpty ? "Isi jam jadwal dulu" : null,
              controller: jamCtrl,
            ),
            SizedBox(height: 13),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Pelajaran apa?',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
              ),
              validator: (val) => val.isEmpty ? "Isi pelajaran dulu" : null,
              controller: pelajaranCtrl,
            ),
            SizedBox(height: 13),
            DropdownButton(
              items: pengajarItems,
              hint: Text("Nama Pengajar"),
              value: pengajar,
              onChanged: (val) {
                setState(() {
                  pengajar = val;
                });
              },
            ),
            SizedBox(height: 13),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Ruangan',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
              ),
              validator: (val) => val.isEmpty ? "Isi ruangan dulu" : null,
              controller: ruanganCtrl,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        backgroundColor: Colors.purple,
        onPressed: () {
          var uid = FirebaseDatabase.instance
              .reference()
              .child('jadwal')
              .child('kamis')
              .push();
          if (pengajar == "R. Ananta WK") {
            FirebaseDatabase.instance
                .reference()
                .child('jadwal')
                .child('kamis')
                .child(uid.key)
                .set({
              "uid": uid.key,
              "jam": jamCtrl.text,
              "pelajaran": pelajaranCtrl.text,
              "guru": pengajar,
              "ruangan": ruanganCtrl.text,
              "urlgambar":
                  "https://firebasestorage.googleapis.com/v0/b/qsmart-2019.appspot.com/o/ananta.jpg?alt=media&token=c5ce5b74-567f-47f6-ae28-8d2d5f437de3"
            }).then((onValue) {
              Navigator.pop(context);
            });
          } else if (pengajar == "Darlena, S.Si., M.Sc") {
            FirebaseDatabase.instance
                .reference()
                .child('jadwal')
                .child('kamis')
                .child(uid.key)
                .set({
              "uid": uid.key,
              "jam": jamCtrl.text,
              "pelajaran": pelajaranCtrl.text,
              "guru": pengajar,
              "ruangan": ruanganCtrl.text,
              "urlgambar":
                  "https://firebasestorage.googleapis.com/v0/b/qsmart-2019.appspot.com/o/kaklena.jpg?alt=media&token=67641f96-6a4d-4509-a099-971dbfc11f13"
            }).then((onValue) {
              Navigator.pop(context);
            });
          } else if (pengajar == "Janiati, S.Si") {
            FirebaseDatabase.instance
                .reference()
                .child('jadwal')
                .child('kamis')
                .child(uid.key)
                .set({
              "uid": uid.key,
              "jam": jamCtrl.text,
              "pelajaran": pelajaranCtrl.text,
              "guru": pengajar,
              "ruangan": ruanganCtrl.text,
              "urlgambar":
                  "https://firebasestorage.googleapis.com/v0/b/qsmart-2019.appspot.com/o/janiati.jpg?alt=media&token=55e60b12-c21c-4157-afa6-9a7aa86e8b3d"
            }).then((onValue) {
              Navigator.pop(context);
            });
          } else if (pengajar == "Titin, A.Md") {
            FirebaseDatabase.instance
                .reference()
                .child('jadwal')
                .child('kamis')
                .child(uid.key)
                .set({
              "uid": uid.key,
              "jam": jamCtrl.text,
              "pelajaran": pelajaranCtrl.text,
              "guru": pengajar,
              "ruangan": ruanganCtrl.text,
              "urlgambar":
                  "https://firebasestorage.googleapis.com/v0/b/qsmart-2019.appspot.com/o/titin.jpg?alt=media&token=53d28245-d43c-40d5-8f5d-a5b1d6feba9a"
            }).then((onValue) {
              Navigator.pop(context);
            });
          } else if (pengajar == "Yulita") {
            FirebaseDatabase.instance
                .reference()
                .child('jadwal')
                .child('kamis')
                .child(uid.key)
                .set({
              "uid": uid.key,
              "jam": jamCtrl.text,
              "pelajaran": pelajaranCtrl.text,
              "guru": pengajar,
              "ruangan": ruanganCtrl.text,
              "urlgambar":
                  "https://firebasestorage.googleapis.com/v0/b/qsmart-2019.appspot.com/o/yulita.jpg?alt=media&token=24fb98ee-514f-4a9f-8895-43292d370b06"
            }).then((onValue) {
              Navigator.pop(context);
            });
          } else if (pengajar == "Puji Nina, S.Pd") {
            FirebaseDatabase.instance
                .reference()
                .child('jadwal')
                .child('kamis')
                .child(uid.key)
                .set({
              "uid": uid.key,
              "jam": jamCtrl.text,
              "pelajaran": pelajaranCtrl.text,
              "guru": pengajar,
              "ruangan": ruanganCtrl.text,
              "urlgambar":
                  "https://firebasestorage.googleapis.com/v0/b/qsmart-2019.appspot.com/o/nina.jpg?alt=media&token=28a5765b-0cd4-4877-90b6-7a62fff6422b"
            }).then((onValue) {
              Navigator.pop(context);
            });
          }
        },
      ),
    );
  }
}
