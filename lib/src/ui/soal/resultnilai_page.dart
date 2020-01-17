import 'package:qsmart/src/provider/jawabanprov.dart';
import 'package:qsmart/src/provider/soalRepositoryProv.dart';
import 'package:qsmart/src/service/realdb_api.dart';
import 'package:qsmart/src/ui/soal/newsoalnyapage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultNilaiPage extends StatelessWidget {
  final int nilai;
  final String idsoalcoeg;
  ResultNilaiPage({this.nilai, this.idsoalcoeg});

  final RealdbApi api = RealdbApi();

  @override
  Widget build(BuildContext context) {
    final jawabanProv = Provider.of<JawabanProv>(context);
    final soalProv = Provider.of<SoalRepositoryProv>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.repeat, color: Colors.white),
            label: Text(
              'Ulangi',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              jawabanProv.clear();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (_) => NewSoalnyaPage(
                            idSoalnya: idsoalcoeg,
                          )));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text("Nilai: ${jawabanProv.countNilai()}"),
              Divider(),
              Text('Pembahasan :'),
              Container(
                child: Column(
                    children: List<Widget>.generate(soalProv.soalnye.length - 1,
                        (index) {
                  var soalnye = soalProv.soalnye[index + 1];
                  return Container(
                    child: ListTile(
                      title: Text("${index + 1}. " + soalnye.pertanyaan),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(">> " + soalnye.jawaban[soalnye.jawabanbenar]),
                          Text(
                              "jawaban benar: ${soalnye.jawabanbenar}, jawaban kamu: ${jawabanProv.listJawaban[(index + 1).toString()]}, poin: ${jawabanProv.listPoint[(index + 1).toString()]}"),
                        ],
                      ),
                    ),
                  );
                })),
              ),
              Divider(),
              // Text("nilai = (sum(poin)/jumlah soal)x100"),
              // Text("${jawabanProv.countNilai()/soalProv.banksoal.soalnye.length-1}"),

              SizedBox(
                height: 50,
              ),
              RaisedButton(
                color: Colors.green[500],
                child: Text('OK'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
