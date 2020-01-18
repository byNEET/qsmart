import '../../service/fb_databse_ref.dart';
import 'informasi_model.dart';

class InformasiApi with Fbdatabase {
  Future<List<InformasiModel>> getListInformasi() async {
    try {
      var data = await ref
          .child('informasi')
          .orderByChild('published')
          .equalTo(true)
          .once();
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
}
