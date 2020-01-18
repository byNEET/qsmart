import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
                                          onTap: () => Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (_) =>
                                                      TambahUserPage(
                                                        data: f,
                                                      ))),
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
  final UserNew data;

  const TambahUserPage({Key key, this.data}) : super(key: key);
  @override
  _TambahUserPageState createState() => _TambahUserPageState();
}

class _TambahUserPageState extends State<TambahUserPage> {
  final RealdbApi api = RealdbApi();

  final _formkey = GlobalKey<FormState>();

  String idvalidatore;

  TextEditingController tid;
  TextEditingController tnama;

  @override
  void initState() {
    // TODOs: implement initState
    super.initState();
    idvalidatore = null;
    tid = TextEditingController(text: widget.data?.id ?? "");
    tnama = TextEditingController(text: widget.data?.nama ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data == null ? 'Tambah user' : 'Edit user'),
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
                  style: TextStyle(
                      color: (widget.data == null)
                          ? Colors.black
                          : Colors.black45),
                  enabled: (widget.data == null) ? true : false,
                  controller: tid,
                  decoration: InputDecoration(labelText: 'No. Anggota/ID'),
                  validator: (v) => idvalidatore,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.green,
                          child: SizedBox(
                            width: 100,
                            height: 40,
                            child: Center(
                                child: Text((widget.data == null)
                                    ? 'Simpan'
                                    : 'Update')),
                          ),
                          onPressed: () async {
                            var cekid = await api.cekIduser(tid.text);
                            setState(() {
                              if (widget.data == null) {
                                idvalidatore = cekid;
                              } else {
                                if (tid.text.length < 1) {
                                  idvalidatore = "id tidak boleh kosong";
                                } else {
                                  idvalidatore = null;
                                }
                              }
                            });
                            return _formkey.currentState.validate()
                                ? (widget.data == null)
                                    ? api
                                        .addUser(tid.text, tnama.text)
                                        .then((_) {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Tambah User id: ${tid.text} berhasil");
                                        return Navigator.pop(context);
                                      })
                                    : api.editUser(widget.data.id,
                                        {"nama": tnama.text}).then((_) {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Edit User id: ${widget.data.id} berhasil");
                                        return Navigator.pop(context);
                                      })
                                : null;
                          },
                        ),
                        Divider(),
                        (widget.data == null)
                            ? Container()
                            : RaisedButton(
                                onPressed: () {
                                  api.resetPass(widget.data.id).then((_) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "Reset password id: ${widget.data.id} berhasil");
                                    return Navigator.pop(context);
                                  });
                                },
                                color: Colors.yellow,
                                child: SizedBox(
                                    height: 40,
                                    width: 100,
                                    child: Center(child: Text('Reset Pass'))),
                              ),
                        Divider(),
                        (widget.data == null)
                            ? Container()
                            : RaisedButton(
                                onPressed: () {
                                  api.deletUser(widget.data.id).then((_) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "Hapus user id: ${widget.data.id} berhasil");
                                    return Navigator.pop(context);
                                  });
                                },
                                color: Colors.redAccent,
                                child: SizedBox(
                                    height: 40,
                                    width: 100,
                                    child: Center(child: Text('HAPUS !!'))),
                              ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _formkey.currentState.dispose();
    super.dispose();
  }
}
