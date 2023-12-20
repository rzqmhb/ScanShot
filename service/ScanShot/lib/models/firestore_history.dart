import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreHistory {
  CollectionReference history =
      FirebaseFirestore.instance.collection('history');

  Future<List<Map>> getRiwayat() async {
    User? user = FirebaseAuth.instance.currentUser;
    List<Map> listData = [];

    if (user != null && user.email != null) {
      var snapshot = await history.get();
      var docs = snapshot.docs;
      for (var doc in docs) {
        var data = doc.data();
        if (data != null && data is Map) {
          var riwayat = data['riwayat'];
          if (riwayat is List) {
            for (var hasil in riwayat) {
              if (hasil is Map && hasil['email'] == user.email) {
                listData.add(hasil);
              }
            }
          }
        }
      }
    }
    return listData;
  }
}
