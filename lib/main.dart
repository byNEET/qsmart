import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qsmart/src/provider/buatPaketSoalProv.dart';
import 'package:qsmart/src/provider/buatsoalprov.dart';
import 'package:qsmart/src/provider/jawabanprov.dart';
import 'package:qsmart/src/provider/materiprov.dart';
import 'package:qsmart/src/provider/newloginprov.dart';
import 'package:qsmart/src/provider/searchprov.dart';
import 'package:qsmart/src/provider/soalRepositoryProv.dart';
import 'package:qsmart/src/ui/loginv2/logincasepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        title: 'QSmart',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginCasePage(),
      ),
      providers: [
        ChangeNotifierProvider(builder: (_) => JawabanProv()),
        ChangeNotifierProvider(builder: (_) => SearchProv()),
        ChangeNotifierProvider(builder: (_) => BuatPaketSoalProv()),
        ChangeNotifierProvider(builder: (_) => BuatSoalProv()),
        ChangeNotifierProvider(builder: (_) => SoalRepositoryProv()),
        ChangeNotifierProvider(builder: (_) => NewLoginProv()),
        ChangeNotifierProvider(builder: (_) => MateriProv())

        // ChangeNotifierProvider(
        //   builder: (_)=> UserRepository.instance(),
        // ),
      ],
    );
  }
}
