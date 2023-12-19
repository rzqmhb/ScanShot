import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreHistory {
  CollectionReference history =
      FirebaseFirestore.instance.collection('history');

  Future<void> getRiwayat() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && user.email != null) {
      var snapshot = await history.get();
      var docs = snapshot.docs;
      for (var doc in docs) {
        var data = doc.data();
        if (data != null && data is Map) {
          var riwayat = data['riwayat'];
          if (riwayat is List) {
            for (var item in riwayat) {
              if (item is Map && item['email'] == user.email) {
                print(item);
              }
            }
          }
        }
      }
    }
  }
}
