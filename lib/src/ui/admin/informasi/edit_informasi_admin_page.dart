import 'package:flutter/material.dart';
import 'package:qsmart/src/ui/admin/informasi/informasi_admin_api.dart';
import 'package:qsmart/src/ui/informasi/informasi_model.dart';

class EditInformasiAdminPage extends StatefulWidget {
  final InformasiModel data;

  const EditInformasiAdminPage({Key key, this.data}) : super(key: key);

  @override
  _EditInformasiAdminPageState createState() => _EditInformasiAdminPageState();
}

class _EditInformasiAdminPageState extends State<EditInformasiAdminPage> {
  TextEditingController tectitel, tecbody;
  @override
  void initState() {
    super.initState();
    tectitel = TextEditingController(text: widget.data?.titel ?? '');
    tecbody = TextEditingController(text: widget.data?.body ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text((widget.data == null) ? 'Buat Informasi' : 'Edit Infromasi'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 14.0, left: 14.0),
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(14),
              ),
              child: TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: tectitel,
                minLines: 2,
                maxLines: 3,
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.only(right: 14.0, left: 14.0),
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(14),
              ),
              child: TextField(
                decoration: InputDecoration(labelText: "isi Informasi"),
                controller: tecbody,
                minLines: 5,
                maxLines: 10,
                maxLengthEnforced: true,
              ),
            ),
            (widget.data == null)
                ? FlatButton(
                    color: Colors.blue,
                    child: Text('Simpan'),
                    onPressed: () => InformasiAdminApi()
                        .buatInformasi(InformasiModel(
                            titel: tectitel.text, body: tecbody.text))
                        .then((_) => Navigator.pop(context)),
                  )
                : FlatButton(
                    color: Colors.blue,
                    child: Text('Simpan'),
                    onPressed: () => InformasiAdminApi()
                        .editInformasi(InformasiModel(
                            id: widget.data.id,
                            titel: tectitel.text,
                            body: tecbody.text))
                        .then((_) => Navigator.pop(context)),
                  )
          ],
        ),
      ),
    );
  }
}
