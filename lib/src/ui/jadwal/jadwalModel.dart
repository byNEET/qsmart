import 'package:firebase_database/firebase_database.dart';

class JadwalModel {
  static const KEY = "key";
  static const JAM = "jam";
  static const GURU = "guru";
  static const PELAJARAN = "pelajaran";
  static const RUANGAN = "ruangan";
  static const URLGAMBAR = "urlgambar";
  static const UID = "uid";

  String key;
  String jam;
  String guru;
  String pelajaran;
  String ruangan;
  String urlgambar;
  String uid;

  JadwalModel(
    this.jam,
    this.guru,
    this.pelajaran,
    this.ruangan,
    this.urlgambar,
    this.uid,
  );

  JadwalModel.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        jam = snapshot.value[JAM],
        guru = snapshot.value[GURU],
        pelajaran = snapshot.value[PELAJARAN],
        ruangan = snapshot.value[RUANGAN],
        urlgambar = snapshot.value[URLGAMBAR],
        uid = snapshot.value[UID];

  Map toMap() {
    return {
      JAM: jam,
      GURU: guru,
      PELAJARAN: pelajaran,
      RUANGAN: ruangan,
      URLGAMBAR: urlgambar,
      UID: uid,
      KEY: key,
    };
  }
}
