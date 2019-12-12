import 'package:qsmart/src/model/usernew_model.dart';
import 'package:qsmart/src/service/realdb_api.dart';
import 'package:flutter/material.dart';

class UserManagementPage extends StatefulWidget {
  @override
  _UserManagementPageState createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
  final RealdbApi api = RealdbApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Management'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              FutureBuilder<List<UserNew>>(
                future: api.getListUser(),
                builder: (context, snapsut) {
                  return (snapsut.connectionState == ConnectionState.done)
                      ? (snapsut.hasData)
                          ? Container(
                              child: Column(
                                children: snapsut.data
                                    .map((f) => ListTile(
                                          title: Text(
                                            "No. Anggota: ${f.id}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                f.nama,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Divider(),
                                            ],
                                          ),
                                        ))
                                    .toList(),
                              ),
                            )
                          : Container(
                              child: Text('hasdata = false'),
                            )
                      : Container(
                          child: Center(child: CircularProgressIndicator()),
                        );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.add),
        onPressed: () {
          return Navigator.push(
                  context, MaterialPageRoute(builder: (_) => TambahUserPage()))
              .then((_) {
            setState(() {});
          });
        },
      ),
    );
  }
}

class TambahUserPage extends StatefulWidget {
  @override
  _TambahUserPageState createState() => _TambahUserPageState();
}

class _TambahUserPageState extends State<TambahUserPage> {
  final RealdbApi api = RealdbApi();

  final _formkey = GlobalKey<FormState>();

  TextEditingController tid;
  TextEditingController tnama;

  @override
  void initState() {
    // TODOs: implement initState
    super.initState();
    tid = TextEditingController(text: "");
    tnama = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah user'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                padding: EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: tid,
                  decoration: InputDecoration(labelText: 'No. Anggota/ID'),
                  validator: (v) => v.length < 1 ? 'tidak boleh kosong' : null,
                ),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                padding: EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: tnama,
                  decoration: InputDecoration(labelText: 'Nama User'),
                  validator: (v) => v.length < 1 ? 'tidak boleh kosong' : null,
                ),
              ),
              SizedBox(height: 25),
              RaisedButton(
                color: Colors.green,
                child: SizedBox(
                  width: 100,
                  height: 40,
                  child: Center(child: Text('Simpan')),
                ),
                onPressed: () => _formkey.currentState.validate()
                    ? api
                        .addUser(tid.text, tnama.text)
                        .then((_) => Navigator.pop(context))
                    : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
