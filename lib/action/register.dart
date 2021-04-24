import 'package:cloud_firestore/cloud_firestore.dart';

class ActionRegis {
// ignore: non_constant_identifier_names
  String collection_register = 'kpop';

// ignore: non_constant_identifier_names
  FirebaseFirestore firestore_dbb;

// ignore: non_constant_identifier_names
  ActionRegis() {
    firestore_dbb = FirebaseFirestore.instance;
  }

  getAllRegis() async {
    final collection = firestore_dbb.collection(collection_register);
    QuerySnapshot res = await collection.get();
    final dataList = res.docs.map((doc) => doc.data()).toList();
    print(dataList);
    return dataList;
  }

  addNewRegis(
    Map<String, dynamic> data,
  ) async {
    final collection = firestore_dbb.collection(collection_register);
    collection.doc(data['name']).set(data);
  }

  updateRegis() async {}

  deleteRegis(String register) async {
    final collection = firestore_dbb.collection(collection_register);
    collection.doc(register).delete();
  }
}
