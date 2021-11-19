import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  const FirestoreService._();

  static final _firestore = FirebaseFirestore.instance;

  static CollectionReference getCollectionRef(String name) =>
      _firestore.collection(name);

// static Future<DocumentSnapshot> getDocument({
//   required String collectionName,
//   required String docId,
// }) async {
//   return await _firestore.collection(collectionName).doc(docId).get();
// }
//
// static Future<void> setData({
//   required String collectionName,
//   required String docId,
//   required Map<String, dynamic> data,
// }) async {
//   await _firestore.collection(collectionName).doc(docId).set(data);
// }
}
