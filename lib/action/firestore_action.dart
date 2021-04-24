import 'package:cloud_firestore/cloud_firestore.dart';

class ActionData {
  String collection_name = 'kpop';
  FirebaseFirestore firestore_db;

  ActionData() {
    firestore_db = FirebaseFirestore.instance;
  }

  getAllData() async {
    // retrivie data
    final collection = firestore_db.collection(collection_name);
    QuerySnapshot res = await collection.get();
    final dataList = res.docs.map((doc) => doc.data()).toList();
    return dataList; // return type List[]
  }

  addNewRecord(
    Map<String, dynamic> data,
  ) async {
    final collection = firestore_db.collection(collection_name);
    collection.doc(data['name']).set(data);
  }

  /*  
    Example
    ActionData().addNewRecord(
      {
        "key1" : value,
        "key2" : value,
        "key3" : value,
      }
    );
  */

  updateMenu() async {} // รอ

  deleteMenu(String docName) async {
    // Delete with doc name or record name
    final collection = firestore_db.collection(collection_name);
    collection.doc(docName).delete();
  }
}
