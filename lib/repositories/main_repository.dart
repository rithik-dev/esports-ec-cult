import 'package:esports_ec/models/instructor.dart';
import 'package:esports_ec/models/user.dart';
import 'package:esports_ec/services/auth_service.dart';
import 'package:esports_ec/services/firestore_service.dart';

class MainRepository {
  const MainRepository._();

  static final _userCollection = FirestoreService.getCollectionRef('users');
  static final _instructorsCollection =
      FirestoreService.getCollectionRef('instructor');

  static Future<User?> getUserProfile() async {
    final uid = AuthService.firebaseUser?.uid;

    if (uid == null) {
      return null;
    } else {
      final userSnapshot = await _userCollection.doc(uid).get();
      if (userSnapshot.exists) return User.fromDocumentSnapshot(userSnapshot);
    }
  }

  static Future<List<Instructor>?> getInstructors() async {
    final _trainersSnapshot = await _instructorsCollection.get();
    return _trainersSnapshot.docs
        .map((e) => Instructor.fromDocumentSnapshot(e))
        .toList();
  }

  static Future<void> createProfile({
    required Map<String, dynamic> data,
  }) async {
    final uid = AuthService.firebaseUser?.uid;

    if (uid == null) {
      return;
    } else {
      data['email'] ??= AuthService.firebaseUser?.email;
      await _userCollection.doc(uid).set(data);
    }
  }

  static Future<void> updateProfile({
    required Map<String, dynamic> data,
  }) async {
    final uid = AuthService.firebaseUser?.uid;

    if (uid == null) {
      return;
    } else {
      await _userCollection.doc(uid).update(data);
    }
  }
}
