import 'package:fluttertoast/fluttertoast.dart';
import 'package:qsmart/src/model/usernew_model.dart';
import 'package:flutter/material.dart';
import 'package:qsmart/src/service/realdb_api.dart';

class EditProfilPage extends StatefulWidget {
  final UserNew user;

  const EditProfilPage({Key key, this.user}) : super(key: key);
  @override
  _EditProfilPageState createState() => _EditProfilPageState();
}

class _EditProfilPageState extends State<EditProfilPage> {
  final _formkei = GlobalKey<FormState>();

  TextEditingController tpass1, tpass2, tpassold;
  @override
  void initState() {
    super.initState();
    tpass1 = TextEditingController();
    tpass2 = TextEditingController();
    tpassold = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildTextformfield(
        {TextEditingController controller,
        String label,
        FormFieldValidator<String> validator}) {
      return TextFormField(
        obscureText: true,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
        ),
        validator: validator,
      );
    }

    return Form(
      key: _formkei,
      child: Scaffold(
        appBar: AppBar(
          title: Text('edit profil'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text('No. Anggota: ${widget.user.id}'),
                            Text(widget.user.nama),
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    _buildTextformfield(
                      controller: tpass1,
                      label: 'New Password',
                      validator: (v) =>
                          v.length < 5 ? "password minimal 5 karakter" : null,
                    ),
                    _buildTextformfield(
                      controller: tpass2,
                      label: 'Ulangi password',
                      validator: (v) =>
                          v != tpass1.text ? "password tidak sama" : null,
                    ),
                    Divider(),
                    _buildTextformfield(
                        controller: tpassold,
                        label: 'Password lama (sekarang)',
                        validator: (v) =>
                            v != widget.user.pass ? "password salah" : null),
                    Divider(),
                    RaisedButton(
                      child: Text("Edit Password"),
                      onPressed: () {
                        if (_formkei.currentState.validate()) {
                          RealdbApi()
                              .ubahPassword(widget.user.id, tpass1.text)
                              .then((_) {
                            Fluttertoast.showToast(msg: 'Ubah password sukses');
                            Navigator.pop(context);
                          });
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
