import 'package:qsmart/src/service/fb_databse_ref.dart';
import 'package:qsmart/src/ui/informasi/informasi_model.dart';

class InformasiAdminApi with Fbdatabase {
  //admin-------------------------------------------------------------------

  Future<List<InformasiModel>> getListInformasiAdmin() async {
    try {
      var data = await ref.child('informasi').once();
      if (data.value != null) {
        Map oke = data.value;
        List<InformasiModel> coeg = [];
        oke.forEach((k, v) => coeg.add(InformasiModel.fromJson(k, v)));
        coeg.sort((a, b) => -a.updateat.compareTo(b.updateat));
        return coeg;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> buatInformasi(InformasiModel data) async {
    await ref.child('informasi').push().set(data.toJson());
  }

  Future<void> editInformasi(InformasiModel data) async {
    await ref.child('informasi/${data.id}').update(data.toJsonEdit());
  }

  Future<void> publishInformasi(String id) async {
    await ref.child('informasi/$id/published').set(true);
  }

  Future<void> unpublishInformasi(String id) async {
    await ref.child('informasi/$id/published').set(false);
  }
}
