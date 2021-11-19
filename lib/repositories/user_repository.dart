import 'package:esports_ec/models/user.dart';
import 'package:esports_ec/services/auth_service.dart';
import 'package:esports_ec/services/firestore_service.dart';

class UserRepository {
  const UserRepository._();

  static final _collection = FirestoreService.getCollectionRef('users');

  static Future<User?> getUserProfile() async {
    final uid = AuthService.firebaseUser?.uid;

    if (uid == null) {
      return null;
    } else {
      final userSnapshot = await _collection.doc(uid).get();
      if (userSnapshot.exists) return User.fromDocumentSnapshot(userSnapshot);
    }
  }

  static Future<void> createProfile({
    required Map<String, dynamic> data,
  }) async {
    final uid = AuthService.firebaseUser?.uid;

    if (uid == null) {
      return;
    } else {
      await _collection.doc(uid).set(data);
    }
  }

  static Future<void> updateProfile({
    required Map<String, dynamic> data,
  }) async {
    final uid = AuthService.firebaseUser?.uid;

    if (uid == null) {
      return;
    } else {
      await _collection.doc(uid).update(data);
    }
  }
}
